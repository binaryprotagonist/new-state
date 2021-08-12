<?php

namespace App\Http\Controllers\Api;

use App\Models\Invoice;
use App\Models\Provider;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class InvoiceController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Provider $provider)
    { 
        return 'Hello';
        return $provider->invoices;
    }

    protected function validateInput($request)
    {
        return $request->validate([
            'number' => 'required',
            'start_date' => 'nullable|date',
            'due_date' => 'required|date',
            'base' => 'nullable',
            'total' => 'nullable',

            // 'end_date' => 'nullable|date',
            'interests' => 'nullable',

            // 'invoice_date' => 'nullable|date',
            // 'interest' => 'nullable',
            'iva_0' => 'nullable',
            'iva_4' => 'nullable',
            'iva_10' => 'nullable',
            'iva_21' => 'nullable',
            'irpf' => 'nullable',
            'invoice_type' => 'nullable',
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request, Provider $provider)
    {
        $validated = $this->validateInput($request);

        $validated['provider_id'] = $provider->id;
        $invoice = Invoice::create($validated);

        return $invoice;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Invoice  $invoice
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Provider $provider, Invoice $invoice)
    {
        $validated = $this->validateInput($request);

        $invoice->update($validated);
        return $invoice;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Invoice  $invoice
     * @return \Illuminate\Http\Response
     */
    public function destroy(Provider $provider, Invoice $invoice)
    {
        $invoice->delete();
        return response()->json(['msg' => 'Eliminado con éxito']);
    }
}
