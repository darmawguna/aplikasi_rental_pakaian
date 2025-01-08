import 'package:app_rental/cubit/cart/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_rental/cubit/cart/cart_cubit.dart'; // Pastikan import CartCubit

class ShoppingCartIcon extends StatelessWidget {
  const ShoppingCartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 9), // Menambahkan jarak antar ikon
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/cart-screen");
            // Tindakan yang dilakukan ketika ikon keranjang diklik
            print("Ikon keranjang diklik");
          },
          child: Stack(
            children: [
              const Icon(
                Icons.shopping_cart, // Ikon untuk keranjang belanja
                size: 24,
                color: Colors.black, // Warna ikon bisa disesuaikan
              ),
              BlocBuilder<CartCubit, List<CartItem>>(
                builder: (context, cartItems) {
                  int itemCount = cartItems.fold<int>(
                    0,
                    (total, item) => total + item.quantity,
                  );
                  return Positioned(
                    right: 0,
                    top: 0,
                    child:
                        itemCount > 0
                            ? Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 16,
                                minHeight: 16,
                              ),
                              child: Text(
                                '$itemCount',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                            : const SizedBox.shrink(),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
