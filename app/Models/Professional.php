<?php
// app/Models/Professional.php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Foundation\Auth\User as Authenticatable;


class Professional extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $table ='professional';
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

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];

}

