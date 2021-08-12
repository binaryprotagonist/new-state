<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia\HasMedia;
use Spatie\MediaLibrary\HasMedia\HasMediaTrait;

class Company extends Model implements HasMedia
{
    use HasMediaTrait;
    protected $guarded = [];

    protected $appends = ['gallery'];

    public function registerMediaCollections()
    {
        $this->addMediaCollection('gallery');
    }

    public function getGalleryAttribute()
    {
        return $this->getMedia('gallery')->map(function ($file) {
            $file->url = $file->getFullUrl();
            return $file;
        });
    }
}
