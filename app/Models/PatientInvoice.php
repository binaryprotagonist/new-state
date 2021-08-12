<?php 
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Patient;
use App\Models\PatientInvoiceItem;

class PatientInvoice extends Model {
    
    protected $guarded = [];

    protected $table = 'patient_invoices';

    protected $with = ['patient_invoice_items'];

    public function patient()
    {
        return $this->belongsTo(Patient::class);
    }

    public function patient_invoice_items()
    {
        return $this->hasMany(PatientInvoiceItem::class);
    }
}