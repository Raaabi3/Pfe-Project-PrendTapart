import 'package:menu_digitale_tablette/models/product_model/Product.dart';

class ApiLinks {
  static const String baseUrl = 'http://127.0.0.1:8000/api';
  static const String login = '$baseUrl/login';
  static const String logout = '$baseUrl/logout';
  static const String getEstablishments = '$baseUrl/professionals/establishments';
  static const String getCommandes = '$baseUrl/commandes';
  static const String insertCommande = '$baseUrl/commandes/createOrder';
  static String deleteCommandes(int id) => '$baseUrl/commandes/$id/deleteOrder';
  static String   getcommandestatus(int id) => '$baseUrl/commandes/$id/status';
  static String   getprodstatus(int id) => '$baseUrl/commandes/$id/prodstatus';

  
  static String getCategoryandProduct(int id) => '$baseUrl/establishments/$id/getCategoriesWithProducts';
  static String deleteProuctFromCommandes(int commande_id,int product_id) => '$baseUrl/commandes/$commande_id/product/$product_id';


}





