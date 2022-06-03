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
Route::get('/recommended/kesenians', 'App\Http\Controllers\KesenianController@getRecommended');
Route::get('/search/kesenians', 'App\Http\Controllers\KesenianController@search');
Route::get('/province/kesenians', 'App\Http\Controllers\KesenianController@province');
Route::get('/dokumentation/{id}', 'App\Http\Controllers\KesenianController@getAllDocumentation');
Route::get('/dokumentation/{id}/{detailId}', 'App\Http\Controllers\KesenianController@getDocumentationById');
Route::post('/documentation/create/{id}', 'App\Http\Controllers\KesenianController@createDocumentation');
Route::patch('/documentation/edit/{id}', 'App\Http\Controllers\KesenianController@editDocumentation');
Route::delete('/documentation/delete/{id}', 'App\Http\Controllers\KesenianController@deleteDocumentation');
