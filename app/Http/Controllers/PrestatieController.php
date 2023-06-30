<?php

namespace App\Http\Controllers;

use App\Models\prestatie;
use Illuminate\Http\Request;

class PrestatieController extends Controller
{
    public function showPrestaties($id)
    {
        return prestatie::where('user_id', $id)->get();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        return prestatie::create($request->only(['oefening_id','amount', 'date','time','user_id']));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, prestatie $prestatie)
    {
        $prestatie->update($request->all());
        return $prestatie;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(prestatie $prestatie)
    {
        $prestatie->delete();
    }
}
