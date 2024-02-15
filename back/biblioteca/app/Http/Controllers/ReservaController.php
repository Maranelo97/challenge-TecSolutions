<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Reserva;
use App\Models\Libro;
use App\Models\Usuario;

class ReservaController extends Controller
{
    public function index()
    {
        $reservas = Reserva::all();
        return $reservas;
    }
    public function show($id)
    {
        $reserva = Reserva::findOrFail($id);
        return $reserva;
    }
    public function store(Request $request)
    {
        $request->validate([
            'deliveredTo' => 'required|string',
        ]);

        $reserva = new Reserva([
            'deliveredTo' => $request->deliveredTo,
            'deliveredAt' => now(),
        ]);

        $reserva->save();

        return response()->json(['message' => 'Reserva creada exitosamente'], 201);
    }



    // En tu método de préstamo en ReservaController
    public function realizarReserva($libroId, $usuarioId)
    {
        $libro = Libro::find($libroId);
        $usuario = Usuario::findOrFail($usuarioId);

        if ($libro && $usuario) {
            // Verificar si el libro ya está prestado
            if ($libro->tieneReservasActivas()) {
                return response()->json(['message' => 'El libro ya está prestado, agregado a la lista de espera'], 200);
            }

            // Realizar la reserva
            $reserva = new Reserva([
                'titleDelivered' => $libro->title,
                'deliveredTo' => $usuario->username,
                'active' => true,
            ]);

            $reserva->libro()->associate($libro);
            $reserva->usuario()->associate($usuario);
            $reserva->save();

            // Actualizar el historial de libros del usuario
            $historial = $usuario->historial ?? [];
            $historial[] = [
                'titulo' => $libro->title,
                'fecha_prestamo' => now(),
            ];
            $usuario->update(['historial' => $historial]);



            // Devolver la información de la reserva
            return response()->json(['message' => 'Reserva creada exitosamente', 'data' => $reserva], 200);
        }

        return response()->json(['message' => 'Error al realizar la reserva'], 500);
    }





    public function prestarLibro(Request $request, $libroId, $usuarioId)
    {
        $reserva = self::realizarReserva($libroId, $usuarioId);

        if ($reserva) {
            return response()->json(['message' => 'Libro prestado exitosamente', 'Reserva' => $reserva], 200);
        } else {
            return response()->json(['message' => 'El libro no está disponible, agregado a la lista de espera'], 200);
        }
    }

    public function devolverLibro(Request $request, $reservaId)
    {
        $reserva = Reserva::find($reservaId);

        if ($reserva) {
            $reserva->liberarLibro();

            return response()->json(['message' => 'Libro devuelto exitosamente'], 200);
        } else {
            return response()->json(['message' => 'Reserva no encontrada'], 404);
        }
    }

    public function update(Request $request)
    {
        $reserva = Reserva::findOrFail($request->id);
        $reserva->deliveredAt = $request->deliveredAt;
        $reserva->deliveredTo = $request->deliveredTo;


        $reserva->save();
        return $reserva;
    }

    public function destroy(Request $request)
    {
        $reserva = Reserva::destroy($request->id);
        return $reserva;
    }
}
