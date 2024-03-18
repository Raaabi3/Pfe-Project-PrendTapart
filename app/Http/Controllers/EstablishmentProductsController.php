<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Establishment;
use App\Models\EstablishmentProduct;


class EstablishmentProductsController extends Controller
{
    public function getProducts($establishmentId)
    {
            $products = Establishment::findOrFail($establishmentId)->establishmentProducts;
            return response()->json($products);
    }
}
