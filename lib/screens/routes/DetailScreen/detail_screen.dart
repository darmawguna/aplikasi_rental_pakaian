import 'package:app_rental/cubit/cart/cart_cubit.dart';
import 'package:app_rental/cubit/cart/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:app_rental/cubit/product/product_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_rental/endpoints/endpoints.dart';
import 'size_selector.dart';
// import 'color_selector.dart';
import 'description_section.dart';
// import 'add_to_cart_button.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/home-screen',
            ); // Navigasi kembali ke HomeScreen
          },
        ),
      ),
      body: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          if (state is ProductError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Terjadi kesalahan'),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductSelected) {
            // Mendapatkan produk yang dipilih dari state
            final selectedProduct = state.products.firstWhere(
              (product) => product.id == state.productId,
            );

            return SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 480),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Menampilkan gambar produk
                    Container(
                      height: 420,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        image: DecorationImage(
                          image: NetworkImage(
                            "${Endpoints.storageImage}${selectedProduct.productImage}",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 44, 16, 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Menampilkan deskripsi produk
                          DescriptionSection(
                            description: selectedProduct.productDescription,
                            title: selectedProduct.productName,
                          ),
                          const SizedBox(height: 26),
                          // Menampilkan ukuran produk
                          SizeSelector(
                            selectedProductSize:
                                selectedProduct
                                    .productSize, // Uncomment jika tersedia
                          ),
                          const SizedBox(height: 15),
                          // Menampilkan warna produk
                          // ColorSelector(
                          //   // colors: selectedProduct.availableColors, // Uncomment jika tersedia
                          // ),
                          const SizedBox(height: 22),
                          // Tombol untuk menambah produk ke keranjang
                          // AddToCartButton(
                          //   // product: selectedProduct, // Uncomment jika memerlukan data produk
                          // ),
                          Container(
                            width: double.infinity,
                            height: 48,
                            decoration: BoxDecoration(
                              color: const Color(0xFF2B2B2B),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(width: 6),
                                InkWell(
                                  onTap: () {
                                    context.read<CartCubit>().addToCart(
                                      CartItem(
                                        productId: selectedProduct.id,
                                        imageUrl:
                                            "${Endpoints.storageImage}${selectedProduct.productImage}",
                                        productName:
                                            selectedProduct.productName,
                                        productSize:
                                            selectedProduct.productSize,

                                        productPrice:
                                            "Rp ${selectedProduct.productPrice}",
                                      ),
                                    );
                                    Navigator.pushNamed(
                                      context,
                                      "/cart-screen",
                                    );
                                  },
                                  child: Text(
                                    'Add to cart',
                                    style: GoogleFonts.lexendDeca(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.32,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is ProductError) {
            return Center(
              child: Text(state.errorMessage ?? "Terjadi kesalahan"),
            );
          }

          return const Center(child: Text("Tidak ada produk yang dipilih"));
        },
      ),
    );
  }
}
