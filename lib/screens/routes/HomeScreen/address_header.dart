import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressHeader extends StatelessWidget {
  const AddressHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.network(
              'https://cdn.builder.io/api/v1/image/assets/TEMP/493e32dab4cfd7e7b75886f3e8dd787384596b813621185461a8fd1b0bd48499?placeholderIfAbsent=true&apiKey=f0b6280275464362ba1eb4e11a9f8717',
              width: 32,
              height: 32,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address',
                  style: GoogleFonts.lexendDeca(
                    fontSize: 11,
                    color: const Color(0xFF747474),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Uttara, Dhaka',
                  style: GoogleFonts.lexendDeca(
                    fontSize: 14,
                    color: const Color(0xFF2B2B2B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Image.network(
              'https://cdn.builder.io/api/v1/image/assets/TEMP/7b48b63769cd1a7a7ce741852c9a27e98e961e59d898c777e78aa90ba502f0c6?placeholderIfAbsent=true&apiKey=f0b6280275464362ba1eb4e11a9f8717',
              width: 24,
              height: 24,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 9),
            Image.network(
              'https://cdn.builder.io/api/v1/image/assets/TEMP/3d4a868198613dda269564d2ab418fc0bdc8b049511fac6b3bb94c268aaf54c0?placeholderIfAbsent=true&apiKey=f0b6280275464362ba1eb4e11a9f8717',
              width: 32,
              height: 32,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ],
    );
  }
}