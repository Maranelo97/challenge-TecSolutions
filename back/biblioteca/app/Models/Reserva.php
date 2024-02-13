<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reserva extends Model
{
    protected $fillable = ['titleDelivered', 'deliveredAt', 'deliveredTo', 'active'];

    public function libro()
    {
        return $this->belongsTo(Libro::class);
    }

    public function usuario()
    {
        return $this->belongsTo(Usuario::class);
    }

     public static function realizarReserva($libroId, $usuarioId)
    {
        // Lógica para realizar la reserva
        $libro = Libro::findOrFail($libroId);
        $usuario = Usuario::findOrFail($usuarioId);

        // Verificar si el libro está disponible
        if ($libro->disponibleParaPrestamo()) {
            // Realizar la reserva
            $reserva = new Reserva([
                'titleDelivered' => $libro->title,
                'deliveredTo' => $usuario->username,
                'active' => true,
            ]);

            $reserva->libro()->associate($libro);
            $reserva->usuario()->associate($usuario);
            $reserva->save();

            // Incrementar el contador de veces entregado del libro
            $libro->incrementarVecesEntregado();

            return $reserva;
        } else {
            // Agregar al usuario a la lista de espera
            $usuario->agregarAListaEspera($libro);

            return null;
        }
    }

    // Método para liberar un libro
    public function liberarLibro()
    {
        // Lógica para liberar el libro
        $this->libro->incrementarVecesEntregado();
        $this->delete();
    }
}
