<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class EstablishmentProductOptionGroup extends Model
{
    protected $table ="establishment_product_options_groups";
    protected $guarded = [];

    public function options()
    {
        return $this->hasMany(EstablishmentProductOption::class, 'establishment_product_options_groups_id');
    }

    public function pivot()
    {
        return $this->hasOne(EstablishmentProductOptionsGroupsPivot::class, 'establishment_product_options_groups_id');
    }
}
