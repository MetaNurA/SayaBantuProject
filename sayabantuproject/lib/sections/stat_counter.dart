import 'package:flutter/material.dart';

class StatCounter extends StatelessWidget {
  final IconData icon;
  final String value;
  final String title;
  final String subtitle;
  final bool showDivider;

  const StatCounter({
    super.key,
    required this.icon,
    required this.value,
    required this.title,
    required this.subtitle,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: Colors.amber.shade300,
                  size: 38,
                ),

                const SizedBox(height: 20),

                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 6),

                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(.85),
                    fontSize: 15,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),

          if (showDivider)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              width: 1,
              height: 180,
              color: Colors.white.withOpacity(.18),
            ),
        ],
      ),
    );
  }
}