<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia\HasMedia;
use Spatie\MediaLibrary\HasMedia\HasMediaTrait;

use App\Models\Referent;
use App\Models\PAI;
use App\Models\PatientInovice;

class Patient extends Model implements HasMedia
{
    use HasMediaTrait;

    protected $guarded = [];

    protected $appends = ['picture','residence_entity','guardianship_entity','gallery','full_name'];
    protected $with = ['patient_invoices'];

    public function getPictureAttribute()
    {
        return optional($this->getFirstMedia('picture'))->getFullUrl() ?: '/img/default-avatar.png' ;
    }

    public function getGalleryAttribute()
    {
        return $this->getMedia('gallery')->map(function ($file) {
            $file->url = $file->getFullUrl();
            return $file;
        });
    }

    public function getFullNameAttribute()
    {
        return $this->name . ' ' . $this->last_name;
    }

    public function registerMediaCollections()
    {
        $this->addMediaCollection('picture')->singleFile();
        $this->addMediaCollection('gallery');
    }

    public function referent_economic_guardianship()
    {
        return $this->hasOne(Referent::class, 'id', 'referent_economic_guardianship_id');
    }

    public function referent_social_guardianship()
    {
        return $this->hasOne(Referent::class, 'id', 'referent_social_guardianship_id');
    }

    public function referent_economic_residence()
    {
        return $this->hasOne(Referent::class, 'id', 'referent_economic_residence_id');
    }

    public function referent_social_residence()
    {
        return $this->hasOne(Referent::class, 'id', 'referent_social_residence_id');
    }

    public function getResidenceEntityAttribute()
    {
        return $this->residency ?? null;
       // return $this->referent_economic_residence ? $this->referent_economic_residence->entity : null;
    }

    public function getGuardianshipEntityAttribute()
    {
        return  $this->guardianship ?? null;
      //return $this->referent_economic_guardianship ? $this->referent_economic_guardianship->entity : null;
    }

    public function toggleStatus()
    {
        $this->active = !$this->active;
        $this->save();
    }

    public function pai()
    {
        return $this->hasOne(PAI::class);
    }

    public function patient_invoices()
    {
        return $this->hasMany(PatientInvoice::class);
    }
}
