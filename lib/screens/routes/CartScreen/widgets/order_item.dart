import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 34),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              'https://cdn.builder.io/api/v1/image/assets/TEMP/5f6efcb87baf738f0a7ed73babcce8a0e135033f3db13dc2de9aec6d02597932',
              width: 137,
              height: 141,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 27),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Premium Tagerine Shirt',
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.22,
                    color: Color(0xFF0D0D0E),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Yellow',
                  style: TextStyle(
                    color: Color(0xFF797780),
                  ),
                ),
                SizedBox(height: 9),
                Text(
                  'Size L',
                  style: TextStyle(
                    color: Color(0xFF797780),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'RP. 126.000',
                  style: TextStyle(
                    fontSize: 26,
                    letterSpacing: -0.78,
                    color: Color(0xFF0D0D0E),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}