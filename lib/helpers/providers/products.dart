import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/helpers/providers/auth.dart';
import 'package:http/http.dart';
import 'package:menu_digitale_tablette/helpers/providers/establishment.dart';
import 'package:menu_digitale_tablette/models/product_model.dart';
import 'package:menu_digitale_tablette/services/auth/products_api.dart';

class Productprovider extends ChangeNotifier {
  final EstablishmentProvider establishmentProvider;
  Productprovider(this.establishmentProvider);
  String token = ProfessionalProvider().token;
  int establishmentid = 99569;
  //int productid = 243;
  List<Product> products = [];
  
  Future<Either<String, List<Product>>> getProducts(int id) async {
    try {
      Response response = await fetchListProductS(establishmentProvider.professionalProvider.token, establishmentid);
      print("the response"+response.statusCode.toString());
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        for (var productData in jsonData) {
          Product product = Product.fromJson(productData);
          products.add(product);
        }
        print(products.length.toString());
        notifyListeners();
        return Right(products);
      } else {
        print("Request failed with status: ${response.statusCode}");
        return Left('Unauthorized user');
      }
    } catch (e) {
      print('Error while fetching products: $e');
      return Left('Error: $e');
    }
  }

/*
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
*/
}
