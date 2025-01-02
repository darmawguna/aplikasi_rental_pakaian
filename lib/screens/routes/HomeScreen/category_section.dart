import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCategoryItem(
          'https://cdn.builder.io/api/v1/image/assets/TEMP/8c22048e3f1853919702e11f6b13b76fb1099b5307e8e30662730c44b8f793fa?placeholderIfAbsent=true&apiKey=f0b6280275464362ba1eb4e11a9f8717',
          'All Categories',
          true,
        ),
        _buildCategoryItem(
          'https://cdn.builder.io/api/v1/image/assets/TEMP/25ade1cdad86d0014a2d10dbe06df652234eadbaf0b1c6060bcb90f03928e5dd?placeholderIfAbsent=true&apiKey=f0b6280275464362ba1eb4e11a9f8717',
          'Gent\'s',
          false,
        ),
        _buildCategoryItem(
          'https://cdn.builder.io/api/v1/image/assets/TEMP/77189dbf5528b514d177d1d01c29c6aacc83fbfbaab6ff802be54fc0d2cb8e74?placeholderIfAbsent=true&apiKey=f0b6280275464362ba1eb4e11a9f8717',
          'Ladies',
          false,
        ),
        _buildCategoryItem(
          'https://cdn.builder.io/api/v1/image/assets/TEMP/c1f445e7963b51cf603adfb64f8170bc0b0b91f5d301cb1552c9d6cc69957f77?placeholderIfAbsent=true&apiKey=f0b6280275464362ba1eb4e11a9f8717',
          'Kids',
          false,
        ),
      ],
    );
  }

  Widget _buildCategoryItem(String imageUrl, String label, bool isSelected) {
    return Column(
      children: [
        Image.network(
          imageUrl,
          width: 58,
          height: 58,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.lexendDeca(
            fontSize: 11,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isSelected
                ? const Color(0xFF2B2B2B)
                : const Color(0xFF9A9A9A),
          ),
        ),
      ],
    );
  }
}