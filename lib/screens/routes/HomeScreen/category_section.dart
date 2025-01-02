import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  // Menyimpan indeks kategori yang dipilih
  int _selectedIndex = 0;

  void _onCategorySelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Membungkus Row dengan SingleChildScrollView untuk scroll horizontal
      scrollDirection: Axis.horizontal, // Mengatur scroll horizontal
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(4, (index) {
          return GestureDetector(
            onTap: () => _onCategorySelected(index),
            child: _buildCategoryItem(
              _getImageUrl(index),
              _getLabel(index),
              _selectedIndex == index,
            ),
          );
        }),
      ),
    );
  }

  String _getImageUrl(int index) {
    switch (index) {
      case 0:
        return 'https://upload.wikimedia.org/wikipedia/commons/4/4f/Iconic_image_of_men_and_women_s_apparel%2C_shopping_cart_and_the_logo_of_all_category%2C_Showcase_Fashion%2C_.jpg';
      case 1:
        return 'https://upload.wikimedia.org/wikipedia/commons/a/a5/Menswear_icon_01.svg';
      case 2:
        return 'https://upload.wikimedia.org/wikipedia/commons/7/71/Fashion_Female_Icon.png';
      case 3:
        return 'https://upload.wikimedia.org/wikipedia/commons/4/47/Kids_Icon.svg';
      default:
        return '';
    }
  }

  String _getLabel(int index) {
    switch (index) {
      case 0:
        return 'All Categories';
      case 1:
        return 'Gent\'s';
      case 2:
        return 'Ladies';
      case 3:
        return 'Kids';
      default:
        return '';
    }
  }

  Widget _buildCategoryItem(String imageUrl, String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ), // Memberikan jarak antar item
      child: Column(
        children: [
          // Image.network(imageUrl, width: 58, height: 58, fit: BoxFit.contain),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.lexendDeca(
              fontSize: 11,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color:
                  isSelected
                      ? const Color(0xFF2B2B2B)
                      : const Color(0xFF9A9A9A),
            ),
          ),
        ],
      ),
    );
  }
}
