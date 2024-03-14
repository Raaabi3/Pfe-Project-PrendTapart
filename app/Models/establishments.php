<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\EstablishmentProduct;

class establishments extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'address',
        'city',
        'zip_code',
        'longitude',
        'latitude',
        'company_id',
        'email',
        'phone_number',
        'particularity',
        'description',
        'equipe',
        'valeur',
        'img',
        'cov_img',
        'Slogan',
        'show_home',
        'synthese_eval_sanit',
        'numero_inspection',
        'is_checked',
        'site_id',
        'booking_duration',
        'image_article',
        'content_article',
    ];

    public function establishmentProducts()
    {
        return $this->hasMany(EstablishmentProduct::class);
    }


}
