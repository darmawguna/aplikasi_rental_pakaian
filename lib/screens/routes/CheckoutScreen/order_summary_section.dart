import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Items (1)',
                style: GoogleFonts.imprima(
                  fontSize: 18,
                  color: const Color(0xFF797780),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Total Payment',
                style: GoogleFonts.imprima(
                  fontSize: 18,
                  color: const Color(0xFF797780),
                ),
              ),
            ],
          ),
          const SizedBox(width: 100),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'RP.126.000',
                style: GoogleFonts.imprima(
                  fontSize: 18,
                  color: const Color(0xFF0D0D0E),
                ),
              ),
              const SizedBox(height: 22),
              Text(
                'RP.126.000',
                style: GoogleFonts.imprima(
                  fontSize: 18,
                  color: const Color(0xFF0D0D0E),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}