// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class BoardingScreen extends StatefulWidget {
//   const BoardingScreen({super.key});

//   @override
//   State<BoardingScreen> createState() => _BoardingScreenState();
// }

// class _BoardingScreenState extends State<BoardingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Text("Boarding Screen update"));
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StyleShoppingWidget(),
      ),
    );
  }
}

class StyleShoppingWidget extends StatelessWidget {
  const StyleShoppingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        image: DecorationImage(
          image: AssetImage('assets/boarding.jpg'), // Menggunakan gambar dari asset
          fit: BoxFit.cover, // Mengatur cara gambar ditampilkan
        ),
      ),
      constraints: const BoxConstraints(
        maxWidth: 480,
      ),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 532),
          Text(
            'Create your own\nstyle now',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w600,
              height: 1.25,
              letterSpacing: 0.64,
              fontFamily: 'Lexend Deca',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: 281,
            child: Text(
              'Lorem ipsum dolor sit amet consectetur augue nibh molestie varius mi adipiscing. Velit',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.57,
                fontFamily: 'Lexend Deca',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 28),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: MaterialButton(
              onPressed: () {
                // Tambahkan logika untuk tombol di sini
              },
              height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Start Shopping',
                    style: TextStyle(
                      color: Color(0xFF2B2B2B),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.32,
                      fontFamily: 'Lexend Deca',
                    ),
                  ),
                  const SizedBox(width: 6),
                  Image.network(
                    'https://cdn.builder.io/api/v1/image/assets/TEMP/b4e09b62d2b2be6be3f55142b996f5d9febedaa84f7281a7a5eb2d2780ab7117?placeholderIfAbsent=true&apiKey=f0b6280275464362ba1eb4e11a9f8717',
                    width: 24,
                    height: 24,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 34),
        ],
      ),
    );
  }
}