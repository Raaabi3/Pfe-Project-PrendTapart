import 'package:http/http.dart' as http;

Future<http.Response> fetchEstablishmentS(token ,professionalid) async {

      final response = await http.get(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        Uri.parse('http://127.0.0.1:8000/api/professionals/$professionalid/establishments'),
      );
        return response;
      }