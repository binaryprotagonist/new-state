<?php

namespace App\Http\Controllers\Api;

use App\Models\Provider;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ProviderController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:crud providers')->except(['index']);
    }

    public $types = ['bank', 'provider', 'state'];
    public $payment_methods = ['cash', 'transfer', 'bank'];

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Provider::all();
    }

    protected function validateInput($request)
    {
        return $request->validate([
            'name' => 'required',
            'type' => [
                'required',
                Rule::in($this->types)
            ],
            'cif' => 'required',
            'phone' => 'required',
            'mobile' => 'nullable',
            'address' => 'required',
            'cp' => 'required',
            'population' => 'required',
            'email' => 'required|email',
            'contact_person' => 'required',

            'payment_method' => [
                'nullable',
                'required_if:type,provider',
                Rule::in($this->payment_methods),
            ],
            'entity' => 'required_if:type,provider|nullable',
            'iban' => 'required_if:type,provider|nullable',
            'bic' => 'required_if:type,provider|nullable',
        ]);
    }

    public function show(Request $request, Provider $provider)
    {
        return $provider;
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

        $provider = Provider::create($validated);

        return $provider;
    }

    public function storeGallery(Provider $provider, Request $request)
    {
        $provider->addAllMediaFromRequest()
        ->each(function ($fileAdder) {
            $fileAdder->toMediaCollection('gallery');
        });

        return $provider->gallery;
    }

    public function toggleStatus(provider $provider)
    {
        $provider->toggleStatus();
        return $provider;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Provider  $provider
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Provider $provider)
    {
        $validated = $this->validateInput($request);

        $provider->update($validated);
        return $provider;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Provider  $provider
     * @return \Illuminate\Http\Response
     */
    public function destroy(Provider $provider)
    {
        $provider->delete();
        return response()->json(['msg' => 'Eliminado con éxito']);
    }
}
