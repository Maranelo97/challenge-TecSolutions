<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Models\Usuario;

class UsuarioController extends Controller
{

    public function login(Request $request)
    {
        $credentials = $request->only(['email', 'password']);

        $usuario = Usuario::where('email', $credentials['email'])->first();

        if ($usuario) {
            return response()->json(['username' => $usuario->username], 200);
        } else {
            // Credenciales incorrectas
            return response()->json(['error' => 'Credenciales incorrectas'], 401);
        }
    }
    public function index()
    {
        $usuarios = Usuario::all();
        return $usuarios;
    }

    public function show($id)
    {
        $usuario = Usuario::findOrFail($id);
        return $usuario;
    }

}
