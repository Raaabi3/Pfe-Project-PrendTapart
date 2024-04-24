<?php

namespace App\Http\Controllers;

use App\Models\EstablishmentProductSizes;
use App\Models\Rayons;
use Illuminate\Http\Request;
use App\Models\EstablishmentExtra;
use App\Models\Product;
use Exception;


class ProductController extends Controller
{

public function getCategories($establishmentId)
{
    $categories = Rayons::where('establishment_id', $establishmentId)
        ->get();

    return response()->json($categories);
}


public function getProductsAndOptions($category, Request $request)
{
    try {
        $products = Product::whereHas('establishmentProducts', function ($query) use ($category) {
                $query->where('rayon_id', $category);
            })
            ->with(['establishmentProducts' => function ($query) use ($category) {
                $query->where('rayon_id', $category)
                ->with(['establishmentProductOptionGroups.establishmentproductoptions', 'establishmentProductImages']);
            }])
            ->paginate(3);

        return response()->json([
            'products' => $products,
        ]);
    } catch (Exception $e) {
        return response()->json(['error' => $e->getMessage()], 500);
    }
}





}
