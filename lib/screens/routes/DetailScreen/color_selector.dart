import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorSelector extends StatelessWidget {
  const ColorSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Color',
          style: GoogleFonts.lexendDeca(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.48,
          ),
        ),
        const Spacer(),
        _ColorOption(
          color: const Color(0xFF2B2B2B),
          isSelected: true,
        ),
        const SizedBox(width: 12),
        _ColorOption(color: const Color(0xFFEC9E08)),
        const SizedBox(width: 12),
        _ColorOption(color: const Color(0xFF1A5EE3)),
        const SizedBox(width: 12),
        _ColorOption(color: const Color(0xFFF05A5A)),
      ],
    );
  }
}

class _ColorOption extends StatelessWidget {
  final Color color;
  final bool isSelected;

  const _ColorOption({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isSelected ? 27 : 24,
      height: isSelected ? 27 : 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: isSelected ? Border.all(color: Colors.black, width: 1.5) : null,
      ),
      child: Center(
        child: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}