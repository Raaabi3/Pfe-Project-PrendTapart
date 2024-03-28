<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EstablishmentProductExtra extends Model
{
    use HasFactory;
    protected $table="establishment_product_extra";

    public function establishmentproduct(){
        return $this->belongsTo(EstablishmentProduct::class, 'establishment_product_id');
    }

    public function establishmentextra(){
        return $this->belongsTo(EstablishmentExtra::class , "establishment_extra_id");
    }
    public function product()
    {
        return $this->belongsTo(Product::class, 'establishment_product_id');
    }


}
