
import 'package:http/http.dart' as http;

        
      Future<http.Response> loginS(String email, String password) async {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/login'),
        body: {'email': email, 'password': password},
      );
        return response;
      }
      Future<http.Response> registerS(String name,String surname ,String email, String password) async {

      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/register'),
        body: {'first_name':name,'last_name':surname,'email': email, 'password': password},
      );
        return response;
      }
      Future<http.Response> fetchprofessionalS(String token) async {

      final response = await http.get(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        Uri.parse('http://127.0.0.1:8000/api/profile'),
      );
        return response;
      }


       Future<http.Response> logoutS(token) async {
      final response = await http.post(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        Uri.parse('http://127.0.0.1:8000/api/logout'),
      );
        return response;
      }
  
