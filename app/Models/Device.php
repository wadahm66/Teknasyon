<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Device extends Model
{
    protected $table = 'device';
    protected $primaryKey = 'id';

    public function purchase()
    {
        return $this->hasMany('App\Models\Purchase');
    }

    public function subscription()
    {
        return $this->hasMany('App\Models\Subscription');
    }
}
