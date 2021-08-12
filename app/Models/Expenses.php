<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Task;
class Expenses extends Model
{
    protected $guarded = [];

    public function task(){
        return $this->belongsToMany(Task::class)
                                                ->withPivot('worker_id', 'price')
                                                ->withTimestamps();
    }


}
