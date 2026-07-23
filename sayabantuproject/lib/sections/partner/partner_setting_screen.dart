import 'package:flutter/material.dart';

class PartnerSettingScreen extends StatelessWidget {
  const PartnerSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Pengaturan Mitra",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}