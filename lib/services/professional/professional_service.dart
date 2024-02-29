
import 'package:http/http.dart' as http;
    /*
        headers: {
          'Authorization': 'Bearer ${_provider.token}',
          'Content-Type': 'application/json',
        },*/
        
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
  /*    
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
      return Left('Error: $e');
    }
  }
  */
