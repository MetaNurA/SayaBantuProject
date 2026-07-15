import 'package:flutter/material.dart';

import 'stat_counter.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xffF97316),
      child: Stack(
        children: [
          /// Dekorasi kiri bawah
          Positioned(
            left: -60,
            bottom: -60,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.08),
                shape: BoxShape.circle,
              ),
            ),
          ),

          /// Dekorasi kanan atas
          Positioned(
            right: -90,
            top: -90,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.06),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 100,
              vertical: 90,
            ),
            child: Column(
              children: [
                const Text(
                  "Dipercaya Ribuan Pelanggan & Mitra",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                const SizedBox(height: 14),

                Text(
                  "Angka nyata dari platform kami yang terus berkembang",
                  style: TextStyle(
                    color: Colors.white.withOpacity(.9),
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 70),

                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StatCounter(
                      icon: Icons.task_alt,
                      value: "12.480+",
                      title: "Pekerjaan Selesai",
                      subtitle: "sejak Januari 2024",
                    ),

                    StatCounter(
                      icon: Icons.handyman,
                      value: "1.240+",
                      title: "Mitra Terverifikasi",
                      subtitle: "di 12 kota besar",
                    ),

                    StatCounter(
                      icon: Icons.star,
                      value: "4.9 / 5",
                      title: "Rating Rata-rata",
                      subtitle: "dari 8.200+ ulasan",
                    ),

                    StatCounter(
                      showDivider: false,
                      icon: Icons.card_giftcard,
                      value: "Rp 0",
                      title: "Biaya Pasang Iklan",
                      subtitle: "posting gratis selamanya",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}