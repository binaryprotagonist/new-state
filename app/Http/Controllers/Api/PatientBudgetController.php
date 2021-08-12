<?php 
namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\PatientInvoice;
use App\Models\PatientInvoiceItem;
use PDF;
use File;

class PatientBudgetController extends Controller {

    private $invoice_type = 2; 
    
    public function __construct(){
        $this->middleware('permission:crud patient_invoices')->except(['index','pdf']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request){
        /*if($request->user()->hasAnyRole(['Referent economic'])){
            return PatientInvoice::select('patient_invoices.*')
                    ->join('patients','patients.id','=','patient_invoices.patient_id')
                    ->join('referents as guardianship','patients.referent_social_guardianship_id','=','guardianship.id')
                    ->join('referents as residence','patients.referent_social_residence_id','=','residence.id')
                    ->where('guardianship.entity_id',$request->user()->workable->entity_id)
                    ->where('residence.entity_id',$request->user()->workable->entity_id)
                    ->where('patient_invoices.type', $this->invoice_type)
                ->get();
        }*/
        return PatientInvoice::where('type', $this->invoice_type)->get();
    }

    /**
     * Store a newly d resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $patient_invoice_id = PatientInvoice::whereRaw('Date(created_at)',date('Y'))->orderBy('id','desc')->limit(1)->first();       
        $patient_id = $request->patient_id;
        $invoice_items = $request->items;

        $patient_invoice = new PatientInvoice();
        $patient_invoice->patient_id = $patient_id;
        $patient_invoice->due_date = date("Y-m-d H:i:s");
        $patient_invoice->title    = 'PRE_' . date('Y') . '_' . $patient_invoice_id->id; 
       // $patient_invoice->title = date('Y').'_'.str_pad($patient_invoice_id->id + 1, 4, "0", STR_PAD_LEFT);//$this->generateRandomString();
        $patient_invoice->description = '';
        $patient_invoice->total = 0;
        $patient_invoice->paid = false;
        $patient_invoice->type = $this->invoice_type;

        $patient_invoice->save();

        $invoice_id = $patient_invoice->id;

        $invoice_total = 0;

        foreach($invoice_items as $invoice_item){
            
            $patient_invoice_item = new PatientInvoiceItem();
            $patient_invoice_item->title = $invoice_item['title'];
            $patient_invoice_item->quantity = $invoice_item['quantity'];
            $patient_invoice_item->price = $invoice_item['price'];
            $patient_invoice_item->tax = $invoice_item['tax'];
            $patient_invoice_item->patient_invoice_id = $invoice_id;

            $patient_invoice_item->save();

            $total_item = ($invoice_item['quantity'] * $invoice_item['price']);
            $iva = ($invoice_item['tax'] / 100 ) * $total_item;
            $total_item = $total_item + $iva;

            $invoice_total += $total_item;
        }

        $patient_invoice->total = $invoice_total;
        $patient_invoice->save();
        
        return $patient_invoice;

    }
    
    public function show(PatientInvoice $patient_invoice,$id) {
        return PatientInvoice::find($id);
    }

    public function update(Request $request){
        
        $invoice_items  = $request->items;
        $invoice_id     = $request->invoice_id;
        $patient_invoice = PatientInvoice::find($invoice_id);
       // $patient_invoice->type = $this->budget;

        $patient_invoice->description = isset($request->summary) && !is_null($request->summary) ? $request->summary : '';
        $patient_invoice->paid = isset($request->paid) && $request->paid == 'pagado' ? 1 : 0;
        

        foreach($patient_invoice->patient_invoice_items as $patient_invoice_item) {
            $patient_invoice_item->delete();
        }
        
        $invoice_total = 0;
        foreach($invoice_items as $invoice_item){
            
            $patient_invoice_item = new PatientInvoiceItem();
            $patient_invoice_item->title = $invoice_item['title'];
            $patient_invoice_item->quantity = $invoice_item['quantity'];
            $patient_invoice_item->price = $invoice_item['price'];
            $patient_invoice_item->tax = $invoice_item['tax'];
            $patient_invoice_item->patient_invoice_id = $invoice_id;
            $patient_invoice_item->save();

            $total_item = ($invoice_item['quantity'] * $invoice_item['price']);
            $iva = ($invoice_item['tax'] / 100 ) * $total_item;
            $total_item = $total_item + $iva;

            $invoice_total += $total_item;
        }

        $patient_invoice->total = $invoice_total;
        $patient_invoice->save();

        return $patient_invoice;

    }

    public function pdf(PatientInvoice $patient_invoice){

        if($patient_invoice == null) return null;

        $pdf = PDF::loadView('patient_invoices.budget', compact('patient_invoice'));
        return $pdf->download("#".$patient_invoice->title . '.pdf');
    }


    public function destroy(PatientInvoice $patient_invoice){
        foreach($patient_invoice->patient_invoice_items as $patient_invoice_item) {
            $patient_invoice_item->delete();
        }
        $patient_invoice->delete();
    }

    private function generateRandomString($length = 10) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return 'PRE_' . date("Ymd") .'_' . strtoupper($randomString);
    }
}

