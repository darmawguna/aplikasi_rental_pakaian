import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_rental/cubit/product/product_cubit.dart';
import 'package:app_rental/endpoints/endpoints.dart';
import 'size_selector.dart';
import 'color_selector.dart';
import 'description_section.dart';
import 'add_to_cart_button.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          AddToCartButton(
                            // product: selectedProduct, // Uncomment jika memerlukan data produk
                          ),
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
