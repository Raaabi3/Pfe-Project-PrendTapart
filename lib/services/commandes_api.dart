import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:menu_digitale_tablette/helpers/providers/ApiLinks.dart';

Future<http.Response> insertCommande(token ,Map<String, dynamic> bodyData ) async {

      final response = await http.post(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        Uri.parse(ApiLinks.insertCommande),
        body: jsonEncode(bodyData)
      );
        return response;
      }
Future<http.Response> fetchCommandesS(token) async {

      final response = await http.get(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        Uri.parse(ApiLinks.getCommandes),
      );
        return response;
      }   
Future<http.Response> deleteCommandesS(token,id) async {

      final response = await http.delete(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        Uri.parse(ApiLinks.deleteCommandes(id)),
      );
        return response;
      } 
      Future<http.Response> deleteProductFromCommandesS(token,commande_id,product_id) async {

      final response = await http.delete(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        Uri.parse(ApiLinks.deleteProuctFromCommandes(commande_id,product_id)),
      );
        return response;
      }         



    
    

