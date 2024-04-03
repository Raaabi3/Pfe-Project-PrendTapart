import 'dart:convert';
import 'package:either_dart/either.dart';
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
  int  currentPage = 1;
  bool hasMoreData = true;
  bool isLoading = false;
  int perPage = 3;
  int categoryId=0;
  int selectedCategory=0;

  void getdata(newtoken) {
    token = newtoken;
    notifyListeners();
  }


  List<Product> products = [];
  List<ProductSize> productsize = [];
  List<ProductExtra> productextra = [];
  List<Category> categories = [] ; 




Future<Either<String, List<Category>>> fetchcategory(int id) async {
  try {
    Response response = await fetchCategoryS(token!, id);
    if (response.statusCode == 200) {
      final dynamic jsonData = jsonDecode(response.body);
      for (var data in jsonData) {
        Category cat = Category.fromJson(data);
        categories.add(cat);
      }
      notifyListeners();
      return Right(categories);
    } else {
      return Left('Unauthorized user');
    }
  } catch (e) {
    print('Error fetching categories: $e');
    return Left('Error fetching categories');
  }
}
  Future<void> fetchMoreProducts() async {
    if (!isLoading && hasMoreData) {
      try {
        isLoading = true;
        currentPage++;
        await fetchProductsAndCategorize(categoryId);
      } catch (e) {
        print('Error fetching more products: $e');
      } finally {
        isLoading = false;
        notifyListeners();
      }
    }
  }

  Future<void> fetchProductsAndCategorize(int categoryId) async {
  if (isLoading || !hasMoreData) return;
  try {
    isLoading = true;
    Response response = await fetchListProductS(token!, categoryId, currentPage, perPage);
    if (response.statusCode == 200) {
      final dynamic jsonData = jsonDecode(response.body);
      final List<dynamic> productList = jsonData['data'];
      if (productList.isEmpty) {
        hasMoreData = false;
        print("Product list is empty");
      } else {
        Category category = categories.firstWhere((cat) => cat.id == categoryId);
          category.categoryProduct.forEach((catProd) => catProd.product.clear());
          print("Category: ${category.name}");
          for (var productData in productList) {
            final List<dynamic> establishmentProducts = productData['establishment_products'];
            for (var establishmentProduct in establishmentProducts) {
              final int productId = establishmentProduct['id'];
              category.categoryProduct.forEach((catProd) {
                if (catProd.establishmentProductId == productId) {
                  catProd.product.add(Product.fromJson(productData));
                  notifyListeners();
                }
                }
              );
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
    isLoading = false;
    print("Is loading: $isLoading");
    notifyListeners();
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
