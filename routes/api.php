<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\EstablishmentController;
use App\Http\Controllers\ProfessionalController;
use App\Http\Controllers\EstablishmentProductsController;



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
Route::middleware('auth:sanctum')->prefix('establishments')->group(function () {
    Route::get('/{establishmentId}/products', [EstablishmentProductsController::class, 'index']);
    Route::get('/{establishmentId}/professionals', [EstablishmentController::class, 'getProfessionals']);
});

Route::middleware('auth:sanctum')->prefix('professionals')->group(function () {
    Route::get('/{professional_id}/establishments', [ProfessionalController::class, 'getEstablishments']);
    Route::get('/{professional_id}/role', [ProfessionalController::class,'getProfessionalsRole']);
    Route::get('/profile',[ProfessionalController::class,'profile']);
});
Route::post('/login', [AuthController::class, 'login']);
Route::middleware('auth:sanctum')->post('/logout', [AuthController::class, 'logout']);

// routes/api.php


