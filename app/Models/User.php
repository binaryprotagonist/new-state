<?php

namespace App\Models;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Laravel\Passport\HasApiTokens;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Spatie\Permission\Traits\HasRoles;
use App\Models\Worker;
use Spatie\Permission\Models\Permission;


class User extends Authenticatable
{
    use Notifiable, HasApiTokens, HasRoles;

    protected $guard_name = 'api';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    protected $appends = ['permissionss', 'role'];

    // protected $with = ['worker'];

    public function workable()
    {
        return $this->morphTo();
    }

    public function worker()
    {
        return $this->hasOne(Worker::class);
    }

    public function getRoleAttribute()
    {
        return $this->getRoleNames()->first();
    }

    public function getPermissionssAttribute()
    {
        if($this->hasRole(['Administracio'])) return Permission::all()->pluck('name')->push('Administracio');
        if($this->hasRole(['admin'])) return Permission::all()->pluck('name')->push('admin');
        return $this->getAllPermissions()->pluck('name')->push($this->getRoleAttribute());
    }

    public function messages(){
        $this->hasMany(Message::class);
    }

    public function services(){
        return $this->hasMany('App\Models\Service','user_id','id');
    }


}
