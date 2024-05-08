import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/controllers/commandes_controller.dart';
import 'package:menu_digitale_tablette/models/cart_model.dart';
import 'package:menu_digitale_tablette/models/commande_model.dart';
import 'package:menu_digitale_tablette/models/product_model/Product.dart';
import 'package:menu_digitale_tablette/services/commandes_api.dart';

class Commandes extends ChangeNotifier {
  String? token;
  List<Commande>? commandes;

  final CommandesController controller = CommandesController();

  Future<void> createCommande(
    String token,
    double total,
    List<Cart> carts,
  ) async {
    notifyListeners();
    List<Map<String, Object>> optionsnames = [];
    Map<String, dynamic> bodyData =
        controller.buildBodyDataFromCart(total, carts, optionsnames);
    try {
      final response = await insertCommande(token, bodyData);
      print(token);
      print(response.statusCode);
      print(response.body);
      List<Product> products = [];
      print(response.statusCode);
      if (response.statusCode == 201) {
        for (var cart in carts) {
          products.add(cart.product);
        }

        final commande = Commande.fromJson(jsonDecode(response.body));
        commande.products ??= [];
        commande.options = optionsnames;
        commande.products ??= [];
        commande.products!.addAll(products);
        commandes ??= [];
        commandes!.add(commande);
        print(commandes!.last.total);
        notifyListeners();
      } else {
        print("Failed to insert");
      }
    } catch (e) {
      print('An error occurred: ${e.toString()}');
    }

    notifyListeners();
  }

  void getdata(String newToken) {
    token = newToken;
    notifyListeners();
  }

  Future<void> removeCommande(int index) async {
  if (commandes == null || index < 0 || index >= commandes!.length) {
    print("Index out of range for removing a commande");
    return;
  }

  final commandeId = commandes![index].commande_id;  
  commandes!.removeAt(index);  
  notifyListeners();  
    await deleteCommandesS(token, commandeId); 
}


  Future<void> removeProductFromCommande(int commandeIndex, int productIndex) async {
  if (commandes == null ||
      commandeIndex < 0 ||
      commandeIndex >= commandes!.length) {
    print("Commande index out of range");
    return;
  }

  final commande = commandes![commandeIndex];
  if (commande.products == null ||
      productIndex < 0 ||
      productIndex >= commande.products!.length) {
    print("Product index out of range");
    return;
  }

  final productId = commande.products![productIndex].id; 
  commande.products!.removeAt(productIndex);
  await deleteProductFromCommandesS(token, commande.commande_id, productId); 
  print(commande.commande_id.toString() +" product id :"+ productId.toString());
  if (commande.products!.isEmpty) {  
    await removeCommande(commandeIndex);
  } else {
    notifyListeners(); 
  }
}


}
