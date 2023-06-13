<?php

use App\Http\Controllers\OefeningController;
use App\Http\Controllers\PrestatieController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::apiResource('oefeningen', OefeningController::class)->only(['index' , 'show']);
Route::post('/register', [AuthenticationController::class, 'register']);
Route::post('/login', [AuthenticationController::class, 'login']);
Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::get('profile', function(Request $request) {
        return auth()->user();
    });
    Route::apiResource('prestaties', PrestatieController::class);
    Route::apiResource('oefeningen', OefeningController::class)->except(['index', 'show']);
    Route::post('/logout', [AuthenticationController::class, 'logout']);
});
