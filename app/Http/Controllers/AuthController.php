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
