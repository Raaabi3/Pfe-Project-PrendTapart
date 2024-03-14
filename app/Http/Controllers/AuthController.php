<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\Professional;


class AuthController extends Controller
{
    public function register(Request $request)
    {
        $request->validate([
            'first_name' => 'required|string',
            'last_name' => 'required|string',
            'email' => 'required|email|unique:professionals,email',
            'password' => 'required|min:6',
        ]);

        $professional = Professional::create([
            'first_name' => $request->input('first_name'),
            'last_name' => $request->input('last_name'),
            'email' => $request->input('email'),
            'password' => Hash::make($request->input('password')),
        ]);
        $token = $professional->createToken('auth_token')->plainTextToken;
        return response()->json(['token' => $token], 201);
    }


    // Login
    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $credentials = $request->only('email', 'password');
        if (Auth::attempt($credentials)) {
            $professional = Auth::user();
            $token = $professional->createToken('auth_token')->plainTextToken;
            return response()->json(['token' => $token], 201);
        }

        return response()->json(['error' => 'The provided credentials are incorrect.'], 401);
    }




    public function logout(Request $request)
{
     auth()->user()->tokens()->delete();
            return response()->json(['message' => 'bye bye']);
    }
}
