<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Controllerts\DeviceController;
use App\Models\Subscription;

class SubscriptionController extends Controller
{
    private function addSubscription($deviceID,$purchaseID,$expireDate){
        $isAdded = false;

        $today = new DateTime();
        $subscribeDate =  $today->format("Y-d-mTG:i:sz");
        $subscription = new Subscription();
        $subscription->purchaseID  = $purchaseID;
        $purchase->deviceID  = $deviceID;
        $purchase->expireDate  = $expireDate;
        $purchase->subscriptionDate =  $subscribeDate;
        $purchase->status =  1;
        $isAdded = $purchase->save();
       return $isAdded ;

    }

    private function checkSubcription($request){

        $validated = $request->validate([
            'clientToken' => 'required',
        ]);

        $deviceData = $deviceController->validateToken($clientToken);

        $subscription = Device::Subscription('deviceID', '=',  $deviceData->id)->first();
        if ($subscription) {

            $response = [
                'success' => true,
                'subscriptionnStatus' =>  ($subscription->status == 1 ) ? 'Valid subscription' : 'invalid subscription',
                'expire date' => $subscription->expireDate
            ];
            return response()->json($response, 404);
        }else{
            $response = [
                'success' => false,
                'message' => 'Invalid Token',
            ];

            return response()->json($response, 404);
        }


    }

}
