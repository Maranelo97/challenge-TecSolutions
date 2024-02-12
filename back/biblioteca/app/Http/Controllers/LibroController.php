<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Libro;

class LibroController extends Controller
{
    public function index(Request $request)
    {
        $nombre = $request->input('nombre');

        if ($nombre) {
            $libro = Libro::where('title', 'like', '%' . $nombre . '%')->first();

            if (!$libro) {
                return response()->json(['message' => 'Libro no encontrado'], 404);
            }

            return [$libro];
        } else {
            $libros = Libro::all();
            return $libros;
        }
    }

    public function store(Request $request)
    {
        $libro = new Libro();
        $libro->title = $request->title;
        $libro->description = $request->description;
        $libro->rating = $request->rating;
        $libro->timesDelivered = $request->timesDelivered;
        $libro->delivered = $request->delivered;
        $libro->created_at = $request->created_at;
        $libro->updated_at = $request->updated_at;

        $libro->save();
    }

    public function update(Request $request)
    {
        $libro = Libro::findfOrFail($request->id);
        $libro->title = $request->title;
        $libro->description = $request->description;
        $libro->rating = $request->rating;
        $libro->timesDelivered = $request->timesDelivered;
        $libro->delivered = $request->delivered;

        $libro->save();
        return $libro;
    }

    public function destroy(Request $request)
    {
        $libro = Libro::destroy($request->id);
        return $libro;
    }
}
