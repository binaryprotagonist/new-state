<?php 
namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Patient;
use App\Models\PatientInvoice;
use App\Models\PatientInvoiceItem;
use PDF;
use File;
class PatientInvoicesController extends Controller {

    private $invoice_type = 1;
    
    public function __construct(){
        $this->middleware('permission:crud patient_invoices')->except(['index','pdf','invoiceExcelExport']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request){
        if($request->user()->hasAnyRole(['Referent economic'])){
            return PatientInvoice::select('patient_invoices.*')
                    ->join('patients','patients.id','=','patient_invoices.patient_id')
                    ->join('referents as guardianship','patients.referent_social_guardianship_id','=','guardianship.id')
                    ->join('referents as residence','patients.referent_social_residence_id','=','residence.id')
                    ->where('guardianship.entity_id',$request->user()->workable->entity_id)
                    ->where('residence.entity_id',$request->user()->workable->entity_id)
                    ->where('patient_invoices.type', $this->invoice_type)
                ->get();
        }
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
        $patient_invoice->title = 'FAC_' . date('Y').'_'.str_pad($patient_invoice_id->id + 1, 4, "0", STR_PAD_LEFT);
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
    
    public function show(PatientInvoice $patient_invoice) {
        return  $patient_invoice;
    }

    public function update(Request $request, PatientInvoice $patient_invoice){

        $invoice_items = $request->items;
        $invoice_id = $patient_invoice->id;
        $patient_invoice->type = $this->invoice_type;

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
        $pdf = PDF::loadView('patient_invoices.invoice', compact('patient_invoice'));
        return $pdf->download("#".$patient_invoice->title . '.pdf');
    }

    public function invoiceExcelExport(Request $request){

        $patientId = $request->patient_id;
        $month     = $request->month;
        $year      = $request->year;

        $monthName = date("F", mktime(0, 0, 0, $month, 10));
        $year      = $request->year;

        $patient     = Patient::find($patientId);
        $patientRaw  = ['name' => 'Pacient : ' . $patient->full_name ];
        $monthRaw    = ['name' => 'Mes : ' . $monthName ];
        $yearRaw     = ['name' => 'Curs : ' . $year ];
        $filename = $patient->full_name . '-'.$monthName . '-' . $year .'-invoice-' . '.csv';
        $fp = fopen('php://output', 'w');
        $header = [
            'Date','Title' ,'Price' , 'Queantity' , 'Tax' , 'Sub Total'
        ];	
        header('Content-type: application/csv');
        header('Content-Disposition: attachment; filename='.$filename);
        fputcsv($fp, $patientRaw);
        fputcsv($fp, $monthRaw);
        fputcsv($fp, $yearRaw);
        fputcsv($fp, $header);
        $total= 0;
       if($patient->patient_invoices){
           try{
               foreach($patient->patient_invoices as $patient_invoice_key => $patient_invoice){
                   if(date('m',strtotime($patient_invoice->created_at)) == $month &&  date('Y',strtotime($patient_invoice->created_at)) == $year){
                       if($patient_invoice->patient_invoice_items){
                           foreach($patient_invoice->patient_invoice_items as $patient_invoice_item_key => $patient_invoice_item){
                                   $subTotal = number_format($patient_invoice_item->price * $patient_invoice_item->quantity,2);
                                   $total += $subTotal;
                                   fputcsv($fp, [
                                       'date'      => date('Y-m-d',strtotime($patient_invoice->created_at)),
                                       'title'     => $patient_invoice_item->title,
                                       'price'     => '$ ' . number_format($patient_invoice_item->price,2),
                                       'quantity'  => $patient_invoice_item->quantity,
                                       'tax'       => '$ ' . number_format($patient_invoice_item->tax,2),
                                       'sub_total' => '$ ' . $subTotal
                                   ]);
                           }
                           fputcsv($fp, [ '1' => '' , '2' => '', '3' => '' , '4' => '' , '5'=> 'Total' , '6' => '$ ' . number_format($total,2) ]);
                           exit;
                       }
                  }
               }
           }catch(\Exception $e){

           }
       }
       fputcsv($fp, [ '1' => '' , '2' => '', '3' => '' , '4' => '' , '5'=> 'Total' , '6' => '$ ' . number_format($total,2) ]);
       exit;
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
        return 'FAC_' . date("Y") .'_' . strtoupper($randomString);
        
    }
}

