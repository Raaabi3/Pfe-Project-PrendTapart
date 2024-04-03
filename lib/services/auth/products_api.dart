import 'package:http/http.dart' as http;
import 'package:menu_digitale_tablette/helpers/providers/ApiLinks.dart';

Future<http.Response> fetchListProductS(token, id, page, perPage) async {
  final response = await http.get(
    Uri.parse('${ApiLinks.getProductsbyCategory(id)}?page=$page&perPage=$perPage'),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );
  return response;
}

Future<http.Response> fetchProductSizeS(String token ,int id  ) async {

      final response = await http.get(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        Uri.parse(ApiLinks.getProductsSize(id)),
      );
        return response;
      }
      
      Future<http.Response> fetchProductExtraS(String token ,int id  ) async {

      final response = await http.get(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        Uri.parse(ApiLinks.getProductsExtra(id)),
      );
        return response;
      }

    
    

