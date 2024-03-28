<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\EstablishmentProduct;


class EstablishmentProductsController extends Controller
{
    public function getProducts($establishmentId)
    {
        $products = Product::whereHas('establishmentProducts', function ($query) use ($establishmentId) {
            $query->where('establishment_id', $establishmentId);
        })->with('establishmentProducts')->get();
        return response()->json($products);

    }



}
