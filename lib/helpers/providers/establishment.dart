import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/helpers/providers/auth.dart';
import 'package:menu_digitale_tablette/models/establishment_model/Establishment_model.dart';
import 'package:http/http.dart';
import 'package:menu_digitale_tablette/services/auth/establishment_api..dart';
import 'package:provider/provider.dart';

class EstablishmentProvider extends ChangeNotifier {
  final ProfessionalProvider professionalProvider;
  EstablishmentProvider(this.professionalProvider);

  List<Establishment> establishments = [];

  Future<Either<String, List<Establishment>>> getEstablishments() async {
    try {
      var result = await professionalProvider.fetchprofessional(professionalProvider.token);
      return result.fold(
        (error) {
          return Left('Error: $error');
        },
        (id) async {
          int professionalId = id;
          try {
            Response response =await fetchEstablishmentS(professionalProvider.token, professionalId);
            print(response.statusCode.toString()+"with id $professionalId and teh token is"+professionalProvider.token);
            if (response.statusCode == 200) {
              final List<dynamic> jsonData = jsonDecode(response.body);
              List<Establishment> newEstablishments = [];
              for (var establishmentData in jsonData) {
                Establishment establishment =
                    Establishment.fromJson(establishmentData);
                newEstablishments.add(establishment);
              }
              establishments = newEstablishments;
              notifyListeners();
              return Right(establishments);
            } else {
              return Left('Unauthorized user');
            }
          } catch (e) {
            print('Error while fetching establishments: $e');
            return Left('Error: $e');
          }
        },
      );
    } catch (e) {
      print('Error while fetching establishments: $e');
      return Left('Error: $e');
    }
  }
}
