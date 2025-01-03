import 'package:app_rental/cubit/cart/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<List<CartItem>> {
  CartCubit() : super([]);

  // Fungsi untuk menambah item ke keranjang
  void addToCart(CartItem item) {
    final currentItems = List<CartItem>.from(state);
    currentItems.add(item);
    emit(currentItems); // Emit pembaruan ke UI
  }

  // Fungsi untuk menghapus item dari keranjang
  void removeFromCart(CartItem item) {
    final currentItems = List<CartItem>.from(state);
    currentItems.remove(item);
    emit(currentItems); // Emit pembaruan ke UI
  }
}
