<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;


class storeDeviceRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'uID'    => 'required',
            'appID' => 'required',
            'language'   => 'required',
            'OS'   => 'required',

        ];

        return [
            'uID.required'     => 'A user ID is required.',
            'appID.required'  => 'A App ID is required.',
            'OS.required'     => 'OS is required.',
            'language.required'    => 'language required.'
          ];
    }
}
