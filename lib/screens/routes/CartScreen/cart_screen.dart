// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key});

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Text("Cart Screen"));
//   }
// }

import 'package:app_rental/screens/routes/CartScreen/widgets/cart_header.dart';
import 'package:app_rental/screens/routes/CartScreen/widgets/checkout_button.dart';
import 'package:app_rental/screens/routes/CartScreen/widgets/date_selector.dart';
import 'package:app_rental/screens/routes/CartScreen/widgets/order_item.dart';
import 'package:app_rental/screens/routes/CartScreen/widgets/total_summary.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        constraints: const BoxConstraints(maxWidth: 480),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.fromLTRB(30, 50, 30, 148),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CartHeader(),
            const SizedBox(height: 40),
            const Text(
              'Myy Orders',
              style: TextStyle(
                fontSize: 40,
                color: Color(0xFF0D0D0E),
              ),
            ),
            const OrderItem(),
            const DateSelector(),
            const SizedBox(height: 37), // Add space before the Divider
            const Divider(
              height: 1,
              thickness: 1,
              color: Color(0xFFE3E3E3),
            ),
            const SizedBox(height: 37), // Add space after the Divider
            const TotalSummary(),
            const CheckoutButton(),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:cart/widgets/cart_header.dart';
// import 'package:cart/widgets/order_item.dart';
// import 'package:cart/widgets/date_selector.dart';
// import 'package:cart/widgets/total_summary.dart';
// import 'package:cart/widgets/checkout_button.dart';

// class CartScreen extends StatelessWidget {
//   const CartScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(40),
//       ),
//       constraints: const BoxConstraints(maxWidth: 480),
//       margin: const EdgeInsets.symmetric(horizontal: 16),
//       padding: const EdgeInsets.fromLTRB(30, 50, 30, 148),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           CartHeader(),
//           SizedBox(height: 40),
//           Text(
//             'My Orders',
//             style: TextStyle(
//               fontSize: 40,
//               color: Color(0xFF0D0D0E),
//             ),
//           ),
//           OrderItem(),
//           DateSelector(),
//           Divider(
//             height: 1,
//             thickness: 1,
//             color: Color(0xFFE3E3E3),
//             margin: EdgeInsets.symmetric(vertical: 37),
//           ),
//           TotalSummary(),
//           CheckoutButton(),
//         ],
//       ),
//     );
//   }
// }