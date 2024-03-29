<?php

use Illuminate\Http\Request;
use App\Http\Controllers\LibroController;
use App\Http\Controllers\UsuarioController;
use App\Http\Controllers\ReservaController;
use App\Http\Controllers\AuthController;
use Illuminate\Support\Facades\Route;

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


//Books routes
Route::apiResource('libros', LibroController::class);

//Reservation Routes

Route::apiResource('reservas', ReservaController::class);
Route::post('/reservas/prestar/{libroId}/{usuarioId}', 'App\Http\Controllers\ReservaController@realizarReserva' );
Route::put('/reservas/{reservaId}/devolver','App\Http\Controllers\ReservaController@devolverLibro');

//Ussers Routes
Route::apiResource('usuarios', UsuarioController::class);
Route::post('login', 'App\Http\Controllers\UsuarioController@login');
