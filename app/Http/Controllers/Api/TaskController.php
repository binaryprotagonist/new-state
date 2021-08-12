<?php

namespace App\Http\Controllers\Api;

use App\Models\Task;
use App\Models\Hour;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use DB;
use PDF;
use PdfMerger;
use File;


class TaskController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
         if($request->user()->hasAnyRole(['Referent social'])){
            $tasks =  Task::select('tasks.*')
                ->join('patients','patients.id','=','tasks.patient_id')
                ->join('referents as guardianship','patients.referent_social_guardianship_id','=','guardianship.id')
                ->join('referents as residence','patients.referent_social_residence_id','=','residence.id')
                ->where('guardianship.entity_id',$request->user()->workable->entity_id)
                ->where('residence.entity_id',$request->user()->workable->entity_id)
            ->get();
         }elseif($request->user()->hasAnyRole(['Treballador'])){
                $tasks = Task::select('tasks.*')
                       ->where('status','pendents')
                       ->get();
            }else {
               $tasks = Task::with('patient')->get();
         } 

         if($tasks->toarray()){
             foreach($tasks as $key => $value){
                   $tasks[$key]->task_start_date = date('Y-m-d',strtotime($value->start_date));
                   $tasks[$key]->task_end_date   = date('Y-m-d',strtotime($value->end_date));
                   $tasks[$key]->task_start_time = date('h:i A',strtotime($value->start_date));
                   $tasks[$key]->task_end_time   = date('h:i A',strtotime($value->end_date));
                   $tasks[$key]->task_s          = date('Y-m-d',strtotime($value->start_date)) . 'T' . date('H:i:s',strtotime($value->start_date));
                   $tasks[$key]->task_e          = date('Y-m-d',strtotime($value->end_date)) . 'T' . date('H:i:s',strtotime($value->end_date));
             }
             return $tasks;
         }else{
             return array();
         }
    }

    public function show(Task $task)
    {
        return $task;
    }

    protected function validateInput($request, $task = null)
    {
        return $request->validate([
            'start_date' => 'required|date',
            'end_date' => 'required|date',
            'status' => 'required|string',
            'dates' => 'array', // Json
            'description' => '',
            'visit_type' => 'required|string',
            'patient_id' => 'required|exists:patients,id',
            'service_id' => ''
        ]);
    }

    public function storeGallery(Task $task, Request $request)
    {
        // dd("aaaa");

        $task->addAllMediaFromRequest()
        ->each(function ($fileAdder) {
            $fileAdder->toMediaCollection('gallery');
        });

        return $task->gallery;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validated = $this->validateInput($request);

        $task = Task::create($validated);

        return $task->loadMissing('patient');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Task  $task
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Task $task)
    {
        $validated = $this->validateInput($request, $task);

        $task->update($validated);

        return $task->loadMissing('patient');
    }

    public function assignWorker(Request $request, Task $task)
    {
        $validated = $request->validate([
            'workers_id' => 'required|exists:workers,id'
        ]);

        $task->workers()->sync($validated['workers_id']);
        $task = $task->load(['workers']);
        if(!$task->workers->isEmpty()){
            $task->update(
                ['status' => 'asignades']
            );
        }else {
            $task->update(
                ['status' => 'pendents']
            );
        }

        return $task;
    }

    public function syncExpenses(Request $request, Task $task){
        $validated = $request->validate([
            'expenses' => 'required'
        ]);

         // dd($validated['expenses']);
         //  $task->expenses()->sync([
         //      $validated['expenses']['expense_id'] => [
         //          'worker_id' => $validated['expenses']['worker_id'],
         //          'price' => $validated['expenses']['price']
         //      ]
         //  ]);

         \DB::table('expenses_task')->insert([
                'expenses_id' => $validated['expenses']['expense_id'],
                'worker_id'   => $validated['expenses']['worker_id'],
                'price'       => $validated['expenses']['price'],
                'task_id'     => $task->id
        ]);
        
        return $task->load(['expenses']);
    }

    public function syncHours(Request $request, Task $task){
        $validator = $this->validateHour();

        if(!$validator->fails()){
            $hour = new Hour($validator->validate());
            $task->hour()->save($hour);
        }

        return $task->load(['hour']);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Task  $task
     * @return \Illuminate\Http\Response
     */
    public function destroy(Task $task)
    {
        Hour::where('task_id',$task->id)->delete();
        $sql = "DELETE FROM `tasks` WHERE id = ".$task->id;
        DB::delete($sql);
        return response()->json(['msg' => 'Eliminado con éxito']);
    }

    public function validateHour(){
        return Validator::make(request()->all(), [
            'worker_id' => 'required|integer',
            'date_worked' => 'required|date',
            'total_hours' => 'required|integer',
        ]);
    }

    public function finishTask(Request $request){
        $task = Task::find($request->id);

        $dates = $task->dates;

        if($dates['periodic']['type'] == 'months' || $dates['periodic']['type'] == 'weeks' || $dates['periodic']['type'] == 'month' ){
            if($dates['periodic']['frequency']['number'] > 0){
                $newTask = $task->replicate();
                $dates['periodic']['frequency']['number'] =  ($dates['periodic']['frequency']['number'] - 1 ) ;
                $newTask->dates = $dates;
                $newTask->status = 'pendents';
                $newTask->save();
            }
        }

        $task->update(
            ['status' => 'completades']
        );

        return $task;
    }

    public function invoice($id){
        $task = Task::find($id);
        $totalPrice = 0;
        if($task->expenses){
            foreach($task->expenses as $p){
                 $totalPrice += $p->pivot->price;
            }
        }
        $task->total_price = $totalPrice;
        $totalHours = 0;
        if($task->hour){
            $totalHours = array_sum(array_column($task->hour->toArray(),'total_hours'));
        }
            $task->total_hours = $totalHours;
            return $task;
            $pages = 4;
            $pdf = new PDF;
            $pdfMerger = PDFMerger::init(); //Initialize the merger

            if (!File::exists(storage_path('temp/'))) {
                File::makeDirectory(storage_path('temp/'));
            }

            for ($i = 0; $i < $pages; $i++) {
                
                PDF::loadView('taskinvoice.'.$i, compact('task'))->save(storage_path('temp/') . $task->id . '_task_invoice_' . $i . '.pdf');
              
                $pdfMerger->addPDF(storage_path('temp/') . $task->id . '_task_invoice_' . $i . '.pdf', '2');

                if ($i == $pages - 1) {
                    $pdfMerger->merge();
                    $pdfMerger->save("file_name.pdf", "browser");

                    for ($y = 0; $y < $pages; $y++) {
                        File::delete(storage_path('temp/') . $task->id . '_task_invoice_' . $y . '.pdf');
                    }
                }
            }
    }

        public function invoiceExcel($id){
            $task = Task::find($id);
            $totalPrice = 0;
            if($task->expenses){
                foreach($task->expenses as $p){
                     $totalPrice += $p->pivot->price;
                }
            }
            $task->total_price = $totalPrice;
            $totalHours = 0;
            if($task->hour){
                $totalHours = array_sum(array_column($task->hour->toArray(),'total_hours'));
            }
             $task->total_hours = $totalHours;
             $hoursData = array();
             $totalHours = 0;
             $totalSubTotal = 0;
             $workerName = array();
            if($task->hour){
                foreach($task->hour as $key => $h){
                    if($key == 0){
                        array_push($workerName,['name'=> 'Treballador : ' . $h->worker->last_name]);
                    }
                    $totalHours    += $h->total_hours;
                    $totalSubTotal += number_format($h-> total_hours * $h->worker->cost_per_hours,2);
                    array_push($hoursData,[
                    'date'  => date('Y-m-d',strtotime($h->date_worked)),
                    'hours' => $h->total_hours,
                    'cost_per_hour' => '$ ' . $h->worker->cost_per_hours,
                    'sub_total'     => '$ ' . number_format($h-> total_hours * $h->worker->cost_per_hours,2)
                    ]);
                }
                array_push($hoursData,[]);
                array_push($hoursData,[
                    'date'          => '',
                    'hours'         => '',
                    'cost_per_hour' => 'Total',
                    'sub_total'     => '$ ' . number_format($totalSubTotal,2)
                ]);
                $filename = "task-hours.csv";
                $fp = fopen('php://output', 'w');
                $header = [
                    'Date','Hours' ,'Cost Per Hour' , 'Sub Total'
                ];	
                header('Content-type: application/csv');
                header('Content-Disposition: attachment; filename='.$filename);
                fputcsv($fp, $workerName[0]);
                fputcsv($fp, $header);
                foreach ($hoursData as $fields) {
                    fputcsv($fp, $fields);
                }
                exit;
            }else{
                $filename = "task-hours.csv";
                $fp = fopen('php://output', 'w');
                $header = [
                    'Date','Hours' ,'Cost Per Hour' , 'Sub Total'
                ];	
                header('Content-type: application/csv');
                header('Content-Disposition: attachment; filename='.$filename);
                fputcsv($fp, $header);
                exit;
            }

        }
}
