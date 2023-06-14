<?php

namespace App\Http\Controllers;

use App\Models\oefening;
use Illuminate\Http\Request;

class OefeningController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return oefening::select('name', 'description', 'explanation', 'GIF')->get();
    }

    public function IndexNL()
    {
        return oefening::select('name_nl as name','description_nl as description', 'explanation_nl as explanation', 'GIF')->get();
    }

    /**
     * Display the specified resource.
     */
    public function show(oefening $oefening)
    {
        return $oefening;
    }
    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        return oefening::create($request->only(['name', 'name_nl','description','description_nl','explanation','explanation_nl','GIF']));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, oefening $oefening)
    {
        $oefening->update($request->all());
        return $oefening;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(oefening $oefening)
    {
        $oefening->delete();
    }

}
