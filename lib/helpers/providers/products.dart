import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/helpers/providers/auth.dart';
import 'package:http/http.dart';
import 'package:menu_digitale_tablette/helpers/providers/establishment.dart';
import 'package:menu_digitale_tablette/models/product_model.dart';
import 'package:menu_digitale_tablette/services/auth/products_api.dart';

class Productprovider extends ChangeNotifier {
  String token = ProfessionalProvider().token;
  //int establishmentid = EstablishmentProvider().id;
  int establishmentid = 99543;
  int productid = 243;
  List<Product> products = [];
  Product product = Product(
      id: 0,
      name: "",
      desc: "",
      hasImage: false,
      sourceLink: "",
      aLair: "",
      img: "",
      imgCover: "",
      auFrigo: false,
      astucePreparation: "",
      good: "",
      bad: "",
      advice: "",
      nutritionGrades: "",
      nutriscoreScore: 0,
      ingredients: "",
      codeCiqual: "",
      codeBar: "",
      originsLc: "",
      isVerified: false,
      ingredientImg: "",
      marque: "",
      origin: "",
      adresse: "",
      qte: 0,
      hasCover: false,
      professionalId: 0);

  Future<Either<String, List<Product>>> getProducts() async {
    try {
      Response response = await fetchListProductS(token, establishmentid);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData is List) {
          List<Product> newProducts = [];
          for (var productData in jsonData) {
            Product product = Product.fromJson(productData);
            newProducts.add(product);
          }
          products = newProducts;
          notifyListeners();
          return Right(products);
        } else {
          print("Invalid JSON data: $jsonData");
          return Left('Invalid JSON data');
        }
      } else {
        print("Request failed with status: ${response.statusCode}");
        return Left('Unauthorized user');
      }
    } catch (e) {
      print('Error while fetching products: $e');
      return Left('Error: $e');
    }
  }

  Future<Either<String, Product>> getProductDetails() async {
  try {
    Response response = await fetchProductS(token, establishmentid, productid);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print("err");
      product = Product.fromJson(jsonData);
      print(product);
      notifyListeners();
      return Right(product);
    } else {
      print("Request failed with status: ${response.statusCode}");
      return Left('Unauthorized user');
    }
  } catch (e) {
    print('Error while fetching product details: $e');
    return Left('Error: $e');
  }
}

}
