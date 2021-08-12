<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Invoice;
use Spatie\MediaLibrary\HasMedia\HasMedia;
use Spatie\MediaLibrary\HasMedia\HasMediaTrait;

class Provider extends Model implements HasMedia
{
    use HasMediaTrait;

    protected $appends = ['gallery'];

    protected $guarded = [];

    public function invoices()
    {
        return $this->hasMany(Invoice::class);
    }

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

    public function toggleStatus()
    {
        $this->active = !$this->active;
        $this->save();
    }
}
