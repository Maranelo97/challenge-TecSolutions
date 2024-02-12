<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Reserva;

class ReservaController extends Controller
{
    public function index()
    {
        $reserva = Reserva::all();
        return $reserva;
    }
    public function store(Request $request)
    {
        $reserva = new Reserva();
        $reserva->deliveredAt = $request->deliveredAt;
        $reserva->deliveredTo = $request->deliveredTo;

        $reserva->save();

    }

    public function update(Request $request)
    {
        $reserva = Reserva::findfOrFail($request->id);
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
