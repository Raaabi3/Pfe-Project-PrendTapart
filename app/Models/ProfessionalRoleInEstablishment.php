<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Roles;

class ProfessionalRoleInEstablishment extends Model
{
    protected $table ='professional_roles_in_establishment';
    use HasFactory;
    public function professional()
    {
        return $this->belongsTo(Professional::class, 'id');
    }
    public function role()
    {
        return $this->belongsTo(Roles::class, 'role_id');
    }




}
