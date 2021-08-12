<?php

namespace App\Http\Controllers\Api;

use App\Models\Patient;
use App\Models\PatientInvoice;
use App\Models\Worker;
use App\Models\Task;
use App\Models\PatientType;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use PDF;
use PdfMerger;
use File;

class PatientController extends Controller
{

    public function __construct()
    {
      //  $this->middleware('permission:crud patients')->except(['index','contract','invoices']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if($request->user()->hasAnyRole(['Referent social'])){
            $patients = Patient::select('patients.*')
                         ->join('referents as guardianship','patients.referent_social_guardianship_id','=','guardianship.id')
                         ->join('referents as residence','patients.referent_social_residence_id','=','residence.id')
                         ->where('guardianship.entity_id',$request->user()->workable->entity_id)
                         ->where('residence.entity_id',$request->user()->workable->entity_id)
                         ->get();
        }elseif($request->user()->hasAnyRole(['Administracio','Treballador','Referent economic'])){
            $patients = Patient::all();
         }else {
            $patients = Patient::where('referent_economic_guardianship_id',$request->user()->workable->entity_id)->get();
            $patients1 = Patient::where('referent_economic_residence_id',$request->user()->workable->entity_id)->get();
            $patients = $patients->merge($patients1);
         }
         if($patients->toArray()){
            foreach($patients as $key => $value){
                 if($value->types){
                     $patients[$key]->types = explode(',',$value->types);
                 }else{
                     $patients[$key]->types = array();
                 }
            }    
         }
        return $patients;
    }

    protected function validateInput($request, $patient = null)
    {
        // 'referent_economic_guardianship_id' => 'exists:referents,id',
        // 'referent_social_guardianship_id'   => 'exists:referents,id',
        // 'referent_economic_residence_id'    => 'exists:referents,id',
        // 'referent_social_residence_id'      => 'exists:referents,id',

        return $request->validate([
            'name' => 'required|string',
            'last_name' => 'required',
            'dni' => 'required',
            'birth_date' => 'required',
            'tis' => 'required',
            'situation' => 'required',
            'residence' => 'required',
            'residency' => '',
            'guardianship' => '',
            'referent_economic_guardianship_id' => '',
            'referent_social_guardianship_id'   => '',
            'referent_economic_residence_id'    => '',
            'referent_social_residence_id'      => '',
            'bank' => '',
            'iban' => '',
            'bic' => '',
            'file' => '',
            'type_contract' => 'required',
            'types' => '',
            'residence_address' => '',
            'cp'=>'',
            'population'=> ''
        ]);
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

        $patient = Patient::create(array_except($validated, 'file'));

        if (isset($validated['file'])) {
            $patient->addMediaFromRequest('file')->toMediaCollection('picture');
        }

        return $patient;
    }

    public function storeGallery(Patient $patient, Request $request)
    {
        $patient->addAllMediaFromRequest()
        ->each(function ($fileAdder) {
            $fileAdder->toMediaCollection('gallery');
        });

        return $patient->gallery;
    }
    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Patient  $patient
     * @return \Illuminate\Http\Response
     */
    public function show(Patient $patient)
    {
        return $patient;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Patient  $patient
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Patient $patient)
    {
        $validated = $this->validateInput($request);

        if($validated['residency'] == 'null'){
            $validated['residency'] = Null;
        }

        if($validated['guardianship'] == 'null'){
            $validated['guardianship'] = Null;
        }

        $patient->update(array_except($validated, 'file'));

        if (isset($validated['file'])) {
            $patient->addMediaFromRequest('file')->toMediaCollection('picture');
        }
           
            $patient->load(['referent_economic_guardianship','referent_social_guardianship','referent_economic_residence','referent_social_residence']);
           
            if($patient->types){
                $patient->types = explode(',',$patient->types);
            }else{
                $patient->types = array();
            }
            return $patient;
    }

    public function contractBackUp(Patient $patient)
    {   
        $pages = 16;
        $pdf = new PDF;
        $pdfMerger = PDFMerger::init(); //Initialize the merger

        if (!File::exists(storage_path('temp/'))) {
            File::makeDirectory(storage_path('temp/'));
        }

        $patient->type_contract = isset($patient->type_contract) && !empty($patient->type_contract)
            ? $patient->type_contract : 0;

        for ($i = 0; $i < $pages; $i++) {
            try{

            PDF::loadView('contract.'.$patient->type_contract.'.page'.$i, compact('patient'))->save(storage_path('temp/') . $patient->id . '_contract_' . $i . '.pdf');
            // dd(storage_path('temp/' .  $patient->id . '_contract_' . $i . '.pdf') );

            $pdfMerger->addPDF(storage_path('temp/') . $patient->id . '_contract_' . $i . '.pdf', '2');

            if ($i == $pages - 1) {
                $pdfMerger->merge();
                $pdfMerger->save("file_name.pdf", "browser");

                for ($y = 0; $y < $pages; $y++) {
                    File::delete(storage_path('temp/') . $patient->id . '_contract_' . $y . '.pdf');
                }
            }

            }catch(\Exception $e){
            }

        }
         return view('contract.page2',compact('patient'));
    }

    public function contract(Patient $patient)
    {
        if ($patient->type_contract != '1' && $patient->type_contract != '2') {
            $pages = 21;
            $pdf = new PDF;
            $pdfMerger = PDFMerger::init(); //Initialize the merger

            if (!File::exists(storage_path('temp/'))) {
                File::makeDirectory(storage_path('temp/'));
            }

            $patient->type_contract = isset($patient->type_contract) && !empty($patient->type_contract)
            ? $patient->type_contract : 0;

            for ($i = 0; $i < $pages; $i++) {
                // if($i == '21')
                //      continue;
                PDF::loadView('contractnew.'.$patient->type_contract.'.page'.$i, compact('patient'))->save(storage_path('temp/') . $patient->id . '_contract_' . $i . '.pdf');
              
                $pdfMerger->addPDF(storage_path('temp/') . $patient->id . '_contract_' . $i . '.pdf', '2');

                if ($i == $pages - 1) {
                    $pdfMerger->merge();
                    $pdfMerger->save("file_name.pdf", "browser");

                    for ($y = 0; $y < $pages; $y++) {
                        File::delete(storage_path('temp/') . $patient->id . '_contract_' . $y . '.pdf');
                    }
                }
            }
        }

        if ($patient->type_contract == '1') {
            $pages = 13;
            $pdf = new PDF;
            $pdfMerger = PDFMerger::init(); //Initialize the merger

            if (!File::exists(storage_path('temp/'))) {
                File::makeDirectory(storage_path('temp/'));
            }

            $patient->type_contract = isset($patient->type_contract) && !empty($patient->type_contract)
            ? $patient->type_contract : 0;

            for ($i = 0; $i < $pages; $i++) {
                // if($i == '21')
                //      continue;
                PDF::loadView('contractnew.'.$patient->type_contract.'.page'.$i, compact('patient'))->save(storage_path('temp/') . $patient->id . '_contract_' . $i . '.pdf');
              
                $pdfMerger->addPDF(storage_path('temp/') . $patient->id . '_contract_' . $i . '.pdf', '2');

                if ($i == $pages - 1) {
                    $pdfMerger->merge();
                    $pdfMerger->save("file_name.pdf", "browser");

                    for ($y = 0; $y < $pages; $y++) {
                        File::delete(storage_path('temp/') . $patient->id . '_contract_' . $y . '.pdf');
                    }
                }
            }
        }

    }

    public function test($id,Patient $patient){

        $pdf = new PDF;
        $pdfMerger = PDFMerger::init();

        if(!File::exists(\storage_path('temp/'))){
            File::makeDirectory(storage_path('temp/'));
        }

        $tasks = Task::where('patient_id', '=', $id)->get();
        $total_cost_per_hours = 0;
        $total_expenses = 0;
        $total = 0;

        foreach($tasks as $task){
                foreach($task->hour as $hour){
                    $worker = Worker::Find($hour->worker_id);
    
                    $cost_per_hours = $worker['cost_per_hours'] * $hour->total_hours;
                    $total_cost_per_hours += $cost_per_hours;
                }
    
                foreach($task->expenses as $expense){
                    $total_expenses += $expense->pivot->price;
                }
         
        }
        $total = $total_expenses + $total_cost_per_hours;

        PDF::loadView('invoice', compact('total_expenses', 'total_cost_per_hours', 'total'))->save(storage_path('temp/') . $id . '_invoice_1.pdf');
        $pdfMerger->addPDF(storage_path('temp/') . $id . '_invoice_1.pdf', '1');
        $pdfMerger->merge();
        $pdfMerger->save("file_name.pdf", "browser");
        return ;
        
    }

    public function invoice(Request $request, Patient $patient, PatientInvoice $patient_invoice){

        $pdf = new PDF;
        $pdfMerger = PDFMerger::init();

        if(!File::exists(\storage_path('temp/'))){
            File::makeDirectory(storage_path('temp/'));
        }

        $tasks = Task::where('patient_id', '=', $patient->id)->get();
        $total_cost_per_hours = 0;
        $total_expenses = 0;
        $total = 0;

        foreach($tasks as $task){
            foreach($task->hour as $hour){
                $worker = Worker::Find($hour->worker_id);

                $cost_per_hours = $worker['cost_per_hours'] * $hour->total_hours;
                $total_cost_per_hours += $cost_per_hours;
            }

            foreach($task->expenses as $expense){
                $total_expenses += $expense->pivot->price;
            }
        }
        $total = $total_expenses + $total_cost_per_hours;

       PDF::loadView('invoice', compact('total_expenses', 'total_cost_per_hours', 'total'))->save(storage_path('temp/') . $patient->id . '_invoice_1.pdf');
        $pdfMerger->addPDF(storage_path('temp/') . $patient->id . '_invoice_1.pdf', '1');
        $pdfMerger->merge();
        $pdfMerger->save("file_name.pdf", "browser");
        return ;
    }

    public function toggleStatus(Request $request,Patient $patient)
    {
        $patient->toggleStatus();

        $patient->update([
            "reason" =>  $request->reason
        ]);

        return $patient;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Patient  $patient
     * @return \Illuminate\Http\Response
     */
    public function destroy(Patient $patient)
    {
        $patient->delete();
    }

    public function annexes(Patient $patient){

        if($patient == null) return null;

        if(empty($patient->types) || is_null($patient->types)) return null;
        
          $annexes = array(
              'claus'          => '1',
              'compte bancari' => '2',
              'consentiment'   => '3',
              'cures'          => '4',
              'injectables'    => '5',
              'medicacio'      => '6'
          );

            $reservedAnnexes = explode(',',$patient->types);
            $annexesIds      = [];

            foreach($reservedAnnexes as $value){
                 array_push($annexesIds,$annexes[strtolower($value)]);
            }

            $pages = 7;
            $pdf = new PDF;
            $pdfMerger = PDFMerger::init(); //Initialize the merger

            if (!File::exists(storage_path('temp/'))) {
                File::makeDirectory(storage_path('temp/'));
            }

            $patient->type_contract = isset($patient->type_contract) && !empty($patient->type_contract)
            ? $patient->type_contract : 0;
                   $j = 0;
            
            if($patient->type_contract == 0){
                for ($i = 1; $i <= $pages; $i++) {
    
                      if(!in_array($i,$annexesIds)){
                                 continue ;
                       }
                     
                      $j++;
                
                    PDF::loadView('annexes.page'.$i, compact('patient'))->save(storage_path('temp/') . $patient->id . '_contract_' . $i . '.pdf');
                  
                    $pdfMerger->addPDF(storage_path('temp/') . $patient->id . '_contract_' . $i . '.pdf', '2');
    
                    if ($j == count($annexesIds)) {
                        $pdfMerger->merge();
                        $pdfMerger->save("file_name.pdf", "browser");
    
                        for ($y = 0; $y < $pages; $y++) {
                            File::delete(storage_path('temp/') . $patient->id . '_contract_' . $y . '.pdf');
                        }
                    }
                }
            }

            if($patient->type_contract == 1){

                for ($i = 1; $i <= $pages; $i++) {
    
                      if(!in_array($i,$annexesIds)){
                                 continue ;
                       }
                     
                      $j++;
                
                    PDF::loadView('annexes.1.page'.$i, compact('patient'))->save(storage_path('temp/') . $patient->id . '_contract_' . $i . '.pdf');
                  
                    $pdfMerger->addPDF(storage_path('temp/') . $patient->id . '_contract_' . $i . '.pdf', '2');
    
                    if ($j == count($annexesIds)) {
                        $pdfMerger->merge();
                        $pdfMerger->save("file_name.pdf", "browser");
    
                        for ($y = 0; $y < $pages; $y++) {
                            File::delete(storage_path('temp/') . $patient->id . '_contract_' . $y . '.pdf');
                        }
                    }
                }
            }

            if($patient->type_contract == 2 ){

                for ($i = 1; $i <= $pages; $i++) {
    
                      if(!in_array($i,$annexesIds)){
                                 continue ;
                       }
                     
                      $j++;
                
                    PDF::loadView('annexes.1.page'.$i, compact('patient'))->save(storage_path('temp/') . $patient->id . '_contract_' . $i . '.pdf');
                  
                    $pdfMerger->addPDF(storage_path('temp/') . $patient->id . '_contract_' . $i . '.pdf', '2');
    
                    if ($j == count($annexesIds)) {
                        $pdfMerger->merge();
                        $pdfMerger->save("file_name.pdf", "browser");
    
                        for ($y = 0; $y < $pages; $y++) {
                            File::delete(storage_path('temp/') . $patient->id . '_contract_' . $y . '.pdf');
                        }
                    }
                }
            }

    }

}
