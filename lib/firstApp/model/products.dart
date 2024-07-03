class Product {
  final int id;
  final String itemname;
  final double price;
  final String category;
  late int quantity;
  final String description;
  final String image;

  Product(
      {required this.id,
      required this.itemname,
      required this.category,
      required this.description,
      required this.quantity,
      required this.price,
      required this.image});
}
