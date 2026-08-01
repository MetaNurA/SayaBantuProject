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
    return LayoutBuilder(
      builder: (context, constraints) {

        final isSmall = constraints.maxWidth < 250;

        return Row(
          children: [

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Icon(
                    icon,
                    color: Colors.amber.shade300,
                    size: isSmall ? 30 : 38,
                  ),

                  SizedBox(
                    height: isSmall ? 12 : 20,
                  ),

                  Text(
                    value,
                    style: TextStyle(
                      fontSize: isSmall ? 30 : 38,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isSmall ? 15 : 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(.85),
                      fontSize: isSmall ? 13 : 15,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),

            if (showDivider && !isSmall)
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                width: 1,
                height: 150,
                color: Colors.white.withOpacity(.18),
              ),
          ],
        );
      },
    );
  }
}