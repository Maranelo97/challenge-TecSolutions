<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reserva extends Model
{
    protected $fillable = ['titleDelivered', 'deliveredAt', 'deliveredTo', 'active', 'position'];

    public function libro()
    {
        return $this->belongsTo(Libro::class);
    }

    public function usuario()
    {
        return $this->belongsTo(Usuario::class);
    }


    // Método para liberar un libro
    public function liberarLibro()
    {
        // Lógica para liberar el libro
        $this->delete();
    }
}
