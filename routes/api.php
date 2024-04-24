<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\EstablishmentController;
use App\Http\Controllers\ProfessionalController;
use App\Http\Controllers\EstablishmentProductsController;
use App\Http\Controllers\ProductController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/


Route::middleware('auth:sanctum')->prefix('professionals')->group(function () {
    Route::get('/establishments', [ProfessionalController::class,'getProfessionalsbyRole']);
    Route::get('/profile',[ProfessionalController::class,'profile']);
});
Route::middleware('auth:sanctum')->prefix('establishments')->group(function () {
    Route::get('/{product_id}/size', [ProductController ::class,'getProductsize']);
    Route::get('/{estab_id}/extra', [ProductController ::class,'getProductextra']);
    Route::get('/{estab_id}/categories', [ProductController ::class,'getcategories']);
    Route::get('/{categorie}/Productandoptions', [ProductController ::class,'getProductsAndOptions']);



});

Route::post('/login', [AuthController::class, 'login']);
Route::middleware('auth:sanctum')->post('/logout', [AuthController::class, 'logout']);

// routes/api.php


