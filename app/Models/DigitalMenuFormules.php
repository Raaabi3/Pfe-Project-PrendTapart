<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DigitalMenuFormules extends Model
{
    use HasFactory;
    protected $table ="digiral_menu_formules";
    public function establishment()
    {
        return $this->belongsTo(Establishment::class, 'establishment_id');
    }
    public function digitalMenuFormulesCategorie()
    {
        return $this->belongsTo(DigitalMenuFormulesCategorie::class, 'digital_menu_formules_id');
    }
}
