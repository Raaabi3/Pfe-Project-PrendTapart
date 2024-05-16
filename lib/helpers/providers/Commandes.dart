import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:menu_digitale_tablette/controllers/commandes_controller.dart';
import 'package:menu_digitale_tablette/models/cart_model.dart';
import 'package:menu_digitale_tablette/models/commande_model.dart';
import 'package:menu_digitale_tablette/models/product_model/Product.dart';
import 'package:menu_digitale_tablette/services/commandes_api.dart';

class Commandes extends ChangeNotifier {
  String? token;
  List<Commande>? commandes;
  String status = "";
  List<Map<String, dynamic>>? prodstatus;
  Map<String, List<Commande>> commandebystatus = {
    'En attente': [],
    'En cours': [],
    'Terminé': [],
  };
  int card = 0;
  int get getcard => card;

  void setcard(int nmbr) {
    card = nmbr;
    notifyListeners();
  }

  int countproduct(status) {
    int nmbr = 0;
    if(commandes!.isNotEmpty){
for (var commande in commandes!) {
      if (status != "") {
        if (commande.status == status) {
          nmbr += commande.products!.length;
        }
      } else {
        nmbr += commande.products!.length;
      }
    }

    }
    
    return nmbr;
  }

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
        commandebystatus['En attente']!.add(commande);
        notifyListeners();
      } else {
        print("Failed to insert");
      }
    } catch (e) {
      print('An error occurred: ${e.toString()}');
    }

    notifyListeners();
  }

  bool checkstatus(cardtitle) {
    bool rebuild = false;
    fetchCommandestatus(92);
    if (cardtitle != status && status != "" &&commandebystatus[cardtitle]!.isNotEmpty) {
      commandebystatus[status]!.addAll(commandebystatus[cardtitle]!);
      commandebystatus[cardtitle]!.clear();
      rebuild = true;
      cardtitle = status;
      notifyListeners();
      print("status changed");
    } else if (cardtitle == status) {
      print("the status and teh card are teh same ");
    }
    return rebuild;
  }
  /*
  checkprodstatus(cardtitle,cmd){
    fetchProdstatus(cmd.id);
    for (var cmd in commandes!){
    for (var product in prodstatus ?? []) {
    var productInCommand = cmd.products!.firstWhere((p) => p.id == product['id']);
    if (product['status'] != cardtitle) {
      commandebystatus[cardtitle]?.remove(productInCommand);
      commandebystatus[product['status']]?.add(productInCommand);
      productInCommand. = product['status'];
      print("Product status changed for product with ID ${product['id']}");
    }
    }
  }
  }*/



  Future<void> fetchProdstatus(id) async {
    try {
      Response response = await fetchprodstatusS(token, id);
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        prodstatus = jsonResponse.map((item) {
          return {
            "id": item["id"],
            "status": item["status"],
          };
        }).toList();
      } else {
        print("failed !");
      }
    } catch (e) {
      print("error :$e");
    }
  }

  Future<void> fetchCommandestatus(id) async {
    try {
      Response response = await fetchCommandestatusS(token, id);
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          Map<String, dynamic> responseData = jsonDecode(response.body);
          status = responseData['status'];
          notifyListeners();
        } else {
          print('Error: Response body is not in JSON format');
        }
      } else {
        print('Error while fetching status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error while fetching status: $e');
    }
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
}
