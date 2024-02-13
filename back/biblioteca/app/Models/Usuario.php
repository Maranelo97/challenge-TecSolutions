<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Usuario extends Model
{
    protected $fillable = ['username', 'password', 'email', 'historial'];

    public function reservas()
    {
        return $this->hasMany(Reserva::class);
    }

    // Método para obtener el historial de libros prestados por un usuario
    public function historialLibros()
    {
        return $this->historial;
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
