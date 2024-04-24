<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class EstablishmentProductOption extends Model
{
    protected $guarded = [];

    public function establishmentproductoptiongroup()
    {
        return $this->belongsTo(EstablishmentProductOptionGroup::class, 'establishment_product_options_groups_id');
    }
}
