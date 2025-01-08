import 'package:app_rental/screens/routes/HomeScreen/shoping_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountHeader extends StatelessWidget {
  const AccountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                // Tindakan yang dilakukan ketika icon orang diklik
                // print("Icon orang diklik");
              },
              child: const Icon(
                Icons.person, // Icon untuk orang
                size: 24,
                color: Colors.black, // Warna icon bisa disesuaikan
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address',
                  style: GoogleFonts.lexendDeca(
                    fontSize: 11,
                    color: const Color(0xFF747474),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Uttara, Dhaka',
                  style: GoogleFonts.lexendDeca(
                    fontSize: 14,
                    color: const Color(0xFF2B2B2B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        ShoppingCartIcon()
      ],
    );
  }
}
