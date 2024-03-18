<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EstablishmentRole extends Model
{
    use HasFactory;
    public function establishment()
    {
        return $this->belongsTo(Establishment::class, 'establishment_id');
    }
}
