import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SizeSelector extends StatelessWidget {
  const SizeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: GoogleFonts.lexendDeca(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.48,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _SizeOption(size: 'S'),
            const SizedBox(width: 12),
            _SizeOption(size: 'M'),
            const SizedBox(width: 12),
            _SizeOption(size: 'L', isSelected: true),
            const SizedBox(width: 12),
            _SizeOption(size: 'XL'),
            const SizedBox(width: 12),
            _SizeOption(size: 'XXL'),
          ],
        ),
      ],
    );
  }
}

class _SizeOption extends StatelessWidget {
  final String size;
  final bool isSelected;

  const _SizeOption({
    Key? key,
    required this.size,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: isSelected ? const Color(0xFF121212) : const Color(0xFFF5F5F5),
      ),
      child: Text(
        size,
        style: GoogleFonts.lexendDeca(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.11,
          color: isSelected ? Colors.white : const Color(0xFF9A9A9A),
        ),
      ),
    );
  }
}