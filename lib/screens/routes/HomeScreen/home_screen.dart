import 'package:app_rental/screens/routes/HomeScreen/address_header.dart';
import 'package:app_rental/screens/routes/HomeScreen/category_section.dart';
import 'package:app_rental/screens/routes/HomeScreen/discount_banner.dart';
import 'package:app_rental/screens/routes/HomeScreen/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:app_rental/cubit/product/product_cubit.dart';
import 'package:app_rental/cubit/auth/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final token = BlocProvider.of<AuthCubit>(context).state.accessToken;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (token != null && token.isNotEmpty) {
        context.read<ProductCubit>().fetchProducts(token);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Token tidak ditemukan. Harap login terlebih dahulu.',
            ),
          ),
        );
      }
    });
  }

  Future<void> _refreshProducts() async {
    final token = BlocProvider.of<AuthCubit>(context).state.accessToken;
    if (token != null && token.isNotEmpty) {
      context.read<ProductCubit>().clearCache(); // Bersihkan cache
      await context.read<ProductCubit>().fetchProducts(token); // Fetch ulang
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Token tidak ditemukan. Harap login terlebih dahulu.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Home')),
      body: RefreshIndicator(
        onRefresh: _refreshProducts,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 24),
                AccountHeader(),
                SizedBox(height: 24),
                DiscountBanner(),
                SizedBox(height: 24),
                CategorySection(),
                SizedBox(height: 16),
                ProductGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

