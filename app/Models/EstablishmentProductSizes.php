<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EstablishmentProductSizes extends Model
{
    use HasFactory;
    protected $table="establishment_product_sizes";
    protected $primarykey="establishment_product_id";

    public function productsize(){
        return $this->belongsTo(EstablishmentProduct::class ,'establishment_product_id');
    }
}
