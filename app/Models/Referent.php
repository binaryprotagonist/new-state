<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Traits\HasUser;
use App\Models\Entity;

class Referent extends Model
{
    use HasUser;

    protected $guarded = [];

    protected $appends = ['name','email','role','role_id'];

    protected $with = ['entity'];

    public function entity()
    {
        return $this->belongsTo(Entity::class);
    }

    public function getNameAttribute()
    {
        return $this->user->name;
    }

    public function getEmailAttribute()
    {
        return $this->user->email;
    }

    public function getRoleAttribute()
    {
        return $this->user->roles->first()->name;
    }

    public function getRoleIdAttribute()
    {
        return $this->user->roles->first()->id;
    }
}
