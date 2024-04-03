<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DigitalMenuFormulesCategorie extends Model
{
    use HasFactory;
    protected $table="digiral_menu_formules_categorie";

    public function digitalMenuFormules()
    {
        return $this->belongsTo(DigitalMenuFormules::class, 'digiral_menu_formules_id');
    }

    public function digitalMenuFormulesCategorieProducts()
    {
        return $this->hasMany(DigitalMenuFormulesCategorieProduct::class);
    }
    
}
