<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EstablishmentProduct extends Model
{
    use HasFactory;

    protected $table = 'establishment_products';


    protected $fillable = [
        'establishment_id',
        'product_id',
        'unit',
        'price_by_unit',
        'location',
        'stock_quantity',
        'dlc',
        'ref',
        'img',
        'is_rec',
        'is_ing',
        'show_home',
        'description',
        'auto_upgrade_shopping_list',
        'minimum_quantity_to_order',
        'maximum_quantity_to_order',
        'promotion_id',
        'digital_menu_rayon_id',
        'poids',
        'establishment_tva_id',
        'recette_id',
        'establishment_product_rec_id',
        'qte_for_one_rec',
    ];

    public function establishmentproductoptionsgroupspivot()
    {
        return $this->hasOne(EstablishmentProductOptionsGroupsPivot::class);
    }
    public function establishmentProductOptionGroups()
    {
        return $this->hasManyThrough(EstablishmentProductOptionGroup::class,EstablishmentProductOptionsGroupsPivot::class,
        'establishment_product_id','id','id','establishment_product_options_groups_id' );
    }
    public function establishment()
    {
        return $this->belongsTo(Establishment::class);
    }

    public function product()
    {
        return $this->belongsTo(Product::class );
    }
    public function products()
    {
        return $this->hasMany(Product::class);
    }    public function establishmentProductImages()
    {
        return $this->hasMany(EstablishmentProductImage::class, 'establishment_product_id');
    }



}

