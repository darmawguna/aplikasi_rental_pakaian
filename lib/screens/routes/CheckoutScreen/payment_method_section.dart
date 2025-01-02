import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethodSection extends StatelessWidget {
  const PaymentMethodSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40),
        Text(
          'Payment Method',
          style: GoogleFonts.imprima(
            fontSize: 16,
            color: const Color(0xFF797780),
          ),
        ),
        const SizedBox(height: 16),
        Image.network(
          'https://cdn.builder.io/api/v1/image/assets/TEMP/85123b8929f136b4ba04a5492c750d921601825c9d84ff3687ae29c264f70421?placeholderIfAbsent=true&apiKey=f0b6280275464362ba1eb4e11a9f8717',
          width: 315,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 24),
        RichText(
          text: TextSpan(
            style: GoogleFonts.imprima(
              fontSize: 15,
              height: 1.6,
              color: const Color(0xFF797780),
            ),
            children: const [
              TextSpan(
                text: 'Note: ',
                style: TextStyle(color: Colors.red),
              ),
              TextSpan(
                text: 'Use your order id at the payment. Your Id ',
              ),
              TextSpan(
                text: '#154619',
                style: TextStyle(color: Color(0xFF161626)),
              ),
              TextSpan(
                text: ' if you forget to put your order id we cant confirm the payment.',
              ),
            ],
          ),
        ),
      ],
    );
  }
}