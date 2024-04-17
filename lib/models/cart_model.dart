class Cart {
  final int productId;
  final String productName;
  final String img;
  final double price;
  int quantity;

  Cart({
    required this.productId,
    required this.productName,
    required this.img,
    required this.price,
    required this.quantity,
  });
}
