<?php

namespace App\Http\Controllers\Api;

use App\Models\Entity;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class EntityController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:crud entities')->except(['index']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Entity::all();
    }

    protected function validateInput($request)
    {
        return $request->validate([
            'name' => 'required',
            'population' => 'required',
            'cp' => 'required',
            'cif' => 'required',
            'province' => 'required',
            'address' => 'required',
            'phone' => 'required',

            'bank' => 'required',
            'iban' => 'required',
            'bic' => 'required',
            'type' => 'required',
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

        $entity = Entity::create($validated);

        return $entity;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Entity  $entity
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Entity $entity)
    {
        $validated = $this->validateInput($request);

        $entity->update($validated);
        return $entity;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Entity  $entity
     * @return \Illuminate\Http\Response
     */
    public function destroy(Entity $entity)
    {
        $entity->delete();
        return response()->json(['msg' => 'Eliminado con éxito']);
    }
}
