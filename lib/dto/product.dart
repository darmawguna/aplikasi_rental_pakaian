

class Product {
  int id;
  String productName;
  String productCategory;
  String productSize;
  String productImage;
  double productPrice;
  String productDescription;
  int productAvailability;

  Product({
    required this.id,
    required this.productName,
    required this.productCategory,
    required this.productSize,
    required this.productImage,
    required this.productPrice,
    required this.productDescription,
    required this.productAvailability,
  });


  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      productName: json['product_name'] as String,
      productCategory: json['product_category'] as String,
      productSize: json['product_size'] as String,
      productImage: json['product_image'] as String,
      productPrice: json['product_price'] as double,
      productDescription: json['product_description'] as String,
      productAvailability: json['product_availibilty'] as int,
    );
  }
}
