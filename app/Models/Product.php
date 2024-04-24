<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\EstablishmentProduct;
use App\Models\EstablishmentProductOptionsGroupsPivot;


class Product extends Model
{
    use HasFactory;

    protected $table = 'products';

    protected $fillable = [
        'name',
        'desc',
        'hasImage',
        'source_link',
        'a_lair',
        'img',
        'img_cover',
        'au_frigo',
        'astuce_preparation',
        'good',
        'bad',
        'advice',
        'nutrition_grades',
        'nutriscore_score',
        'ingredients',
        'code_ciqual',
        'code_bar',
        'origins_lc',
        'is_verified',
        'ingredient_img',
        'marque',
        'origin',
        'adresse',
        'qte',
        'hasCover',
        'professional_id',
    ];
    public function establishmentProducts()
    {
        return $this->hasMany(EstablishmentProduct::class, 'product_id');
    }
    public function establishmentProductOptionGroups()
    {
        return $this->hasManyThrough(
            EstablishmentProductOptionGroup::class,
            EstablishmentProductOptionsGroupsPivot::class,
            'product_id',
            'id',
            'id',
            'establishment_product_options_groups_id'
        );
    }


}

