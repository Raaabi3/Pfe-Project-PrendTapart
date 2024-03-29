// ignore_for_file: public_member_api_docs, sort_constructors_first
class Cart {
  final int user_id;
  final int product_id;
  final int establishment_id;
  final double  price;
  final DateTime created_at;
  Cart({
    required this.user_id,
    required this.product_id,
    required this.establishment_id,
    required this.price,
    required this.created_at,
  });
}
