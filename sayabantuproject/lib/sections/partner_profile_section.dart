import 'package:flutter/material.dart';

class PartnerProfileSection extends StatelessWidget {
  const PartnerProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Profil Mitra",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}