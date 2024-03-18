<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Establishment;

class EstablishmentController extends Controller
{
    public function getProfessionals($establishmentId)
    {
        $professional = Establishment::with('company.professional.professionalRolesInEstablishment.role')->findOrFail($establishmentId)->company->professional;
        return response()->json($professional);
    }
}
