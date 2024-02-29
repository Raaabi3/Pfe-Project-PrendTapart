import 'dart:convert';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:menu_digitale_tablette/helpers/providers/professional_provider.dart';
//import 'package:menu_digitale_tablette/models/professional_model/professional_model.dart';

class ProfessionalService {
  final ProfessionalProvider _provider = ProfessionalProvider();

       /*
        headers: {
          'Authorization': 'Bearer ${_provider.token}',
          'Content-Type': 'application/json',
        },*/

  Future<Either<String, Map<String, dynamic>>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/login'),
 
        body: {'email': email, 'password': password},
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return Right(jsonData);
      } else {
        return Left('Login failed');
      }
    } catch (e) {
      _showSnackbar('Error: $e', ContentType.failure);
      return Left('Error: $e');
    }
  }
  Future<Either<String, Map<String, dynamic>>> register(String name,String surname ,String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/register'),
        body: {'first_name':name,'last_name':surname,'email': email, 'password': password},
      );
      print(response.statusCode);
      if (response.statusCode == 201) {
        final jsonData = jsonDecode(response.body);
        return Right(jsonData);
      } else {
        
        return Left('registeration failed');
      }
    } catch (e) {
      _showSnackbar('Error: $e', ContentType.failure);
      return Left('Error: $e');
    }
  }

  void _showSnackbar(String message, ContentType contentType) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Error',
        message: message,
        contentType: contentType,
      ),
    );

    ScaffoldMessenger.of(_provider.context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
