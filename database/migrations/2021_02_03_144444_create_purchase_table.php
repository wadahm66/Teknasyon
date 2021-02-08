<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePurchaseTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('purchase_status', function (Blueprint $table) {
            $table->id();
            $table->string('title');
        });

       DB::table('purchase_status')->insert([
            [
                'title' => 'Started'
            ],
            [
                'title' => 'Renewed'
            ],
            [
                'title' => 'Canceled'
            ],
            [
                'title' => 'Expired'
            ]
            ,
            [
                'title' => 'Failed'
            ]
            ]
        );



        Schema::create('purchase', function (Blueprint $table) {
            $table->id();
            $table->dateTime('purchaseDate');
            $table->unsignedBigInteger('status');
            $table->unsignedBigInteger('deviceID');
            $table->timestamps();

            $table->foreign('deviceID')->references('id')->on('device');
            $table->foreign('status')->references('id')->on('purchase_status');
            $table->index(['purchaseDate', 'status']);
        });



    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('purchase');
        Schema::dropIfExists('purchase_status');
        Schema::dropIfExists('pending_purchase');
    }
}
