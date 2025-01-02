import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_rental/dto/product.dart';
import 'package:app_rental/services/data_service.dart';
import 'package:meta/meta.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  // Cache untuk menyimpan data produk
  List<Product>? _cachedProducts;

  // // ID produk yang sedang dipilih
  // int? _selectedProductId;

  Future<void> fetchProducts(String token) async {
    // Gunakan cache jika tersedia
    if (_cachedProducts != null) {
      emit(ProductLoaded(products: _cachedProducts!));
      return;
    }

    emit(ProductLoading());
    try {
      final products = await DataService.fetchProducts(token);
      _cachedProducts = products; // Simpan ke cache
      emit(ProductLoaded(products: products));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }

  void clearCache() {
    _cachedProducts = null; // Menghapus cache
  }

  void updateProductAvailability(int productId, int newAvailability) {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;
      final updatedProducts =
          currentState.products.map((product) {
            if (product.id == productId) {
              return product.copyWith(productAvailability: newAvailability);
            }
            return product;
          }).toList();

      // Perbarui cache dan state
      _cachedProducts = updatedProducts;
      emit(ProductLoaded(products: updatedProducts));
    }
  }

  void updateStock(int productId, int quantitySold) {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;
      final updatedProducts =
          currentState.products.map((product) {
            if (product.id == productId) {
              final updatedStock = product.productAvailability - quantitySold;
              return product.copyWith(productAvailability: updatedStock);
            }
            return product;
          }).toList();

      // Perbarui cache dan state
      _cachedProducts = updatedProducts;
      emit(ProductLoaded(products: updatedProducts));
    } else {
      emit(ProductError(message: "Product not found or not loaded"));
    }
  }

  void setSelectedProduct(int productId) {
    if (_cachedProducts != null) {
      emit(ProductSelected(products: _cachedProducts!, productId: productId));
    } else {
      emit(ProductError(message: "Produk belum dimuat"));
    }
  }

  Product? getSelectedProduct() {
    if (state is ProductSelected) {
      final currentState = state as ProductSelected;
      return currentState.products.firstWhere(
        (product) => product.id == currentState.productId,
        orElse: () => Product.empty(),
      );
    }
    return null;
  }
}
