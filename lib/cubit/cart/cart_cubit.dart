import 'package:app_rental/cubit/cart/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<List<CartItem>> {
  CartCubit() : super([]);

  // Fungsi untuk menambah item ke keranjang
  void addToCart(CartItem item) {
    final currentItems = List<CartItem>.from(state);
    // currentItems.add(item);
    final existingItemIndex = currentItems.indexWhere(
      (cartItem) => cartItem.productId == item.productId,
    );

    if (existingItemIndex != -1) {
      // Jika item sudah ada, tambahkan quantity
      final existingItem = currentItems[existingItemIndex];
      currentItems[existingItemIndex] = existingItem.copyWith(
        quantity: existingItem.quantity + 1,
      );
    } else {
      // Jika item belum ada, tambahkan sebagai item baru
      currentItems.add(item);
    }

    emit(currentItems); // Emit pembaruan ke UI
  }

  // Fungsi untuk menghapus item dari keranjang
  void removeFromCart(CartItem item) {
    final currentItems = List<CartItem>.from(state);
    // currentItems.remove(item);
    currentItems.removeWhere(
      (cartItem) => cartItem.productId == item.productId,
    );
    emit(currentItems); 
    emit(currentItems); // Emit pembaruan ke UI
  }
  int getTotalQuantity() {
    return state.fold<int>(0, (total, item) => total + item.quantity);
  }
}

