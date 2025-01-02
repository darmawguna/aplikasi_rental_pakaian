part of 'product_cubit.dart';

@immutable
class ProductState {
  final List<Product> products;
  final String? errorMessage;

  const ProductState({required this.products, this.errorMessage});
}

final class ProductInitial extends ProductState {
  ProductInitial() : super(products: []);
}

final class ProductLoading extends ProductState {
  ProductLoading() : super(products: []);
}

final class ProductLoaded extends ProductState {
  const ProductLoaded({required super.products});
}

final class ProductSelected extends ProductState {
  final int productId;

  const ProductSelected({required super.products, required this.productId});
}

final class ProductError extends ProductState {
  ProductError({required String message})
    : super(products: [], errorMessage: message);
}
