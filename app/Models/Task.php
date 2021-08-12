<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia\HasMedia;
use Spatie\MediaLibrary\HasMedia\HasMediaTrait;
use App\Models\Expenses;
use App\Models\Hour;

class Task extends Model implements HasMedia
{
    use HasMediaTrait;

    protected $casts = [
        'dates' => 'array',
    ];

    protected $guarded = [];
    protected $with = ['patient', 'workers', 'expenses', 'hour'];

    protected $appends = ["gallery"];

    public function getGalleryAttribute()
    {
        return $this->getMedia('gallery')->map(function ($file) {
            $file->url = $file->getFullUrl();
            return $file;
        });
    }

    public function registerMediaCollections()
    {
        $this->addMediaCollection('gallery');
    }

    public function patient()
    {
        return $this->belongsTo(Patient::class);
    }

    public function workers()
    {
        return $this->belongsToMany(Worker::class);
    }

    public function expenses(){
        return $this->belongsToMany(Expenses::class)
                ->withPivot('worker_id', 'price')
                ->withTimestamps();
    }

    public function hour(){
        return $this->hasMany(Hour::class);
    }
}
