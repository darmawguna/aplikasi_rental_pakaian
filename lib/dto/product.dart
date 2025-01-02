class Product {
  int id;
  String productName;
  String productCategory;
  String productSize;
  String productImage;
  String productPrice;
  String productDescription;
  int productAvailability;
  // int reservedQuantity;

  Product({
    required this.id,
    required this.productName,
    required this.productCategory,
    required this.productSize,
    required this.productImage,
    required this.productPrice,
    required this.productDescription,
    required this.productAvailability,
    // required this.reservedQuantity,
  });

  Product copyWith({int? productAvailability}) {
    return Product(
      id: id,
      productName: productName,
      productCategory: productCategory,
      productSize: productSize,
      productImage: productImage,
      productPrice: productPrice,
      productDescription: productDescription,
      productAvailability: productAvailability ?? this.productAvailability,
      // reservedQuantity: reservedQuantity,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      productName: json['product_name'] as String,
      productCategory: json['product_category'] as String,
      productSize: json['product_size'] as String,
      productImage: json['product_image'] as String,
      productPrice:
          json['product_price']?.toString() ??
          "0.0", // Pastikan menjadi string atau nilai default
      productDescription: json['product_description'] as String,
      productAvailability:
          json['product_availability'] as int? ??
          0, // Jika null, gunakan default 0
      // reservedQuantity: json['reserved_quantity'] as int
    );
  }

  factory Product.empty() {
    return Product(
      id: 0,
      productName: 'Produk Kosong',
      productDescription: 'Deskripsi tidak tersedia',
      productImage: '', // Bisa diganti dengan URL placeholder
      productPrice: "0.0",
      productAvailability: 0,
      productCategory: "productCategory",
      productSize: "productSize",
    );
  }
}
