import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:menu_digitale_tablette/models/Category_model/category_model.dart';
import 'package:menu_digitale_tablette/services/auth/category_api.dart';

class Categorys extends ChangeNotifier{
  int selectedcategory =0;
  List<Category> categories = [];
  String? token;

  void getdata(newtoken) {
    token = newtoken;
    notifyListeners();
  }
  void updateCategorys(List<Category> newCategories) {
    categories = newCategories;
    notifyListeners(); 
  }
  void selectedCategory(newcategory){
    selectedcategory = newcategory;
    notifyListeners();
  }

  Future<Either<String, List<Category>>> fetchcategory(int id) async {
  try {
    Response response = await fetchCategoryS(token!, id);
    categories.clear();
    if (response.statusCode == 200) {
      final dynamic jsonData = jsonDecode(response.body);
      for (var data in jsonData) {
        Category cat = Category.fromJson(data);
        categories.add(cat);
      }
      print("length :"+categories.length.toString());
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




}