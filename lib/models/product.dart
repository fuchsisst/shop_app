class Product {
  late final String id;
  late final String title;
  late final String description;
  late final double price;
  late bool isFavorite;

  Product({required this.id, required this.title, required this.description, required this.price, this.isFavorite = false});
}