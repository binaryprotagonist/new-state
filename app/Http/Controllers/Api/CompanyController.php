<?php

namespace App\Http\Controllers\Api;

use App\Models\Company;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CompanyController extends Controller
{
    public function __construct()
    {
        $this->middleware('role:Administracio')->except(['index']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Company::find(1) ?: ['a' => 'a'];
    }

    protected function validateInput($request)
    {
        return $request->validate([
            'name' => 'required',
            'cif' => 'required',
            'cp' => 'required',
            'representative' => 'required',
            'address' => 'required',
            'phone' => 'required',
            'email' => 'required|email',
            'map' => 'required',
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

        $company = Company::updateOrCreate(
            ['id' => 1],
            $validated
        );

        return $company;
    }

    public function storeGallery(Request $request)
    {
        $company = Company::find(1);
        $company->addAllMediaFromRequest()
        ->each(function ($fileAdder) {
            $fileAdder->toMediaCollection('gallery');
        });

        return $company->gallery;
    }

    public function deleteGallery($id){
       $status =  \DB::table('media')->where('id',$id)->delete();
       if($status){
           return ['status'=>true,'message'=>'Deleted successfully'];
       }else{
           return ['status'=>false,'message'=>'Failed to delete'];
       }
    }
}
