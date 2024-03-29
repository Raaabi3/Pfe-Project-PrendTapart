
import 'package:http/http.dart' as http;
import 'package:menu_digitale_tablette/helpers/providers/ApiLinks.dart';

Future<http.Response> fetchCategoryS(token ,id ) async {

      final response = await http.get(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        Uri.parse(ApiLinks.getCategory(id)),
      );
        return response;
      }