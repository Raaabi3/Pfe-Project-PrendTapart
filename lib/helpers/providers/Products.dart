import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:menu_digitale_tablette/models/product_model/product_extra.dart';
import 'package:menu_digitale_tablette/models/product_model/product_model.dart';
import 'package:menu_digitale_tablette/models/product_model/product_size_model.dart';
import 'package:menu_digitale_tablette/services/auth/products_api.dart';

class Products extends ChangeNotifier {
  String? token;

  void getdata(newtoken) {
    token = newtoken;
    notifyListeners();
  }


  List<Product> products = [];
  List<ProductSize> productsize = [];
  List<ProductExtra> productextra = [];

  List<Map<String, dynamic>> establishmentProducts = [];
  Future<Either<String, List<Product>>> getProducts(id) async {
    try {
      Response response = await fetchListProductS(token!, id);
      if (response.statusCode == 200) {
        products.clear();

        final List<dynamic> jsonData = jsonDecode(response.body);
        for (var productData in jsonData) {
          products.add(Product.fromJson(productData));
        }
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

  Future<Either<String, List<ProductSize>>> fetchProductSize(int id) async {
    try {
      Response response = await fetchProductSizeS(token!, id);
      if (response.statusCode == 200) {
        productsize.clear();
        final List<dynamic> jsonData = jsonDecode(response.body);
        for (var productsizeData in jsonData) {
          ProductSize size = ProductSize.fromJson(productsizeData);
          productsize.add(size);
        }

        notifyListeners();
        return Right(productsize);
      } else {
        return Left('Unauthorized user');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }
    Future<Either<String, List<ProductExtra>>> fetchProductExtra(int id) async {
    try {
      Response response = await fetchProductExtraS(token!, id);
      if (response.statusCode == 200) {
        productextra.clear();
        final List<dynamic> jsonData = jsonDecode(response.body);
        for (var productsizeData in jsonData) {
          productextra.add(ProductExtra.fromJson(productsizeData));
        }
        notifyListeners();
        return Right(productextra);
      } else {
        return Left('Unauthorized user');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }

  void updateProducts() {
    print("products is emptied");
    notifyListeners();
  }
}
