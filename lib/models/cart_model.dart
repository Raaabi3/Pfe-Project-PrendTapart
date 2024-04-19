class Cart {
  final int productId;
  final String productName;
  final String img;
  double price;
  int quantity;
  List<Map<String, dynamic>> selectedOptionsList =[];


  Cart({
    required this.productId,
    required this.productName,
    required this.img,
    required this.price,
    required this.quantity,
    required this.selectedOptionsList,
  });
}
