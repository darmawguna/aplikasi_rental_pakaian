import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_rental/cubit/product/product_cubit.dart';
import 'package:app_rental/cubit/auth/auth_cubit.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  void initState() {
    super.initState();
    final token = BlocProvider.of<AuthCubit>(context).state.accessToken;
    if (token != null && token.isNotEmpty) {
      // Jika token tersedia, panggil fetchProducts dengan token tersebut
      context.read<ProductCubit>().fetchProducts(token);
    } else {
      // Tampilkan pesan jika token tidak ditemukan
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Token tidak ditemukan. Harap login terlebih dahulu.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          // Jika state adalah ProductLoading, tampilkan loading indicator
          if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator());
          }

          // Jika state adalah ProductLoaded, tampilkan daftar produk
          if (state is ProductLoaded) {
            final products = state.products;

            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  leading: Image.network(product.productImage),
                  title: Text(product.productName),
                  subtitle: Text(
                    '${product.productCategory} - ${product.productSize}',
                  ),
                  trailing: Text('Available: ${product.productAvailability}'),
                  onTap: () {
                    // Logika tambahan, misalnya membuka halaman detail produk
                  },
                );
              },
            );
          }

          // Jika ada error, tampilkan pesan error
          if (state is ProductError) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          }

          // Default: Tampilkan kosong jika tidak ada state
          return Center(child: Text('No products available.'));
        },
      ),
    );
  }
}
