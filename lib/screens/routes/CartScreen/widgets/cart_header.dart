import 'package:flutter/material.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Icon(Icons.),
        const SizedBox(width: 20),
        const Text(
          'Cart',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF0D0D0E),
          ),
        ),
      ],
    );
  }
}
