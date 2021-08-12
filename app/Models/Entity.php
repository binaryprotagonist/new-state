<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Referent;

class Entity extends Model
{
    protected $guarded = [];

    public function referents()
    {
        return $this->hasMany(Referent::class);
    }
}
