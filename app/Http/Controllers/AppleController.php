<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AppleController extends Controller
{
    public function validateReceipt(Request $request)
    {
        
        if($request->hasHeader('username') && $request->hasHeader('password') ){
            $username = $request->header('username');
            $password = $request->header('password');
        }else{
            $response = [
                'success' => false,
                'message' => 'Username or password missing',
            ];

            return response()->json($response, 400);
        }


        if($this->checkAuthentication($username,$password) == false ){
            $response = [
                'success' => false,
                'message' => 'authentication  failed',
            ];

            return response()->json($response, 401);
        }

        $validated = $request->validate([
            'client-Token' => 'required',
            'receipt' => 'required',
        ]);


        if($this->checkRecipt($request->receipt)){

            $today = new DateTime("+2 months");
            $expireDate =  $today->format("Y-d-mTG:i:sz");
          
            $response = [
                'success' => true,
                'expireDate' => $expireDate,
                'message' => 'purchase successfully complete',
            ];

            return response()->json($response, 200);
        }else{
            $response = [
                'success' => false,
                'message' => 'invalid Receipt',
            ];

            return response()->json($response, 400);
        }
    }

    public function checkRecipt($recipt){

        $validationNumber = substr($recipt, -1);

        if ($validationNumber % 2 == 0) {
            return true;
        }else{
            return false;
        }
    }

    public function checkAuthentication($username,$password){

        if($username =="username" &&  $password == "12345")
        {
            return true;
        }else{
           return false;
        }
    }
}
