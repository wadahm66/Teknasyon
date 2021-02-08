<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Subscriptions extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('subscription', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('purchaseID');
            $table->tinyInteger('status');
            $table->dateTime('expireDate');
            $table->unsignedBigInteger('deviceID');
            $table->dateTime('subscriptionDate');

            $table->foreign('deviceID')->references('id')->on('device');
            $table->foreign('purchaseID')->references('id')->on('purchase');
            $table->index(['status','ExpireDate','subscriptionDate']);
        });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('subscription');
    }
}
