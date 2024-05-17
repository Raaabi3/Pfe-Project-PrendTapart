<?php



namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Rayons extends Model
{
    protected $table = "rayons";
    protected $fillable = [
        'name', 'order_show', 'is_displayed', 'image', 'establishment_id'
    ];

    // Define the relationship with products
    public function establishments()
    {
        return $this->hasMany(Establishment::class , "id");
    }
    public function establishmentProducts()
    {
        return $this->hasMany(EstablishmentProduct::class, 'rayon_id');
    }
    public function products()
    {
        return $this->hasManyThrough(
            Product::class,
            EstablishmentProduct::class,
            'rayon_id',
            'id',
            'id',
            'product_id'
        );
    }
}
