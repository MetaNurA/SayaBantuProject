import 'package:flutter/material.dart';

class ActiveOfferScreen extends StatelessWidget {
  const ActiveOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Penawaran Aktif",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}