import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:menu_digitale_tablette/models/product_model/Groups.dart';
import 'package:menu_digitale_tablette/models/product_model/Options.dart';
import 'package:menu_digitale_tablette/models/category_model.dart';
import 'package:menu_digitale_tablette/models/product_model/Product.dart';
import 'package:menu_digitale_tablette/services/auth/category_api.dart';
import 'package:menu_digitale_tablette/services/auth/products_api.dart';
import 'package:pinput/pinput.dart';

class Products extends ChangeNotifier {
  String? token;
  bool isLoading = false;
  List<Category> categories = [];
  Category? selectedCategory;
  double total = 0.0;
  List<Map<String, dynamic>> selectedOptionsList = [];

  void selectedoption(bool isSelected, Product product, EstablishmentProductOption option, int groupIndex) {
    final selectedGroup = product.groups![groupIndex];
    final selectedOptionsCount = selectedOptionsList.where((element) => element['group'] == selectedGroup).length;

    if (isSelected) {
      selectedOptionsList.removeWhere((element) =>
          element['group'] == selectedGroup &&
          element['option'] == option);
    } else {
      if (selectedOptionsCount < selectedGroup.maximumChoose) {
        selectedOptionsList.add({
          'group': selectedGroup,
          'option': option,
        });
      } else {
        print('Maximum choose limit reached for this group!');
      }
    }
    notifyListeners();
  }

  bool isButtonEnabled(Product product) {
    // Check if all required groups have at least one selected option
    for (final group in product.groups!) {
      if (group.is_required == 1 &&
          !selectedOptionsList.any((element) => element['group'] == group)) {
        return false; // Disable the button if any required group has no selected option
      }
    }
    // Enable the button if there are no required groups or all required groups have at least one selected option
    return true;
  }

  double calculateTotalPrice(Product product) {
    double totalPrice = product.priceByUnit; // Initialize with the base price of the product
    // Iterate over selected options and add their prices to the total
    for (final selectedOption in selectedOptionsList) {
      final option = selectedOption['option'] as EstablishmentProductOption?;
      if (option != null) {
        totalPrice += option.price;
      }
    }
    return totalPrice;
  }
  


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
