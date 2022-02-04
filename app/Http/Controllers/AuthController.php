<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function register(Request $request){
        $fields = $request->validate([
            "name" => "required|string",
            "email" => "required|string|unique:user,email",
            "password" => "required|string|confirmed",
            "role" => "required|integer"
        ]);

        $user =User::create([
            "name" => $fields['name'],
            "email" => $fields['email'],
            "password" => bcrypt($fields['password']),
            "role" => $fields['role'],
        ]);

        $token = $user->createToken($request->userAgent(),[$fields['role']])->plainTextToken;

        $response = [
            'user' => $user,
            'token' => $token,
        ];

        return response($response, 201);

        return $request;
    }

    public function login(Request $request){
        $fields = $request->validate([
            'email' => 'required|string',
            'password' => 'required'|'string',
        ]);
        
        //check email
        $user = User::where('email', $fields['email'])->first();

        if(!$user || !Hash::check($fields['password'], $user->password)){
            return response([
                'message' => 'Invalid Login',
            ], 401);
        }else{
            // ลบ token เก่าออกกาอน แล้วค่อยสร้างใหม่
            $user->token()->delete();
            $token = $user->createToken($request->userAgent(), ["$user->role"])->plainTextToken;

            $response = [
                'user' => $user,
                'token' => $token,
            ];

            return response($request, 200);
        }
    }

    public function logout(Request $request){
        $request->user()->currentAccessToken()->delete();

        return response([
            'message' => 'Logged Out',
        ], 200);
    }
}
