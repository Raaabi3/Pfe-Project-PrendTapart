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
  List<Map<EstablishmentProductOptionGroup, EstablishmentProductOption>> selectedOptionsList = [];


List<String> generateStaticCarouselImages(establishmentProducts) {


  List<String> imageUrls = [];
for (var product in establishmentProducts) {
  if (product['establishment_product_images'] != null) {
    for (var image in product['establishment_product_images']) {
      if (image['image'] != null && image['image'].isNotEmpty) {
        imageUrls.add(image['image']);
      }
    }
  }
}
    return imageUrls;
  }


void selectedoption(bool isSelected, Product product, EstablishmentProductOption option, EstablishmentProductOptionGroup group) {
  final selectedOptionsCount = selectedOptionsList.where((element) => element.keys.contains(group)).length;

  if (isSelected) {
    selectedOptionsList.removeWhere((element) => element[group] == option);
  } else {
    if (selectedOptionsCount < group.maximumChoose) {
      selectedOptionsList.add({
        group: option,
      });
    } else {
      print('Maximum choose limit reached for this group!');
    }
  }
    total = calculateTotalPrice(product);

  notifyListeners();
}



  bool isButtonEnabled(Product product) {
  for (final group in product.groups!) {
    if (group.is_required == 1 &&
        !selectedOptionsList.any((element) =>
            element.keys.first == group)) {
      return false;
    }
  }
  return true;
}


double calculateTotalPrice(Product product) {
  double totalPrice = product.priceByUnit;
  for (final selectedOption in selectedOptionsList) {
    final option = selectedOption.values.first;
    if (option != null) {
      totalPrice += option.price;
    }
  }
  total = totalPrice; 
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
