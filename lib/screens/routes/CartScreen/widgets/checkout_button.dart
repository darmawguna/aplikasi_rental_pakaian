import 'package:flutter/material.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
