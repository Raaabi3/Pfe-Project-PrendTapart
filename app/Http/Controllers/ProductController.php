<?php

namespace App\Http\Controllers;

use App\Models\Rayons;
use Illuminate\Http\Request;
use App\Models\EstablishmentExtra;
use App\Models\Product;
use Exception;

class ProductController extends Controller
{
    public function getCategoriesWithProducts($establishmentId)
{
   try {
    $categories = Rayons::with(['products' => function ($query) {
        $query->with(['establishmentProducts' => function ($query) {
            $query->with(['establishmentProductOptionGroups.establishmentproductoptions', 'establishmentProductImages']);
        }]);
    }])
    ->where('establishment_id', $establishmentId)
    ->get();
    return response()->json($categories);
} catch (Exception $e) {
    return response()->json(['error' => $e->getMessage()], 500);
}

}

}
