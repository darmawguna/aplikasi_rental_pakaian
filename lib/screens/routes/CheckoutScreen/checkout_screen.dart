// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class CheckoutScreen extends StatefulWidget {
//   const CheckoutScreen({super.key});

//   @override
//   State<CheckoutScreen> createState() => _CheckoutScreenState();
// }

// class _CheckoutScreenState extends State<CheckoutScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Text("Checkout Screen"));
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'payment_method_section.dart'; // Pastikan Anda memiliki file ini
import 'order_summary_section.dart'; // Pastikan Anda memiliki file ini

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          constraints: const BoxConstraints(maxWidth: 480),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 316),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.network(
                    'https://cdn.builder.io/api/v1/image/assets/TEMP/073afedfd2f8f6cde15b6091d1ea40bc4ef40a310eefdcb858eb5644e58694cf?placeholderIfAbsent=true&apiKey=f0b6280275464362ba1eb4e11a9f8717',
                    width: 30,
                    height: 30,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    'Checkout',
                    style: GoogleFonts.imprima(
                      fontSize: 18,
                      color: const Color(0xFF0D0D0E),
                    ),
                  ),
                ],
              ),
              const PaymentMethodSection(),
              const OrderSummarySection(),
              const SizedBox(height: 71),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Tambahkan logika pembayaran di sini
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF7A00),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 61,
                      vertical: 22,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90),
                    ),
                  ),
                  child: Text(
                    'Pay Now',
                    style: GoogleFonts.imprima(
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 0.18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 7),
              Center(
                child: Image.network(
                  'https://cdn.builder.io/api/v1/image/assets/TEMP/d94df3ae1aa4faea75c8f12c64e16f63f88e10899b073d331e61a1ef0b2ed953?placeholderIfAbsent=true&apiKey=f0b6280275464362ba1eb4e11a9f8717',
                  width: 32,
                  height: 4,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'payment_method_section.dart';
// import 'order_summary_section.dart';

// class CheckoutScreen extends StatelessWidget {
//   const CheckoutScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(40),
//           ),
//           constraints: const BoxConstraints(maxWidth: 480),
//           margin: const EdgeInsets.symmetric(horizontal: 16),
//           padding: const EdgeInsets.fromLTRB(30, 50, 30, 316),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Image.network(
//                     'https://cdn.builder.io/api/v1/image/assets/TEMP/073afedfd2f8f6cde15b6091d1ea40bc4ef40a310eefdcb858eb5644e58694cf?placeholderIfAbsent=true&apiKey=f0b6280275464362ba1eb4e11a9f8717',
//                     width: 30,
//                     height: 30,
//                     fit: BoxFit.contain,
//                   ),
//                   const SizedBox(width: 20),
//                   Text(
//                     'Checkout',
//                     style: GoogleFonts.imprima(
//                       fontSize: 18,
//                       color: const Color(0xFF0D0D0E),
//                     ),
//                   ),
//                 ],
//               ),
//               const PaymentMethodSection(),
//               const OrderSummarySection(),
//               const SizedBox(height: 71),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFFFF7A00),
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 61,
//                       vertical: 22,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(90),
//                     ),
//                   ),
//                   child: Text(
//                     'Pay Now',
//                     style: GoogleFonts.imprima(
//                       color: Colors.white,
//                       fontSize: 18,
//                       letterSpacing: 0.18,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 7),
//               Center(
//                 child: Image.network(
//                   'https://cdn.builder.io/api/v1/image/assets/TEMP/d94df3ae1aa4faea75c8f12c64e16f63f88e10899b073d331e61a1ef0b2ed953?placeholderIfAbsent=true&apiKey=f0b6280275464362ba1eb4e11a9f8717',
//                   width: 32,
//                   height: 4,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }