<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia\HasMedia;
use Spatie\MediaLibrary\HasMedia\HasMediaTrait;
use App\Models\User;
// use App\Traits\HasUser;


class Worker extends Model implements HasMedia
{
    use HasMediaTrait;

    protected $guarded = [];

    protected $appends = ['name', 'email', 'gallery','role_id'];

    public function registerMediaCollections()
    {
        $this->addMediaCollection('gallery');
    }

    public function getRoleIdAttribute(){
        return $this->user->roles->first()->id;
    }

    public function getGalleryAttribute()
    {
        return $this->getMedia('gallery')->map(function ($file) {
            $file->url = $file->getFullUrl();
            return $file;
        });
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function toggleStatus()
    {
        $this->active = !$this->active;
        $this->save();
    }

    public function getNameAttribute()
    {
        return $this->user->name;
    }

    public function getEmailAttribute()
    {
        return $this->user->email;
    }

    public function tasks()
    {
        return $this->belongsToMany(Task::class);
    }
}
