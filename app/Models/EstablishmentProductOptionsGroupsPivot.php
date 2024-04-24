<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class EstablishmentProductOptionsGroupsPivot extends Model
{
    protected $table ='establishment_product_options_groups_pivot';
    protected $guarded = [];

    public function establishmentproductoptiongroup()
    {
        return $this->belongsTo(EstablishmentProductOptionGroup::class, 'establishment_product_options_groups_id');
    }
}
