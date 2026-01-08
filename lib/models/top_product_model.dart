class TopProduct {
  final String name;
  final String productId;
  final double price;
  final int quantity;
  final String status;
  final String image;
  final String? sku;
  final String? type;

  TopProduct({
    required this.name,
    required this.productId,
    required this.price,
    required this.quantity,
    required this.status,
    required this.image,
    this.sku,
    this.type
  });
}
