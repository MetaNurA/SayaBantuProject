import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String icon;
  final String title;
  final String total;
  final Color bgColor;
  final Color borderColor;

  const CategoryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.total,
    required this.bgColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            icon,
            style: const TextStyle(fontSize: 34),
          ),

          const Spacer(),

          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xff08162F),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            total,
            style: const TextStyle(
              color: Color(0xffF97316),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}