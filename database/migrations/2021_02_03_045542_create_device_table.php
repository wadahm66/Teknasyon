<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDeviceTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('os_type', function (Blueprint $table) {
            $table->id();
            $table->string('title');

        });

        DB::connection('mysql')->table('os_type')->insert([
            [
                'title' => 'Android'
            ],
            [
                'title' => 'IOS'
            ]
        ]);

        Schema::create('device', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('uID');
            $table->unsignedBigInteger('appID');
            $table->string('language');
            $table->unsignedBigInteger('osType');
            $table->string('client_token')->nullable();
            $table->timestamps();


            $table->foreign('osType')->references('id')->on('os_type');
            $table->index(['uID', 'appID','osType']);

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('device');
        Schema::dropIfExists('os_type');
    }
}
