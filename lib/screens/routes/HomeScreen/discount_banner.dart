import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF2E5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '30% Off',
                  style: GoogleFonts.lexendDeca(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.48,
                    color: const Color(0xFF2B2B2B),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'On your first shopping',
                  style: GoogleFonts.lexendDeca(
                    fontSize: 14,
                    color: const Color(0xFF2B2B2B),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Use Coupon: 6B98T409',
                  style: GoogleFonts.lexendDeca(
                    fontSize: 11,
                    letterSpacing: 0.11,
                    color: const Color(0xFF747474),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2B2B2B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 9,
                    ),
                  ),
                  child: Text(
                    'Shop Now',
                    style: GoogleFonts.lexendDeca(
                      fontSize: 11,
                      letterSpacing: 0.11,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 200, // Tentukan lebar container
            height: 150, // Tentukan tinggi container
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                8,
              ), // Tambahkan radius jika diperlukan
              image: DecorationImage(
                image: AssetImage('assets/diskon.png'),
                fit:
                    BoxFit.cover, // Menyesuaikan gambar dengan ukuran container
              ),
            ),
          )

        ],
      ),
    );
  }
}