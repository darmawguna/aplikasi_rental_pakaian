import 'package:app_rental/cubit/cart/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_rental/screens/routes/CartScreen/widgets/cart_header.dart';
import 'package:app_rental/screens/routes/CartScreen/widgets/order_item.dart';
import 'package:app_rental/screens/routes/CartScreen/widgets/total_summary.dart';
import 'package:app_rental/cubit/cart/cart_cubit.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Screen'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigator.pop(context); // Navigasi kembali ke HomeScreen
            // Navigator.pushnamed('/home');
            Navigator.pushNamed(context, '/home-screen');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 148),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CartHeader(),
              const SizedBox(height: 40),
              const Text(
                'My Orders',
                style: TextStyle(fontSize: 40, color: Color(0xFF0D0D0E)),
              ),
              // Menampilkan item keranjang menggunakan BlocBuilder
              BlocBuilder<CartCubit, List<CartItem>>(
                builder: (context, cartItems) {
                  return Column(
                    children:
                        cartItems.map((item) {
                          return OrderItem(
                            cartItem: item,
                          ); // Menyediakan data untuk OrderItem
                        }).toList(),
                  );
                },
              ),
              // const SizedBox(height: 37), // Add space before the Divider
              const Divider(height: 1, thickness: 1, color: Color(0xFFE3E3E3)),
              const SizedBox(height: 37), // Add space after the Divider
              const TotalSummary(),
              Padding(
                padding: const EdgeInsets.only(top: 39),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF7A00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(90),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 39,
                        vertical: 22,
                      ),
                      minimumSize: const Size(190, 0),
                    ),
                    child: const Text(
                      'Checkout Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        letterSpacing: 0.18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
