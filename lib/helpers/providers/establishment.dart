import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/helpers/providers/auth.dart';
import 'package:menu_digitale_tablette/models/establishment_model/Establishment_model.dart';
import 'package:http/http.dart';
import 'package:menu_digitale_tablette/services/auth/establishment_api..dart';

class EstablishmentProvider extends ChangeNotifier {
  ProfessionalProvider professionalProvider;
  EstablishmentProvider(this.professionalProvider);
  List<Establishment> establishments = [];
  

  Future<Either<String, List<Establishment>>> getEstablishments() async {
          try {
            Response response =await fetchEstablishmentS(professionalProvider.token);
            if (response.statusCode == 200) {
              final List<dynamic> jsonData = jsonDecode(response.body);
              for (var establishmentData in jsonData) {
                Establishment establishment = Establishment.fromJson(establishmentData);
                establishments.add(establishment);
              }
              notifyListeners();
              return Right(establishments);
            } else {
              return Left('Unauthorized user');
            }
        }catch (e) {
      print('Error while fetching establishments: $e');
      return Left('Error: $e');
    }
    }
void updateEstablishments() {
    establishments.clear();
                  print("establishments is emptied");

    notifyListeners();
  }

}
