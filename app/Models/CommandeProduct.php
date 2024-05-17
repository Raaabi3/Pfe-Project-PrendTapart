<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CommandeProduct extends Model
{
    protected $table = 'commande_products';
    protected $primaryKey = 'id';
    public $timestamps = true;

    protected $fillable = [
        'commande_id',
        'qte',
        'establishment_product_id',
        'created_at',
        'product_price',
        'status',
    ];

    public function commande()
    {
        return $this->belongsTo(Commande::class, 'commande_id', 'id');
    }

    public function options()
    {
        return $this->hasMany(CommandeProductOptions::class, 'commande_product_id', 'id');
    }
    public function getConvertedStatusAttribute()
    {
        return Commande::convertStatusToString($this->status);
    }
}
