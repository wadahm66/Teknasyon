<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Purchase extends Model
{
    protected $table = 'Purchase';
    protected $primaryKey = 'id';

    public function subscription()
    {
        return $this->hasMany('App\Models\Subscription');
    }

    public function status(){
        return $this->belongsTo('App\Models\PurchaseStatus' , 'status');
    }

    public function deviceID(){
        return $this->belongsTo('App\Models\Device' , 'deviceID');
    }


}
