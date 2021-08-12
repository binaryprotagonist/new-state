<?php

namespace App\Http\Controllers\Api;

use App\Models\Expenses;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;


class ExpensesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Expenses::all();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $exp = Expenses::create($request->all());
        return $exp;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Expenses  $expense
     * @return \Illuminate\Http\Response
     */
    public function show(Expenses $expense)
    {
        return $expense;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Expenses  $expense
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Expenses $expense)
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
    public function destroy(Expenses $expense)
    {
        $expense->delete();
    }
}
