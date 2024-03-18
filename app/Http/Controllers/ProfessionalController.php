<?php
// app/Http/Controllers/ProfessionalController.php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;

use App\Models\Professional;
use App\Models\ProfessionalRoleInEstablishment;
use App\Models\Roles;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;



class ProfessionalController extends Controller
{

    public function getEstablishments($professional_id)
    {
        $establishments = Professional::with('company.establishments')->findOrFail($professional_id)->company->establishments;
        return response()->json($establishments);
    }
    /*
    public function getProfessionalsRole($professionalId)
    {
        $professional = Professional::with('professionalRolesInEstablishment.role.establishment')
            ->findOrFail($professionalId);

        return response()->json($professional);
    }
    */
    public function getProfessionalsRole($professionalId)
    {
        $establishment = Professional::with('professionalRolesInEstablishment.role.establishment')
            ->findOrFail($professionalId)->professionalRolesInEstablishment->map(function ($role) {
                return $role->role->establishment;
            });
        return response()->json($establishment);
    }

    //get user li 3mal login
    public function profile()
    {
        return Auth::user();
    }
}
