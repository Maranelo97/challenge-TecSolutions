<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

class Usuario extends Model
{

    use HasApiTokens,Notifiable;
    protected $fillable = ['username', 'password', 'email', 'historial'];
    protected $casts = [
        'historial' => 'array',
    ];


    public function reservas()
    {
        return $this->hasMany(Reserva::class);
    }

    // Método para obtener el historial de libros prestados por un usuario
    public function historialLibros()
    {
        return $this->historial;
    }

    public static function realizarReserva($libroId, $usuarioId)
{
    $libro = Libro::find($libroId);
    $usuario = Usuario::find($usuarioId);

    if ($libro && $usuario) {
        if ($libro->disponibleParaPrestamo()) {
            // Realizar la reserva
            $reserva = new Reserva([
                'titleDelivered' => $libro->title,
                'deliveredTo' => $usuario->username,
                'deliveredAt' => now(),  // Establecer el valor actual de tiempo
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

    return null;
}
    public function agregarAListaEspera($libro)
    {
        // Verificar si el usuario ya está en lista de espera para el libro
        if (!$this->estaEnListaEspera($libro)) {
            // Agregar al usuario a la lista de espera
            $reserva = new Reserva([
                'titleDelivered' => $libro->title,
                'deliveredTo' => $this->username,
                'active' => false, // La reserva está en lista de espera, no activa
            ]);

            $reserva->libro()->associate($libro);
            $reserva->usuario()->associate($this);
            $reserva->save();

            return $reserva;
        }

        return null; // El usuario ya está en lista de espera para este libro
    }

    // Método para verificar si el usuario ya está en lista de espera para un libro
    public function estaEnListaEspera($libro)
    {
        return $this->reservas->where('libro_id', $libro->id)->where('active', false)->count() > 0;
    }
}
