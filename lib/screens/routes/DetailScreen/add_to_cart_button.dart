import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFF2B2B2B),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://cdn.builder.io/api/v1/image/assets/TEMP/8dbd97f73f83267faf05b31f80caeafb92640461a082b361977d59f2fd105853?placeholderIfAbsent=true&apiKey=f0b6280275464362ba1eb4e11a9f8717',
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 6),
          Text(
            'Add to cart',
            style: GoogleFonts.lexendDeca(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.32,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}