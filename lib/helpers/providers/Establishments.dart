import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/models/Establishment_model.dart';
import 'package:http/http.dart';
import 'package:menu_digitale_tablette/services/auth/establishment_api..dart';

class Establishments extends ChangeNotifier {
String? token;
List<Establishment> establishments = [];
Establishment? selectedestablishment;

void getdata(newtoken){
token = newtoken;
notifyListeners();
}

void getselectedestab(establishment){
selectedestablishment=establishment;
}

void state(){
  print("state is started");
print("the token is $token");
}

  Future<Either<String, List<Establishment>>> getEstablishments() async {
    try {
      Response response = await fetchEstablishmentS(token);
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        for (var establishmentData in jsonData) {
          establishments.add(Establishment.fromJson(establishmentData));
        }
        notifyListeners();
        return Right(establishments);
      } else {
        return Left('Unauthorized user');
      }
    } catch (e) {
      print('Error while fetching establishments: $e');
      return Left('Error: $e');
    }
  }
  

  void updateEstablishments() {
    establishments.clear();
    notifyListeners();
  }

}
