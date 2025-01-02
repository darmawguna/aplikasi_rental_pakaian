import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_rental/dto/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_rental/cubit/product/product_cubit.dart';

class ProductGrid extends StatefulWidget {
  const ProductGrid({super.key});

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  // final List<bool> _isFavoriteList = [
  //   false,
  //   false,
  // ]; // Status favorit untuk setiap produk

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductLoaded) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  return _buildProductCard(state.products[index]);
                },
              );
            } else if (state is ProductError) {
              return Center(child: Text("$state.errorMessage"));
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }

  Widget _buildProductCard(Product product) {
    return SizedBox(
      width: 164,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // Image.network(imageUrl, width: 164, fit: BoxFit.contain),
              // Positioned(
              //   top: 0,
              //   right: 0,
              //   child: IconButton(
              //     onPressed: () {
              //       setState(() {
              //         _isFavoriteList[index] = !_isFavoriteList[index];
              //       });
              //     },
              //     icon: Icon(
              //       _isFavoriteList[index]
              //           ? Icons.favorite
              //           : Icons.favorite_border,
              //       color:
              //           _isFavoriteList[index]
              //               ? const Color(0xFFE91E63)
              //               : Colors.grey,
              //     ),
              //   ),
              // ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            product.productName,
            style: GoogleFonts.lexendDeca(
              fontSize: 14,
              color: const Color(0xFF121212),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$product.productPrice",
                style: GoogleFonts.lexendDeca(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.48,
                  color: const Color(0xFF9A9A9A),
                ),
              ),
              const SizedBox(width: 4),
              Row(
                children: [
                  Text("stok :"),
                  Text(
                    "$product.productAvailability",
                    style: GoogleFonts.lexendDeca(
                      fontSize: 11,
                      letterSpacing: 0.11,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              debugPrint("Add to Cart clicked");
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith<Color>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.hovered)) {
                  return Colors.grey; // Warna saat di-hover
                }
                return Colors.black12; // Warna default
              }),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              minimumSize: WidgetStateProperty.all<Size>(
                const Size(double.infinity, 36),
              ),
            ),
            child: Text(
              'Add to Cart',
              style: GoogleFonts.lexendDeca(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
