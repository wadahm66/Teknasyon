<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Device;
use App\Http\Requests\storeDeviceRequest;
use Illuminate\Support\Str;

class DeviceController extends Controller
{

    public function store(Request $request)
    {
        $validated = $request->validate([
            'uID' => 'required',
            'appID' => 'required',
            'language' => 'required',
            'osType' => 'required',
        ]);

        if(!$this->isUserExits($request)){
            $token = Str::random(35);
            $device = new Device();

            $device->uID = $request->uID;
            $device->appID = $request->appID;
            $device->language = $request->language;
            $device->osType = $request->osType;
            $device->client_token = $token;
            $isAdded = $device->save();

            if($isAdded)
            {

            $response = [
                'success' => true,
                'token' => $token,
                'message' => 'registered successfully',
            ];

            return response()->json($response, 200);

            }else{

            $response = [
                'success' => false,
                'message' => 'failed to register device',
            ];

            return response()->json($response, 400);
            }


        }else{
            $response = [
                'success' => false,
                'message' => 'device is already registered',
            ];

            return response()->json($response, 200);
        }

    }

    private function isUserExits($request){

        $data = Device::where('uID', '=',  $request->uID)
                             ->where('appID', '=', $request->appID)
                             ->where('osType', '=', $request->osType)
                             ->get();

        if ($data->isEmpty()) {
            return false;
        }else{
            return true;
        }

    }

    public function validateToken($clientToken){

        $data = Device::where('client_token', '=',  $clientToken)->first();
        if ($data) {
            return $data;
        }else{
            return false;
            // $response = [
            //     'success' => false,
            //     'message' => 'Invalid Token',
            // ];

            // return response()->json($response, 404);
        }

    }


}
