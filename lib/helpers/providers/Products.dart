import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:menu_digitale_tablette/models/Category_model/category_model.dart';
import 'package:menu_digitale_tablette/models/product_model/product_extra.dart';
import 'package:menu_digitale_tablette/models/product_model/product_model.dart';
import 'package:menu_digitale_tablette/models/product_model/product_size_model.dart';
import 'package:menu_digitale_tablette/services/auth/category_api.dart';
import 'package:menu_digitale_tablette/services/auth/products_api.dart';

class Products extends ChangeNotifier {
  String? token;
  bool isLoading = false;
  int currentPage = 1;
  int lastpage = 0;
  int total = 0;
  List<Category> categories = [];
  Category? selectedCategory;
  List<ProductSize> productsize = [];
  List<ProductExtra> productextra = [];

  void nextpage() {
    currentPage++;
    notifyListeners();
  }

  void getselectedcat(Category selectedcat) {
  selectedCategory = selectedcat;
  currentPage = selectedcat.currentPage;
  lastpage = selectedcat.lastPage;
  total = selectedcat.total;
  notifyListeners();
  }

  void getdata(String newToken) {
    token = newToken;
    notifyListeners();
  }

  Future<void> fetchcategory(int establishmentId) async {
    try {
      Response response = await fetchCategoryS(token!, establishmentId);
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        if (jsonData.isNotEmpty) {
          categories = jsonData.map((data) => Category.fromJson(data)).toList();
          notifyListeners();
          print("Categories fetched successfully!!");
        } else {
          print('No categories available');
        }
      } else {
        print('Unauthorized user');
      }
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }

  Future<void> fetchProductsAndCategorize(int categoryId) async {
    try {
      isLoading = true;
      Response response = await fetchListProductS(token!, categoryId, currentPage);
      if (response.statusCode == 200) {
        final dynamic jsonData = jsonDecode(response.body);
        final List<dynamic> productList = jsonData['data'];
        if (productList.isEmpty) {
          print("Product list is empty");
        } else {
        lastpage = jsonData['last_page'];
        total = jsonData['total'];
          Category category = categories.firstWhere((cat) => cat.id == categoryId);
          print("Category: ${category.name}");
          for (var productData in productList) {
            final List<dynamic> establishmentProducts = productData['establishment_products'];
            for (var establishmentProduct in establishmentProducts) {
              final int productId = establishmentProduct['id'];
              category.categoryProduct.forEach((catProd) {
                if (catProd.establishmentProductId == productId) {
                  bool productExists = catProd.product!.any((p) => p.establishmentProducts.first['id'] == productId);
                  if (!productExists) {
                    catProd.product!.add(Product.fromJson(productData));
                  }
                  notifyListeners();
                }
              });
            }
          }
        }
      } else {
        print("Request failed with status: ${response.statusCode}");
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error fetching and categorizing products: $e');
    } finally {
      print("no longer loading");
      isLoading = false;
      print("Is loading: $isLoading");
      notifyListeners();
      if (currentPage <= lastpage) {
        nextpage();
      }
    }
  }

  Future<void> fetchProductExtra(int id) async {
    try {
      Response response = await fetchProductExtraS(token!, id);
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        final List<ProductExtra> productExtras = jsonData.map((data) => ProductExtra.fromJson(data)).toList();
        //productextra.clear();
        //productextra.addAll(productExtras);
        notifyListeners();
      } else {
        print('Unauthorized user');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void updateProducts() {
    print("Products is emptied");
    notifyListeners();
  }
}
