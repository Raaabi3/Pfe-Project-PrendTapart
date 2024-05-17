<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Commande;
use App\Models\CommandeProduct;
use App\Models\CommandeProductOptions;

class CommandeController extends Controller
{
    public function createOrder(Request $request)
    {
        // Validate incoming data
        $validated = $this->validateRequest($request);

        // Create Commande
        $commande = $this->createCommande($validated);

        // Create Commande Products
        $this->createCommandeProducts($validated['products'], $commande);

        // Create Product Options
        $this->createProductOptions($validated['products'], $commande);

        // Return success response
        return response()->json([
            'commande_id' => $commande->id,
            'status' => Commande::convertStatusToString($commande->status), // Use status conversion method
            'created_at' => $commande->created_at,
            'total' => $commande->total,
        ], 201);
    }

    private function validateRequest(Request $request)
    {
        return $request->validate([
            'total' => 'required|numeric|min:0',
            'products' => 'required|array',
            'products.*.product_id' => 'required|integer',
            'products.*.quantity' => 'required|integer',
            'products.*.establishment_product_id' => 'required|integer',
            'products.*.product_price' => 'required|numeric', // Add validation for product_price
            'products.*.options' => 'array', // Ensure validation for nested array
        ]);
    }

    private function createCommande(array $validated)
    {
        $statusInt = Commande::convertStatusToInt('En attente'); // Convert to integer
        return Commande::create([
            'status' => $statusInt, // Store as integer
            'created_at' => now(),
            'total' => $validated['total'],
            "table_number" => 10,
        ]);
    }

    private function createCommandeProducts(array $products, Commande $commande)
    {
        $productData = collect($products)->map(function ($product) use ($commande) {
            $statusInt = Commande::convertStatusToInt('En attente'); // Convert to integer

            return [

                'commande_id' => $commande->id,
                'qte' => $product['quantity'],
                'establishment_product_id' => $product['establishment_product_id'],
                'product_price' => $product['product_price'],
                'status' => $statusInt,
            ];
        });

        $commande->products()->createMany($productData);
    }

    private function createProductOptions(array $products, Commande $commande)
    {
        $productOptions = collect($products)->flatMap(function ($product, $index) use ($commande) {
            $commandeProduct = $commande->products[$index];
            return collect($product['options'] ?? [])->map(function ($option) use ($commandeProduct) {
                return [
                    'commande_product_id' => $commandeProduct->id,
                    'establishment_product_options_groups_id' => $option['group'],
                    'establishment_product_options_id' => $option['option'],
                    'created_at' => now(),
                    'updated_at' => now(),
                    'option_price' => $option['option_price'],
                ];
            });
        });

        CommandeProductOptions::insert($productOptions->all());
    }

    public function deleteOrder($id)
    {
        $commande = Commande::findOrFail($id);

        // Delete related options
        CommandeProductOptions::whereIn('commande_product_id', $commande->products->pluck('id'))->delete();

        // Delete related products
        CommandeProduct::where('commande_id', $commande->id)->delete();

        // Delete the Commande
        $commande->delete();

        return response()->json([
            'message' => 'Commande deleted successfully',
        ], 200);
    }


    public function deleteProductFromOrder($commandeId, $productId)
    {
        $commande = Commande::findOrFail($commandeId);
        $commandeProduct = CommandeProduct::where('commande_id', $commandeId)
            ->where('id', $productId)
            ->first();
        if ($commandeProduct) {
            CommandeProductOptions::where('commande_product_id', $commandeProduct->id)->delete();
            $commandeProduct->delete();
            return response()->json([
                'message' => 'Product deleted successfully from the order',
            ], 200);
        } else {
            return response()->json([
                'message' => 'Product not found in the specified order',
            ], 404);
        }
    }
    public static function getStatusById($id)
    {
        $status = Commande::convertStatusToString(Commande::where('id', $id)->value('status'));
        return response()->json(['status' => $status]);
    }
    public static function getProductStatusById($id)
    {
        $products = CommandeProduct::select('id', 'status')
            ->where('commande_id', $id)
            ->get();
        $products->transform(function ($product) {
            $product->status = Commande::convertStatusToString($product->status);
            return $product;
        });

        return $products;
    }
}
