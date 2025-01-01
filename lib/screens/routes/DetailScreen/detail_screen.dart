// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class DetailScreen extends StatefulWidget {
//   const DetailScreen({super.key});

//   @override
//   State<DetailScreen> createState() => _DetailScreenState();
// }

// class _DetailScreenState extends State<DetailScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Text("Detail Screen"),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'size_selector.dart';
import 'color_selector.dart';
import 'description_section.dart';
import 'add_to_cart_button.dart'; // Pastikan Anda memiliki AddToCartButton di sini

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              Container(
                height: 420,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                    image: AssetImage('assets/detail.jpg'), // Ganti dengan gambar produk Anda
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 44, 16, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    DescriptionSection(),
                    SizedBox(height: 26),
                    SizeSelector(),
                    SizedBox(height: 15),
                    ColorSelector(),
                    SizedBox(height: 22),
                    AddToCartButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}