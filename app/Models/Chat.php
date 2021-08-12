<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Message;
use App\Models\User;

class Chat extends Model
{
    protected $guarded = [];


    public function messages(){
        return $this->hasMany(Message::class);
    }

    public function getRolesAttribute($attr){
        return json_decode($attr,true);
    }
}
