<?php
// app/Models/Professional.php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Foundation\Auth\User as Authenticatable;
use App\Models\PrefessionalRoleInEstablishment;


class Professional extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $table ='professionals';
    protected $fillable = [
        'first_name',
        'last_name',
        'email',
        'email_verified_at',
        'password',
        'remember_token',
        'current_team_id',
        'profile_photo_path',
        'phone_number',
        'address_line_one',
        'address_line_two',
        'zip_code',
        'country',
        'fcm_token',
        'api_token',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];

    public function company()
    {
        return $this->hasOne(Companies::class, 'professionel_id');
    }
    public function professionalRolesInEstablishment()
    {
        return $this->hasMany(ProfessionalRoleInEstablishment::class, 'professional_id');
    }



    public function roles()
    {
        return $this->belongsToMany(Roles::class, 'professional_roles_in_establishment', 'professional_id', 'role_id');

    }


}

