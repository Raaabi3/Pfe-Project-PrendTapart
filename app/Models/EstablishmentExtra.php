<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EstablishmentExtra extends Model
{
    use HasFactory;
    protected $table="establishment_extras";

    public function establishment()
    {
        return $this->belongsTo(Establishment::class);
    }

    public function productExtra()
    {
        return $this->hasOne(EstablishmentProductExtra::class, 'establishment_extra_id');
    }
    public function products()
    {
        return $this->hasMany(Product::class, 'establishment_extra_id');
    }
    public function establishmentProductExtras()
    {
        return $this->hasMany(EstablishmentProductExtra::class);
    }


    public function establishmentProducts()
    {
        return $this->hasManyThrough(EstablishmentProduct::class, EstablishmentProductExtra::class);
    }

}
