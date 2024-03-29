class ApiLinks {
  static const String baseUrl = 'http://127.0.0.1:8000/api';
  static const String login = '$baseUrl/login';
  static const String logout = '$baseUrl/logout';
  static const String getEstablishments = '$baseUrl/professionals/establishments';
  static String getProductsbyCategory(int id) => '$baseUrl/establishments/$id/productcategorie';
  static String getProductsSize(int id) => '$baseUrl/establishments/$id/size';
  static String getProductsExtra(int id) => '$baseUrl/establishments/$id/extra';
  //static String getproductsbycategory(int id) => '$baseUrl/establishments/$id/categories';
  static String getCategory(int id) => '$baseUrl/establishments/$id/categories';
  
}





