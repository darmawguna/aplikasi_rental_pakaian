import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildProductCard(
              'https://cdn.builder.io/api/v1/image/assets/TEMP/e38424c77239862a6a308a085b351b546faa71ebe6f74dad69a8d9fc4f9037d9?placeholderIfAbsent=true&apiKey=f0b6280275464362ba1eb4e11a9f8717',
              'Men Full Sleeve Shirt',
              '30.49',
              '35.00',
            ),
            _buildProductCard(
              'https://cdn.builder.io/api/v1/image/assets/TEMP/520b6d891ed62c086c624615af84e0072bbb3da2ddfec548b85f2adce9a474f9?placeholderIfAbsent=true&apiKey=f0b6280275464362ba1eb4e11a9f8717',
              'Women Blazer',
              '24.99',
              '28.99',
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              'https://cdn.builder.io/api/v1/image/assets/TEMP/0db18d21bed73d1c81d727e4608551ad4f19abbfedd1934beda513e965a50698?placeholderIfAbsent=true&apiKey=f0b6280275464362ba1eb4e11a9f8717',
              width: 164,
              fit: BoxFit.contain,
            ),
            Image.network(
              'https://cdn.builder.io/api/v1/image/assets/TEMP/f5b0d59ad432770a2fc02324b5e7ac217f85ec33de75d20c92f99d0f1d52c513?placeholderIfAbsent=true&apiKey=f0b6280275464362ba1eb4e11a9f8717',
              width: 164,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProductCard(
    String imageUrl,
    String title,
    String price,
    String originalPrice,
  ) {
    return SizedBox(
      width: 164,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            width: 164,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: GoogleFonts.lexendDeca(
              fontSize: 14,
              color: const Color(0xFF121212),
            ),
          ),
          Row(
            children: [
              Text(
                '\$$price',
                style: GoogleFonts.lexendDeca(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.48,
                  color: const Color(0xFF9A9A9A),
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '\$$originalPrice',
                style: GoogleFonts.lexendDeca(
                  fontSize: 11,
                  letterSpacing: 0.11,
                  color: const Color(0xFF9A9A9A),
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}