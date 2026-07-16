import 'package:flutter/material.dart';

class FooterColumn extends StatelessWidget {
  final String title;
  final List<String> items;

  const FooterColumn({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).cardColor,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),

          const SizedBox(height: 22),

          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Text(
                item,
                style: TextStyle(
                  color: Colors.white.withOpacity(.7),
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}