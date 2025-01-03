import 'package:flutter/material.dart';

class TotalSummary extends StatelessWidget {
  const TotalSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Total Items (1)',
                style: TextStyle(
                  color: Color(0xFF797780),
                ),
              ),
              SizedBox(height: 13),
              Text(
                'Total Payment',
                style: TextStyle(
                  color: Color(0xFF797780),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                'RP.126.000',
                style: TextStyle(
                  color: Color(0xFF0D0D0E),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'RP.126.000',
                style: TextStyle(
                  color: Color(0xFF0D0D0E),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
