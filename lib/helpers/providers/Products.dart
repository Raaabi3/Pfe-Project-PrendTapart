import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:menu_digitale_tablette/controllers/product_controller.dart';
import 'package:menu_digitale_tablette/models/product_model/Groups.dart';
import 'package:menu_digitale_tablette/models/product_model/Options.dart';
import 'package:menu_digitale_tablette/models/category_model.dart';
import 'package:menu_digitale_tablette/models/product_model/Product.dart';
import 'package:menu_digitale_tablette/services/products_api.dart';

class Products extends ChangeNotifier {
  String? token;
  bool isLoading = false;
  List<Category> categories = [];
  Category? selectedCategory;
  double total = 0.0;
  List<Map<EstablishmentProductOptionGroup, EstablishmentProductOption>>
      selectedOptionsList = [];
  bool _isScrolled = false;
  int _quantity = 1;

  int get quantity => _quantity;

  bool get isScrolled => _isScrolled;

  void increment() {
    _quantity++;
    notifyListeners();
  }

  void decrement() {
    if (_quantity > 1) {
      _quantity--;
      notifyListeners();
    }
  }

  List<String> generateStaticCarouselImages(product, establishmentProducts) {
    List<String> imageUrls = [];
    for (var product in establishmentProducts) {
      for (var image in product['establishment_product_images']) {
        if (image['image'] != null && image['image'].isNotEmpty) {
          imageUrls.add(image['image']);
        }
      }
    }
    return imageUrls;
  }

  void selectedOption(EstablishmentProductOption option,
      EstablishmentProductOptionGroup group) {
    ProductsController().selectedOption(selectedOptionsList, option, group);
    notifyListeners();
  }

  bool isButtonEnabled(Product product) {
    for (final group in product.groups!) {
      print("is required :");
      print(group.is_required);

      if (group.is_required == 1 &&
          !selectedOptionsList.any((element) => element.keys.first == group)) {
        return false;
      }
    }
    return true;
  }

  double calculateTotalPrice(Product product) {
    return ProductsController()
        .calculateTotalPrice(product, selectedOptionsList);
  }

  void getselectedcat(Category selectedcat) {
    selectedCategory = selectedcat;
    notifyListeners();
  }

  void getdata(String newToken) {
    token = newToken;
    notifyListeners();
  }

  Future<void> fetchcategoryAndProducts(int establishmentId) async {
    try {
      categories.clear();
      isLoading = true;
      notifyListeners();

      final response = await fetchCategoryandProuctsS(token!, establishmentId);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData != null && jsonData is List<dynamic>) {
          for (var categoryData in jsonData) {
            if (categoryData != null) {
              Category category = Category.fromJson(categoryData);
              category.product = List<Product>.from(categoryData['products']
                  .map((data) => Product.fromJson(data)));
              categories.add(category);
            }
          }
          if (categories.isNotEmpty) {
            selectedCategory = categories.first;
          }
          notifyListeners();
          print("Categories and products fetched successfully!!");
        } else {
          print('No categories available');
        }
      } else {
        print('Unauthorized user');
      }
    } catch (e) {
      print('Error fetching categories and products: $e');
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

  List<Product> getAllProducts(String query) {
    List<Product> allProducts = [];
    for (var category in categories) {
      allProducts.addAll(category.product);
    }
    if (query.isEmpty) {
      return allProducts; 
    } else {
      return allProducts.where((product) =>
        product.name.toLowerCase().contains(query.toLowerCase())
      ).toList();
    }
  }
}
