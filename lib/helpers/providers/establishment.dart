
import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/helpers/providers/auth.dart';
import 'package:menu_digitale_tablette/models/establishment_model/Establishment_model.dart';
import 'package:http/http.dart';
import 'package:menu_digitale_tablette/services/auth/establishment_api..dart';

class EstablishmentProvider extends ChangeNotifier {
  int id = 12;
  String token = ProfessionalProvider().token;
  List<Establishment> establishments = [];

  Future<Either<String, List<Establishment>>> getEstablishments() async {
  try {
    Response response = await fetchEstablishmentS(token, id);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData is List) {
        List<Establishment> newEstablishments = [];
        for (var establishmentData in jsonData) {
          Establishment establishment = Establishment.fromJson(establishmentData);
          newEstablishments.add(establishment);
        }
        establishments = newEstablishments;
        notifyListeners(); 
        return Right(establishments);
      } else {
        print("Invalid JSON data: $jsonData");
        return Left('Invalid JSON data');
      }
    } else {
      print("Request failed with status: ${response.statusCode}");
      return Left('unauthorized user');
    }
  } catch (e) {
    print('Error while fetching establishments: $e');
    return Left('Error: $e');
  }
}


}



