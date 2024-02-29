
import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:menu_digitale_tablette/models/professional_model/professional_model.dart';
import 'package:menu_digitale_tablette/services/auth/auth_api.dart';

class ProfessionalProvider extends ChangeNotifier {
  String token = "";
  List<ProfessionalModel> professional = [];
  late BuildContext context; 

void setContext(BuildContext _context) {
  context = _context;
}
Future<Either<String, Map<String, dynamic>>> register(String name,String surname ,String email, String password) async {
  Response response = await registerS(name, surname, email, password);
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
  Future<Either<String, Map<String, dynamic>>> login(String email, String password) async {
  Response response = await loginS(email, password);
  try {
        if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return Right(jsonData);
      } else {
        return Left('registeration failed');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }
  Future<Either<String, String>> logout(token) async {
  Response response = await logoutS(token);
  try {
      if (response.statusCode == 200) {
        return Right("logout succ");
      } else {
        return Left('logout failed');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }
  Future<Either<String, String>> fetchprofessional(token) async {
  Response response = await fetchprofessionalS(token);
  try {
        if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return Right(jsonData);
      } else {
        return Left('registeration failed');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }
}


