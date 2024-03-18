import 'package:http/http.dart' as http;

Future<http.Response> fetchListProductS(String token ,int establishmentid  ) async {

      final response = await http.get(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        Uri.parse('http://127.0.0.1:8000/establishments/$establishmentid/products'),
      );
        return response;
      }

Future<http.Response> fetchProductS(String token ,int establishmentid , int productid) async {
      final response = await http.get(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        Uri.parse('http://127.0.0.1:8000/establishments/$establishmentid/products/$productid'),
      );
        return response;
      }      
