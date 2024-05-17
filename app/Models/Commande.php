<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Commande extends Model
{
    protected $table = 'commandes';
    protected $primaryKey = 'id';
    public $timestamps = true;

    protected $fillable = ['status', 'created_at', 'total', 'table_number']; // Add 'table_number' to fillable
    public static function convertStatusToInt($status)
    {
        $statusMapping = [
            'En attente' => 0,
            'En cours' => 1,
            'Terminé' => 2,
        ];

        return $statusMapping[$status] ?? 0;
    }
    public static function convertStatusToString($statusInt)
    {
        $statusMapping = [
            0 => 'En attente',
            1 => 'En cours',
            2 => 'Terminé',
        ];

        return $statusMapping[$statusInt] ?? 'unknown';
    }

    // Define relationship with CommandeProduct
    public function products()
    {
        return $this->hasMany(CommandeProduct::class, 'commande_id', 'id');
    }
}
