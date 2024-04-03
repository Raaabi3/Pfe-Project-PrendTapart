<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DigitalMenuFormulesCategorieProduct extends Model
{
    use HasFactory;
    public function establishmentProduct()
    {
        return $this->belongsTo(EstablishmentProduct::class, 'establishment_product_id');
    }
    
    public function digitalMenuFormulesCategorie()
    {
        return $this->belongsTo(DigitalMenuFormulesCategorie::class, 'digital_menu_formules_categorie_id');
    }

}
