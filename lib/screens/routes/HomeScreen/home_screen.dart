// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Text("Home Screen"));
//   }
// }

import 'package:app_rental/screens/routes/HomeScreen/address_header.dart';
import 'package:app_rental/screens/routes/HomeScreen/category_section.dart';
import 'package:app_rental/screens/routes/HomeScreen/discount_banner.dart';
import 'package:app_rental/screens/routes/HomeScreen/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'widgets/address_header.dart';
// import 'widgets/discount_banner.dart';
// import 'widgets/category_section.dart';
// import 'widgets/product_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
        ),
        constraints: const BoxConstraints(maxWidth: 480),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.only(top: 45, left: 16, right: 16),
        child: Column(
          children: const [
            AddressHeader(),
            SizedBox(height: 24),
            DiscountBanner(),
            SizedBox(height: 24),
            CategorySection(),
            SizedBox(height: 16),
            ProductGrid(),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'widgets/address_header.dart';
// import 'widgets/discount_banner.dart';
// import 'widgets/category_section.dart';
// import 'widgets/product_grid.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(40),
//           color: Colors.white,
//         ),
//         constraints: const BoxConstraints(maxWidth: 480),
//         margin: const EdgeInsets.symmetric(horizontal: 16),
//         padding: const EdgeInsets.only(top: 45, left: 16, right: 16),
//         child: Column(
//           children: const [
//             AddressHeader(),
//             SizedBox(height: 24),
//             DiscountBanner(),
//             SizedBox(height: 24),
//             CategorySection(),
//             SizedBox(height: 16),
//             ProductGrid(),
//           ],
//         ),
//       ),
//     );
//   }
// }