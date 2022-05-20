<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\KesenianController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::resource('kesenians', App\Http\Controllers\KesenianController::class);
// Route::get('/kesenians', 'KesenianController@index');
// Route::get('/kesenians/{id}', 'KesenianController@detail');
// Route::post('/kesenians/store', 'KesenianController@store');
// Route::post('/kesenians/update/{id}', 'KesenianController@update');
// Route::delete('/kesenians/delete/{id}', 'KesenianController@destroy');
