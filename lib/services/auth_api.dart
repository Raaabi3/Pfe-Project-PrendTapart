
import 'package:http/http.dart' as http;
import 'package:menu_digitale_tablette/helpers/providers/ApiLinks.dart';

        
      Future<http.Response> loginS(String email, String password) async {
      final response = await http.post(
        Uri.parse(ApiLinks.login),
        body: {'email': email, 'password': password},
      );
        return response;
      }

      
      Future<http.Response> fetchprofessionalS(String token) async {

      final response = await http.get(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        Uri.parse('http://127.0.0.1:8000/api/professionals/profile'),
      );
        return response;
      }


       Future<http.Response> logoutS(token) async {
      final response = await http.post(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        Uri.parse(ApiLinks.logout),
      );
        return response;
      }
  
