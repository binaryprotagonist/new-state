<?php

namespace App\Http\Controllers\Api;

use App\Models\Hour;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;


class HoursController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Hour::all();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $exp = Hour::create($request->all());
        return $exp;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Hours  $hour
     * @return \Illuminate\Http\Hours
     */
    public function show(Hour $hour)
    {
        return $hour;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Hours  $hours
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Hour $hour)
    {
       $expense->update($request->all());
        return $expense;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Expenses  $expense
     * @return \Illuminate\Http\Response
     */
    public function destroy(Hour $hour)
    {
        $hour->delete();
    }
}