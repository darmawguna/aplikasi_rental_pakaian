import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_rental/dto/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_rental/cubit/product/product_cubit.dart';
import 'package:app_rental/endpoints/endpoints.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductLoaded) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.6, // Atur tinggi
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return _buildProductCard(context, state.products[index]);
              },
            ),
          );
        } else if (state is ProductError) {
          return Center(child: Text(state.errorMessage ?? "Terjadi kesalahan"));
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildProductCard(BuildContext context, Product product) {
    return InkWell(
      onTap: () {
        context.read<ProductCubit>().setSelectedProduct(product.id);
        Navigator.pushNamed(context, "/detail-screen");
      },
      child: SizedBox(
        width: 164,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  "${Endpoints.storageImage}${product.productImage}",
                  width: 164,
                  height: 120,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          value:
                              loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                        ),
                      );
                    }
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.error,
                    ); // Placeholder if image fails to load
                  },
                ),
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
                  "Rp ${product.productPrice}",
                  style: GoogleFonts.lexendDeca(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.48,
                    color: const Color(0xFF9A9A9A),
                  ),
                ),
                Text(
                  "Stok: ${product.productAvailability}",
                  style: GoogleFonts.lexendDeca(
                    fontSize: 11,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                debugPrint("Add to Cart clicked");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black12,
                minimumSize: const Size(double.infinity, 36),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
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
      ),
    );
  }
}
