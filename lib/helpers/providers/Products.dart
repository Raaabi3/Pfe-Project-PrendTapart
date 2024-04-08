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
  List<Category> categories = [];
  Category? selectedCategory;
  List<ProductSize> productsize = [];
  List<ProductExtra> productextra = [];

  void nextpage() {
    selectedCategory!.currentPage ++ ;
    print(selectedCategory!.currentPage);
    print("current page is updated ++");
    notifyListeners();
  }

  void getselectedcat(Category selectedcat) {
    selectedCategory = selectedcat;
    selectedCategory!.currentPage = selectedcat.currentPage;
    selectedCategory!.lastPage = selectedcat.lastPage;
    selectedCategory!.total = selectedcat.total;
    notifyListeners();
  }

  void getdata(String newToken) {
    token = newToken;
    notifyListeners();
  }

  Future<void> fetchcategory(int establishmentId) async {
    try {
      categories.clear();
      Response response = await fetchCategoryS(token!, establishmentId);
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        if (jsonData.isNotEmpty) {
          categories = jsonData.map((data) => Category.fromJson(data)).toList();
          selectedCategory= categories.first;
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

  Future<void> fetchproductbycategory(int id) async {
  try {
    isLoading = true;
    notifyListeners(); 
    Response response = await fetchListProductS(token!, selectedCategory!.id, selectedCategory!.currentPage);
    if (response.statusCode == 200) {
      final dynamic jsonData = jsonDecode(response.body);
      if (jsonData.isEmpty) {
        print("Product list is empty");
      } else {
        selectedCategory!.lastPage = jsonData['last_page'];
        selectedCategory!.total = jsonData['total'];
          List<Product> productList = (jsonData['data'] as List)
              .map((data) => Product.fromJson(data))
              .toList();
          selectedCategory!.product.addAll(productList);
          notifyListeners();
      }
    } else {
      print("Request failed with status: ${response.statusCode}");
      throw Exception('Failed to load products');
    }
  } catch (e) {
    print('Error fetching and categorizing products: $e');
  } finally {
    isLoading = false;
    notifyListeners(); 
    nextpage();
  }
}



  Future<void> fetchProductExtra(int id) async {
    try {
      Response response = await fetchProductExtraS(token!, id);
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        final List<ProductExtra> productExtras =
            jsonData.map((data) => ProductExtra.fromJson(data)).toList();
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
    categories.clear();
    print("Products with categories been emptied");
    notifyListeners();
  }
}
