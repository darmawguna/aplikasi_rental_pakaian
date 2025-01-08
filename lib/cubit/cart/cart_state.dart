class CartItem {
  final String imageUrl;
  final int productId;
  final String productName;
  final String productSize;
  final String productPrice;
  int quantity;

  CartItem({
    required this.imageUrl,
    required this.productName,
    required this.productSize,
    required this.productPrice,
    required this.productId,
    this.quantity = 1, // Default quantity adalah 1
  });

  CartItem copyWith({int? quantity}) {
    return CartItem(
      imageUrl: imageUrl,
      productName: productName,
      productSize: productSize,
      productId: productId,
      productPrice: productPrice,
      quantity: quantity ?? this.quantity,
    );
  }
}
