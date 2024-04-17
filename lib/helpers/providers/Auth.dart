
import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:menu_digitale_tablette/models/Establishment_model.dart';
import 'package:menu_digitale_tablette/models/professional_model.dart';
import 'package:menu_digitale_tablette/services/auth/auth_api.dart';



class Auth extends ChangeNotifier {
  late String token = "";
  List<ProfessionalModel> professional = [];
  Establishment? selectedestablishment;

void updateToken(String newToken) {
token = newToken;
notifyListeners();
}

void setselectedestablishment(newselectedestablishment){
  selectedestablishment=newselectedestablishment;
  notifyListeners();
}

  
  Future<Either<String, Map<String, dynamic>>> login(String email, String password) async {
  Response response = await loginS(email, password);
  try {
        if (response.statusCode == 201) {
        final jsonData = jsonDecode(response.body);
        return Right(jsonData);
      } else {
        return Left('registeration failed');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }
  
  Future<Either<String, String>> logout() async {
  Response response = await logoutS(token);
  print(response.body);
  try {
    if (response.statusCode == 200) {
      updateToken('');
      return Right("logout succ");
    } else {
      return Left('logout failed');
    }
  } catch (e) {
    return Left('Error: $e');
  }
}

  
  Future<Either<String, int>> fetchprofessional(token) async {
  Response response = await fetchprofessionalS(token);
  try {
    print("fetching prof :"+response.statusCode.toString());
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
//        getid(jsonData['id']);
        return Right(jsonData['id']);
      } else {
        return Left('unauthorised user');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }
}


