<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CommandeProductOptions extends Model
{
    protected $table = 'commande_product_options';
    protected $primaryKey = 'id';
    public $timestamps = true;

    protected $fillable = [
        'commande_product_id',
        'establishment_product_options_groups_id',
        'establishment_product_options_id',
        'option_price', // Include 'option_price' in fillable
    ];

    public function commandeProduct()
    {
        return $this->belongsTo(CommandeProduct::class, 'commande_product_id', 'id');
    }

    public function optionGroup()
    {
        return $this->belongsTo(EstablishmentProductOptionGroup::class, 'establishment_product_options_groups_id', 'id');
    }

    public function option()
    {
        return $this->belongsTo(EstablishmentProductOption::class, 'establishment_product_options_id', 'id');
    }
}
