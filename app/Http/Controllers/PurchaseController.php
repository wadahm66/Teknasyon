<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Device;
use App\Models\Purchase;
use App\Models\Subscription;
use App\Http\Controllers\SubscriptionController;
use App\Http\Controllers\DeviceController;
use Illuminate\Support\Facades\Http;

class PurchaseController extends Controller
{
    public function purchase(Request $request)
    {
        $validated = $request->validate([
            'clientToken' => 'required',
            'receipt' => 'required',
        ]);

        $clientToken = $request->clientToken;
        $receipt = $request->receipt;

        $deviceController = new DeviceController();

        $deviceData = $deviceController->validateToken($clientToken);

        if(!$deviceData){
            $response = [
                'success' => false,
                'message' => 'Invalid Token',
            ];

            return response()->json($response, 404);
        }

        $purchaseID = $this->createPurchase($deviceData);


        $ConfirmatedPurchase = $this->purchaseConfirmation($clientToken,$deviceData->osType,$purchaseID,$receipt);

        $subscriptionController = new SubscriptionController();

        $subscriptionData = $subscriptionController->addSubscription($deviceData->id,$purchaseID,$ConfirmatedPurchase->expireDate);

        if($subscriptionData){

            $response = [
                'success' => true,
                'message' => 'Error in making Subscription ',
            ];

            return response()->json($response, 200);
        }else{
            $response = [
                'success' => false,
                'message' => 'Error in making Subscription ',
            ];

            return response()->json($response, 404);
        }



    }



    private function createPurchase($deviceData){
        $isAdded = false;

        $today = date('Y-m-d H:i:s');
        $purchase = new Purchase();
        $purchase->purchaseDate  = $today;
        $purchase->status  = 1;
        $purchase->deviceID  = $deviceData->id ;
        $isAdded = $purchase->save();
        if($isAdded){
            return $purchase->id;
        }else{
            $response = [
                'success' => false,
                'message' => 'Error in creating purchase ...',
            ];

            return response()->json($response, 400);
        }

    }

    private function purchaseConfirmation($clientToken,$osType,$purchaseID,$receipt){
        //$receipt = randHash();
        $url = "";

        if($osType == 1){
            $url = config('api.googleApiURL');
        }else if($osType == 2){
            $url = config('api.appleApiURL');
        }
        $response = Http::withHeaders([
            'username' => 'admin',
            'password' => '12345'
        ])->get("http://127.0.0.1:8000/api/GoogleAPI", [
            'client-token' => $clientToken,
            'receipt' => $receipt,
        ]);

        if($response->succes == true){
            updatePurchase($purchaseID,2);
            return $response->expireDate;
        }else{
            updateSuccesPurchase($purchaseID,5);
            $response = [
                'success' => false,
                'message' => 'Error in creating purchase ...',
            ];

            return response()->json($response, 400);
        }
    }

    private function updatePurchaseStatus($purchaseID,$status){
        $purchase = Purchase::find($purchaseID);
        $purchase->status = $status;

        $purchase->save();

    }




}
