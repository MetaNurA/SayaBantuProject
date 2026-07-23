import 'package:flutter/material.dart';

import 'hero_left.dart';
import 'hero_right.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onCariJasa;
  final VoidCallback onJadiMitra;
  final Function(String) onSearch;

  const HeroSection({
    super.key,
    required this.onCariJasa,
    required this.onJadiMitra,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: screenHeight,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/herosection.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.58),
        ),
        child: Center(
          child: SizedBox(
            width: 1180,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 25,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 6,
                    child: HeroLeft(
                      onCariJasa: onCariJasa,
                      onJadiMitra: onJadiMitra,
                      onSearch: onSearch,
                    ),
                  ),

                  const SizedBox(width: 30),

                  const Expanded(
                    flex: 4,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: HeroRight(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}