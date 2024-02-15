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
}
