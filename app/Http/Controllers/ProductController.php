<?php

namespace App\Http\Controllers;

use App\Models\EstablishmentProductSizes;
use App\Models\DigitalMenuFormulesCategorie;
use Illuminate\Http\Request;
use App\Models\EstablishmentExtra;
use App\Models\Product;


class ProductController extends Controller
{
    public function getProductsize($product_Id)
    {
        $productSizes = EstablishmentProductSizes::whereHas('productsize.product', function ($query) use ($product_Id) {
            $query->where('id', $product_Id);
        })->get();
        return response()->json($productSizes);
    }
    public function getProductExtra($productId)
    {
        $establishmentExtra = EstablishmentExtra::whereHas('establishmentProductExtras', function ($query) use ($productId) {
            $query->whereHas('establishmentProduct', function ($innerQuery) use ($productId) {
                $innerQuery->where('product_id', $productId);
            });
        })->get();

        return response()->json($establishmentExtra);
    }


public function getProductsByCategoryForEstablishment($establishmentId)
{
    $categoriesWithProducts = DigitalMenuFormulesCategorie::with(['digitalMenuFormulesCategorieProducts.establishmentProduct.product' => function ($query) {
        $query->select('products.*');
    }])
        ->whereHas('digitalMenuFormules', function ($query) use ($establishmentId) {
            $query->where('establishment_id', $establishmentId);
        })
        ->get()
        ->map(function ($category) {
            $category->digitalMenuFormulesCategorieProducts->transform(function ($product) {
                return $product->establishmentProduct->product;
            });
            return $category;
        });

    return response()->json($categoriesWithProducts);
}

public function getCategories($establishmentId)
    {
        $categories = DigitalMenuFormulesCategorie::with('digitalMenuFormulesCategorieProducts')->
            whereHas('digitalMenuFormules', function ($query) use ($establishmentId) {
                $query->where('establishment_id', $establishmentId);
            })
            ->get();
        return response()->json($categories);
    }public function getproductsbycategorie($categorie, Request $request) {
        $perPage = $request->input('perPage', 3); // Default per page limit
        $page = $request->input('page', 1); // Default page number
        $products = Product::with('establishmentProducts')
            ->whereHas('establishmentProducts.digitalMenuFormulesCategorieProducts', function ($query) use ($categorie) {
                $query->where('digital_menu_formules_categorie_id', $categorie);
            })
            ->paginate($perPage, ['*'], 'page', $page);

        return $products;
    }

}
