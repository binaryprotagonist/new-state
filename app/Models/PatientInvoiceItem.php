<?php 
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\PatientInvoice;

class PatientInvoiceItem extends Model {
    
    protected $guarded = [];

    protected $table = 'patient_invoices_item';

    public function patient_invoice()
    {
        return $this->belongsTo(PatientInvoice::class);
    }
}