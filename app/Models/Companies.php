<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Companies extends Model
{
    protected $table = 'companies';

    use HasFactory;

    protected $fillable = [
        'name',
        'legal_status',
        'email',
        'phone_number',
        'rib',
        'siret',
        'address_line_one',
        'address_line_two',
        'city',
        'state',
        'country',
        'zip_code',
        'owner_id',
    ];

    public function professional()
    {
        return $this->belongsTo(Professional::class, 'owner_id');
    }
    public function professionals()
    {
        return $this->hasOne(Professional::class, 'id');
    }

    public function establishments()
    {
        return $this->hasMany(Establishment::class, 'company_id');
    }

}
