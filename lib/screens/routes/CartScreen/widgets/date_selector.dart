import 'package:flutter/material.dart';

class DateSelector extends StatelessWidget {
  const DateSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 34),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Start Date & End Date',
                style: TextStyle(
                  color: Color(0xFF797780),
                ),
              ),
              SizedBox(height: 13),
              Text(
                'Total Items',
                style: TextStyle(
                  color: Color(0xFF797780),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Image.network(
                'https://cdn.builder.io/api/v1/image/assets/TEMP/2de24958c99f0c828d0b91bcb3bc7213c59c6e75dab6ef5e0121b82eb41c5c2a',
                width: 24,
                height: 24,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Image.network(
                    'https://cdn.builder.io/api/v1/image/assets/TEMP/597eaf4fc3e08498494202fc92e422da116aea73a21ce8721e070fc78ec00b6e',
                    width: 24,
                    height: 24,
                  ),
                  const Text(
                    '(1)',
                    style: TextStyle(
                      color: Color(0xFF797780),
                    ),
                  ),
                  Image.network(
                    'https://cdn.builder.io/api/v1/image/assets/TEMP/c1d66185276f026e5104153536ce73d2813f3c33081eeacd273b572080346f66',
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}