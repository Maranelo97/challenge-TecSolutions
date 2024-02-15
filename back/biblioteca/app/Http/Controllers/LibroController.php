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
        $request->validate([
            'title' => 'required|string',
            'description' => 'required|string',
            'rating' => 'required|integer',
            'timesDelivered' => 'required|integer',
            'delivered' => 'required|boolean',
            'created_at' => 'required|date'
        ]);

        $libro = new Libro();
        $libro->title = $request->input('title');
        $libro->description = $request->input('description');
        $libro->rating = $request->input('rating');
        $libro->timesDelivered = $request->input('timesDelivered');
        $libro->delivered = $request->input('delivered');
        $libro->created_at = $request->input('created_at');

        $libro->save();

        return response()->json(['message' => 'Libro creado exitosamente'], 201);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'title' => 'required|string',
            'description' => 'required|string',
            'rating' => 'required|integer',
            'timesDelivered' => 'required|integer',
            'delivered' => 'required|boolean',
        ]);

        $libro = Libro::findOrFail($id);
        $libro->update($request->all());

        return response()->json(['message' => 'Libro actualizado exitosamente'], 200);
    }
    public function destroy(Request $request)
    {
        $libro = Libro::destroy($request->id);
        return $libro;
    }
}
