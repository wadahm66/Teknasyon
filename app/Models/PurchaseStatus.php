<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PurchaseStatus extends Model
{
    protected $table = 'purchase_status';
    protected $primaryKey = 'id';

    public function PurchaseStatus()
    {
        return $this->hasMany('App\Models\Purchase');
    }
}
