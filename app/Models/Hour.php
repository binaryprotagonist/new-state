<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Task;

class Hour extends Model
{
    protected $fillable = [
        'task_id', 
        'worker_id', 
        'date_worked', 
        'total_hours'
    ];

    public function task(){
        return $this->belongsTo(Task::class);
    }

    public function worker(){
       return $this->hasOne('App\Models\Worker','id','worker_id');
    }
}
