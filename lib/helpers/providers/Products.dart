import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:menu_digitale_tablette/models/Groups.dart';
import 'package:menu_digitale_tablette/models/Options.dart';
import 'package:menu_digitale_tablette/models/category_model.dart';
import 'package:menu_digitale_tablette/models/product_model/Product.dart';
import 'package:menu_digitale_tablette/services/auth/category_api.dart';
import 'package:menu_digitale_tablette/services/auth/products_api.dart';

class Products extends ChangeNotifier {
  String? token;
  bool isLoading = false;
  List<Category> categories = [];
  Category? selectedCategory;
  double total = 0.0;

  void nextpage() {
    selectedCategory!.currentPage++;
    notifyListeners();
  }

  void getselectedcat(Category selectedcat) {
    selectedCategory = selectedcat;
    notifyListeners();
  }

  void getdata(String newToken) {
    token = newToken;
    notifyListeners();
  }
  

  void getTotalPrice(Product product, List<List<int>> selectedOptions) {
  double optionsTotal = 0;
  for (var groupIndex = 0; groupIndex < selectedOptions.length; groupIndex++) {
    final groupSelectedOptions = selectedOptions[groupIndex];
    for (var optionIndex in groupSelectedOptions) {
      optionsTotal += product.groups![groupIndex].options![optionIndex].price;
    }
  }

  total = product.priceByUnit + optionsTotal;
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
          selectedCategory = categories.first;
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

  Future<void> fetchproductbycategory() async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await fetchListProductS(
          token!, selectedCategory!.id, selectedCategory!.currentPage);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        if (jsonData['products'] != null) {
          final productsData = jsonData['products'];
          selectedCategory!.lastPage = productsData['last_page'] ?? 0;
          selectedCategory!.total = productsData['total'] ?? 0;

          if (selectedCategory!.currentPage <= selectedCategory!.lastPage) {
            final productList = (productsData['data'] as List)
                .map((data) => Product.fromJson(data))
                .toList();

            for (var product in productList) {
              for (var establishmentProduct in product.establishmentProducts) {
                (establishmentProduct['establishment_product_option_groups'] ??
                        [])
                    .forEach((groupData) {
                  product.groups!.add(EstablishmentProductOptionGroup.fromJson(
                      groupData)
                    ..options = (groupData['establishmentproductoptions'] !=
                            null)
                        ? [
                            for (var optionData
                                in groupData['establishmentproductoptions'])
                              EstablishmentProductOption.fromJson(optionData)
                          ]
                        : []);
                });
              }
            }

            selectedCategory!.product.addAll(productList);
            productList.forEach((product) {
              print(
                  '${product.id} - the groups length is: ${product.groups!.length}');
            });
            nextpage();
          }
        } else {
          print('Product list is empty');
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error fetching and categorizing products: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void updateProducts() {
    categories.clear();
    print("Products with categories been emptied");
    notifyListeners();
  }
}
