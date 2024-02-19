<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Libro extends Model
{
    protected $fillable = ['title', 'description', 'rating', 'timesDelivered', 'delivered'];

    public function reservas()
    {
        return $this->hasMany(Reserva::class);
    }

    public function tieneReservasActivas()
    {
        return $this->reservas()->where('active', true)->exists();
    }

    // Método para verificar la disponibilidad de préstamo del libro
    public function disponibleParaPrestamo()
    {
        return !$this->delivered && $this->reservas->where('active', true)->count() == 0;
    }

    public function obtenerPrimeraReservaListaEspera()
    {
        return $this->reservas()->where('active', false)->orderBy('position')->first();
    }

    public function liberarLibro()
{
    // Obtener la primera reserva activa
    $reservaActiva = $this->reservas()->where('active', true)->first();

    if ($reservaActiva) {
        // Liberar el libro
        $reservaActiva->liberarLibro();
    }
}


    public function obtenerSiguientePosicionListaEspera()
    {
        return $this->reservas()->max('position') + 1;
    }
}



