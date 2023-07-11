class Product {
  final int product_number;
  final List<dynamic> images;
  final String? category_name;
  final String name;
  final String? description;
  final int stock_qty;
  final String price;
  final String? discount;

  Product(
      {required this.product_number,
      required this.images,
      required this.category_name,
      required this.name,
      required this.description,
      required this.stock_qty,
      required this.price,
      required this.discount});
}
