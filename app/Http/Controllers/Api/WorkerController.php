<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use App\Models\Worker;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Hour;

class WorkerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $worker = Worker::with('user')->get();
        if(!empty($worker)){
            foreach($worker as $w){
                $w->academic_training = explode(",",$w->academic_training);
                $w->work_experience = explode(",",$w->work_experience);
            }
        }
        return $worker;
    }

    public function show(Worker $worker)
    {
        if(!empty($worker)){
            $worker->academic_training = explode(",",$worker->academic_training);
            $worker->work_experience = explode(",",$worker->work_experience);
        }
        return $worker->loadMissing('user');
    }

    protected function validateInput($request, $worker = null)
    {
        return $request->validate([
            // User
            'name' => 'required|string',
            'email' => [
                'required',
                'string',
                'email',
                is_null($worker) ? 'unique:users,email' : Rule::unique('users')->ignore($worker->user)
            ],
            'password' => [
                is_null($worker) ? 'required' : 'nullable'
            ],
            // Worker
            'last_name' => 'required|string',
            'dni' => 'required|string',
            'address' => 'required|string',
            'cp' => 'required|string',
            'population' => 'required|string',
            'phone' => 'required|string',
            'mobile' => 'nullable|string',
            'birth_date' => 'required|date',
            'company_email' => 'required|string|email',
            'banking_entity' => 'required|string',
            'iban' => 'required|string',
            'bic' => 'required|string',
            'academic_training' => 'nullable',
            'work_experience' => 'nullable',
            'type_of_contract' => 'required|string',
            'working_day' => 'required|string',
            'initial_date' => 'required|date',
            'renewal_date' => 'required|date',
            'contract_duration' => 'required|string',
            'category' => 'required|string',
            'import' => 'required|string',
            'irpf' => 'required|string',
            'total_import' => 'required|string',
            'role_id' => 'required|exists:roles,id',
            'cost_per_hours' => 'required',
        ]);
    }

    public function storeGallery(Worker $worker, Request $request)
    {
        $worker->addAllMediaFromRequest()
        ->each(function ($fileAdder) {
            $fileAdder->toMediaCollection('gallery');
        });

        return $worker->gallery;
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

        $validated['password'] = Hash::make($validated['password']);
        $user = User::create(array_only($validated, ['email', 'name', 'password']));
        $validated['user_id'] = $user->id;

        $user->syncRoles($validated['role_id']);

        $worker = Worker::create(array_except($validated, ['email', 'name', 'password','role_id']));
        if(!empty($worker)){
            $worker->academic_training = explode(",",$worker->academic_training);
            $worker->work_experience = explode(",",$worker->work_experience);
    }
        return $worker->loadMissing('user');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Worker  $worker
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Worker $worker)
    {
        $validated = $this->validateInput($request, $worker);

        if (array_key_exists('password', $validated)) {
            $validated['password'] = Hash::make($validated['password']);
        }
        $worker->user->update(array_only($validated, ['email', 'name', 'password']));

        $worker->user->syncRoles($validated['role_id']);

        $worker->update(array_except($validated, ['email', 'name', 'password','role_id']));
        if(!empty($worker)){
                $worker->academic_training = explode(",",$worker->academic_training);
                $worker->work_experience = explode(",",$worker->work_experience);
        }



        return $worker->loadMissing('user');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Worker  $worker
     * @return \Illuminate\Http\Response
     */
    public function destroy(Worker $worker)
    {
        $user = $worker->user;
        $worker->delete();
        $user->delete();
        return response()->json(['msg' => 'Eliminado con éxito']);
    }

    public function toggleStatus(Worker $worker)
    {
        $worker->toggleStatus();
        return $worker;
    }

    public function workerInvoiceExcel(Request $request){
        $worker = Worker::find($request->worker);
        $month  = $request->month;
        $year   = $request->year;

        $monthNum = $request->month;
        $monthName = date("F", mktime(0, 0, 0, $monthNum, 10));
        $year      = $request->year;

        $hours =  Hour::where('worker_id',$request->worker)
                        ->where(function($query) use ($request){
                              if($request->month){
                                  $query->whereMonth('date_worked',$request->month);
                              }
                              if($request->year){
                                $query->whereYear('date_worked',$request->year);
                              }
                        })
                        ->get();

        $totalHours = 0;
        if($hours){
            $totalHours = array_sum(array_column($hours->toArray(),'total_hours'));
        }
         $hours->total_hours = $totalHours;
         $hoursData = array();
         $totalHours = 0;
         $totalSubTotal = 0;
         $workerName = [ 'name' => 'Treballador : ' . $worker->last_name];
         $monthRow   = [ 'name' => 'Mes : ' . $monthName];
         $yearRow    = [ 'name' => 'Curs : ' . $year];
        if($hours){
            foreach($hours as $key => $h){
                $totalHours    += $h->total_hours;
                $totalSubTotal += number_format($h-> total_hours * $worker->cost_per_hours,2);
                array_push($hoursData,[
                'date'  => date('Y-m-d',strtotime($h->date_worked)),
                'hours' => $h->total_hours,
                'cost_per_hour' => '$ ' . $worker->cost_per_hours,
                'sub_total'     => '$ ' . number_format($h-> total_hours * $worker->cost_per_hours,2)
                ]);
            }
            array_push($hoursData,[
                'date'          => '',
                'hours'         => '',
                'cost_per_hour' => 'Total',
                'sub_total'     => '$ ' . number_format($totalSubTotal,2)
            ]);
            $filename = "worker-hours.csv";
            $fp = fopen('php://output', 'w');
            $header = [
                'Date','Hours' ,'Cost Per Hour' , 'Sub Total'
            ];
            header('Content-type: application/csv');
            header('Content-Disposition: attachment; filename='.$filename);
            fputcsv($fp, $workerName);
            fputcsv($fp, $monthRow);
            fputcsv($fp, $yearRow);
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
