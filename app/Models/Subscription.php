<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Subscription extends Model
{
    protected $table = 'subscription';
    protected $primaryKey = 'id';



    public function deviceID(){
        return $this->belongsTo('App\Models\Device' , 'deviceID');
    }

    public function purchaseID(){
        return $this->belongsTo('App\Models\Device' , 'purchaseID');
    }
}
