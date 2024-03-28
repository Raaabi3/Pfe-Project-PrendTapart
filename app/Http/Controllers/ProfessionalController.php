<?php
namespace App\Http\Controllers;
use App\Models\Establishment;
use Illuminate\Support\Facades\Auth;




class ProfessionalController extends Controller
{
    public function getProfessionalsbyRole()
    {
            $establishments = Establishment::whereHas('professionalRoles', function ($query) {
                $query->where('professional_id', Auth::id());
            })->orWhereHas('company', function ($query) {
                $query->where('owner_id', Auth::id());
            })->get();
            return response()->json($establishments);
    }

    //get user li 3mal login
    public function profile()
    {
        return Auth::user();
    }
}
