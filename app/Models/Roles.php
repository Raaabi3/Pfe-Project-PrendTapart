<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Roles extends Model
{
    protected $table = 'roles';
    use HasFactory;

    public function professionalEstablishment()
    {
        return $this->belongsTo(ProfessionalRoleInEstablishment::class, 'roles_id');
    }

    protected $fillable = [
        'establishment_id', 'name', 'guard_name', // Add other fillable attributes
    ];
    public function establishment()
    {
        return $this->belongsTo(Establishment::class);
    }


    public function professionals()
    {
        return $this->belongsToMany(Professional::class, 'professional_roles_in_establishment', 'role_id', 'professional_id');
    }
}


