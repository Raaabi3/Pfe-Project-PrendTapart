<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Establishment;
use App\Models\EstablishmentProduct;


class EstablishmentProductsController extends Controller
{
    public function index($establishmentId)
    {
        try {
            $products = Establishment::with('establishmentproducts')->findOrFail($establishmentId)->establishmentProducts;
            return response()->json($products);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
