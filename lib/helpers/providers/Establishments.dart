import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/models/establishment_model/Establishment_model.dart';
import 'package:http/http.dart';
import 'package:menu_digitale_tablette/services/auth/establishment_api..dart';

class Establishments extends ChangeNotifier {
String? token;
List<Establishment> establishments = [];
Establishment selectedestablishment=Establishment(id: 0, name: "", showHome: 0);

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
          Establishment establishment =
              Establishment.fromJson(establishmentData);
          establishments.add(establishment);
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

  void set_selection(int index) {
//
    notifyListeners();
  }
}
