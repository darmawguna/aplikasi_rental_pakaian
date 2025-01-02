import 'package:flutter/material.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          'https://cdn.builder.io/api/v1/image/assets/TEMP/073afedfd2f8f6cde15b6091d1ea40bc4ef40a310eefdcb858eb5644e58694cf',
          width: 30,
          height: 30,
          fit: BoxFit.contain,
        ),
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
