<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\EstablishmentProduct;

class Establishment extends Model
{
    use HasFactory;
    protected $table = 'establishments';

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

    public function company()
    {
        return $this->belongsTo(Companies::class, 'company_id');
    }


    public function establishmentProducts()
    {
        return $this->hasMany(EstablishmentProduct::class);
    }
    public function professionals()
    {
        return $this->company->professionals();
    }
    public function professionalRoles()
    {
        return $this->hasMany(ProfessionalRoleInEstablishment::class, 'establishment_id');
    }
    public function roles(){
        return $this->hasMany(Roles::class);
    }
    public function digitalMenuFormules()
    {
        return $this->belongsTo(DigitalMenuFormules::class, 'establishment_id');
    }

}
