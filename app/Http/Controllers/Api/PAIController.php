<?php

namespace App\Http\Controllers\Api;

use App\Models\PAI;
use App\Models\Patient;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use PDF;
use PdfMerger;
use File;

class PAIController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\PAI  $pAI
     * @return \Illuminate\Http\Response
     */
    public function show(Patient $patient, PAI $pai)
    {
        return $patient->pai;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\PAI  $pAI
     * @return \Illuminate\Http\Response
     */
    public function edit(PAI $pai)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\PAI  $pAI
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Patient $patient, PAI $pai)
    {
        $validated = $this->validateInput($request);
        $patient->pai->update($validated);
        return $patient->pai;
    }

    protected function validateInput($request)
    {
        return $request->validate([
            'background' => '',
            'diabetes' => '',
            'hypertension' => '',
            'surgical_interventions' => '',
            'diagnostics' => '',
            'allergies' => '',
            'treatment' => '',
            'medication' => '',
            'can_express' => '',
            'medication_complimentary' => '',
            'diet' => '',
            'toxics' => '',
            'exercise' => '',
            'care_aspect' => '',
            'hygiene' => '',
            'roaming' => '',
            'support' => '',
            'recognizes' => '',
            'daily_hygiene' => '',
            'dress_up' => '',
            'bathroom' => '',
            'food' => '',
            'buy' => '',
            'cook' => '',
            'clean_up' => '',
            'new_tech' => '',
            'hobbies' => '',
            'religious' => '',
            'interests' => '',
            'orientation' => '',
            'short' => '',
            'long' => '',
            'storm' => '',
            'recognizes_friends' => '',
            'self_concept' => '',
            'language' => '',
            'compression' => '',
            'behavior' => '',
            'delusions' => '',
            'hallucinations' => '',
            'mood' => '',
            'shows_emotions' => '',
            'manage_emotions' => '',
            'manage_issues' => '',
            'curiosity' => '',
            'somatic' => '',
            'social_relations' => '',
            'family' => '',
            'activities' => '',
            'transportation' => '',
            'inappropriate' => '',
            'aggressiveness' => '',
            'spare_time' => '',
            'personal_satisfaction' => '',
            'schedules' => '',
            'alternative_activities' => '',
            'autonomous' => '',
            'goals' => '',
            'objects' => '',
            'provision' => '',
            'to_work' => '',
            'follow_up' => '',
            'observation' => '',
        ]);
    }

    public function contract(Patient $patient)
    {

        $pdf = new PDF();
        $pdfMerger = PdfMerger::init(); //Initialize the merger
        $pages = 10;
        
        if (!File::exists(storage_path('temp/'))) {
            File::makeDirectory(storage_path('temp/'));
        }
        
        for ($i = 0; $i < $pages; $i++) {
            if($i == 9){
               continue;
             }
                PDF::loadView('pai.page' . $i . '', compact('patient'))->save(storage_path('temp/') . $patient->id . '_contract_' . $i . '_pai.pdf');
                $pdfMerger->addPDF(storage_path('temp/') . $patient->id . '_contract_' . $i . '_pai.pdf', '2');
    
                if ($i == $pages - 1) {
                    $pdfMerger->merge();
                    $pdfMerger->save("file_name.pdf", "browser");
    
                    for ($y = 0; $y < $pages; $y++) {
                        File::delete(storage_path('temp/') . $patient->id . '_contract_' . $y .'_pai.pdf');
                    }
                }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\PAI  $pAI
     * @return \Illuminate\Http\Response
     */
    public function destroy(PAI $pai)
    {
        //
    }
}
