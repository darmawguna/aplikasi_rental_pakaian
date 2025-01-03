class CartItemDto {
  final String id; // ID unik untuk item (misalnya, UUID atau ID produk)
  final String imageUrl; // URL gambar produk
  final String productName; // Nama produk
  final String productSize; // Ukuran produk
  final String productColor; // Warna produk
  final double productPrice; // Harga produk
  final int quantity; // Jumlah item dalam keranjang

  CartItemDto({
    required this.id,
    required this.imageUrl,
    required this.productName,
    required this.productSize,
    required this.productColor,
    required this.productPrice,
    required this.quantity,
  });

  // Konversi dari JSON ke CartItemDto
  factory CartItemDto.fromJson(Map<String, dynamic> json) {
    return CartItemDto(
      id: json['id'],
      imageUrl: json['imageUrl'],
      productName: json['productName'],
      productSize: json['productSize'],
      productColor: json['productColor'],
      productPrice: json['productPrice'],
      quantity: json['quantity'],
    );
  }

  // Konversi dari CartItemDto ke JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'productName': productName,
      'productSize': productSize,
      'productColor': productColor,
      'productPrice': productPrice,
      'quantity': quantity,
    };
  }
}
