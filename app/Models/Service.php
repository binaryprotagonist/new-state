<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class Service extends Model
{
    protected $guarded = [];

    protected $fillable = [
        'name', 'user_id', 'cost_per_hour'
    ];

    public function user()
    {
        return $this->hasOne(User::class);
    }
}
