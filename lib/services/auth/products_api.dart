import 'package:http/http.dart' as http;

Future<http.Response> fetchListProductS(String token ,int id  ) async {

      final response = await http.get(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        Uri.parse('http://127.0.0.1:8000/api/establishments/$id/products'),
      );
        return response;
      }

Future<http.Response> fetchProductSizeS(String token ,int id  ) async {

      final response = await http.get(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        Uri.parse('http://127.0.0.1:8000/api/establishments/$id/size'),
      );
        return response;
      }

