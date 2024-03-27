class ApiLinks {
  static const String baseUrl = 'http://127.0.0.1:8000/api';
  static const String login = '$baseUrl/login';
  static const String logout = '$baseUrl/logout';
  static const String getEstablishments = '$baseUrl/professionals/establishments';
  static String getProducts(int id) => '$baseUrl/establishments/$id/products';
  static String getProductsSize(int id) => '$baseUrl/establishments/$id/size';
}
