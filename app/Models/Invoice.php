<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Provider;

class Invoice extends Model
{
    protected $guarded = [];

    public function provider()
    {
        return $this->belongsTo(Provider::class);
    }
}
