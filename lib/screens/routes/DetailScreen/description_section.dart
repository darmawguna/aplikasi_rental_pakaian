import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key, this.description, this.title});
  final String? description;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title',
          style: GoogleFonts.lexendDeca(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.48,
          ),
        ),
        const SizedBox(height: 12),
        RichText(
          text: TextSpan(
            style: GoogleFonts.lexendDeca(
              fontSize: 14,
              height: 1.57,
              color: const Color(0xFF2B2B2B),
            ),
            children: const [
              TextSpan(
                text:
                    'Lorem ipsum dolor sit amet consectetur. Ornare urna eleifend hac egestas ut eu. Hac amet aliquet hac lobortis neque tortor. ',
              ),
              TextSpan(
                text: 'Ornare urna eleifend hac egestas ut eur... ',
                style: TextStyle(color: Color(0xFF747474)),
              ),
              TextSpan(
                text: 'Read More',
                style: TextStyle(fontWeight: FontWeight.w500, height: 1.29),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
