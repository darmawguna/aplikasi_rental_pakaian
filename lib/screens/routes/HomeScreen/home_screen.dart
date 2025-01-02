
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
      resizeToAvoidBottomInset:
          true, // Menghindari tumpang tindih dengan keyboard
      body: SingleChildScrollView(
        // Membungkus seluruh konten dengan SingleChildScrollView
        child: Container(
          width:
              MediaQuery.of(
                context,
              ).size.width, // Menggunakan lebar penuh layar
          height:
              MediaQuery.of(
                context,
              ).size.height, // Menggunakan tinggi penuh layar
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: const [
              AccountHeader(),
              SizedBox(height: 24),
              DiscountBanner(),
              SizedBox(height: 24),
              CategorySection(),
              SizedBox(height: 16),
              ProductGrid(),
              // SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
