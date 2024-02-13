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

    // Método para verificar la disponibilidad de préstamo del libro
    public function disponibleParaPrestamo()
    {
        return !$this->delivered && $this->reservas->where('active', true)->count() == 0;
    }

    // Método para incrementar el contador de veces entregado del libro
    public function incrementarVecesEntregado()
    {
        $this->increment('timesDelivered');
        $this->update(['delivered' => false]);
    }
}
