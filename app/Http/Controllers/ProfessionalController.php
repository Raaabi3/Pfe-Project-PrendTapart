<?php
// app/Http/Controllers/ProfessionalController.php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;

use App\Models\Establishment;
use App\Models\ProfessionalRoleInEstablishment;
use App\Models\Roles;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;



class ProfessionalController extends Controller
{
    public function getProfessionalsbyRole($professionalId)
    {
        $establishments = Establishment::whereHas('professionalRoles',
         function ($query) use ($professionalId) {
            $query->where('professional_id', $professionalId);
        })->orWhereHas('company', function ($query) use ($professionalId) {
            $query->where('owner_id', $professionalId);
        })->get();

        return response()->json($establishments);
    }

    //get user li 3mal login
    public function profile()
    {
        return Auth::user();
    }
}
