<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DeviceController;
use App\Http\Controllers\PurchaseController;
use App\Http\Controllers\GoogleController;
use App\Http\Controllers\AppleController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::post('register', [DeviceController::class, 'store']);


Route::post('purchase', [PurchaseController::class, 'purchase']);

Route::get('GoogleAPI', [GoogleController::class, 'validateReceipt']);

Route::get('AppleAPI', [AppleController::class, 'validateReceipt']);


//Route::get('device', 'DeviceController@index');


