import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'stat_counter.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final isMobile = width < 600;
        final isTablet = width >= 600 && width < 1100;

        final columnCount = isMobile
            ? 1
            : isTablet
                ? 2
                : 4;

        return Container(
          width: double.infinity,
          color: const Color(0xffF97316),
          child: Stack(
            children: [
              /// Background Circle Kiri
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

              /// Background Circle Kanan
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
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile
                      ? 20
                      : isTablet
                          ? 50
                          : 100,
                  vertical: isMobile ? 50 : 90,
                ),
                child: Column(
                  children: [
                    /// Judul
                    Text(
                      "Dipercaya Ribuan Pelanggan & Mitra",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isMobile ? 28 : 42,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 600.ms)
                        .slideY(begin: .3),

                    const SizedBox(height: 14),

                    /// Subtitle
                    Text(
                      "Angka nyata dari platform kami yang terus berkembang",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(.9),
                        fontSize: isMobile ? 14 : 18,
                      ),
                    )
                        .animate(delay: 200.ms)
                        .fadeIn(duration: 600.ms)
                        .slideY(begin: .2),

                    SizedBox(
                      height: isMobile ? 40 : 70,
                    ),

                    /// Statistik
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: columnCount,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30,
                      childAspectRatio: isMobile ? 2.3 : 1.25,
                      children: [
                        const StatCounter(
                          icon: Icons.task_alt,
                          value: "12.480+",
                          title: "Pekerjaan Selesai",
                          subtitle: "sejak Januari 2024",
                        )
                            .animate(delay: 400.ms)
                            .fadeIn(duration: 500.ms)
                            .slideY(begin: .25),

                        const StatCounter(
                          icon: Icons.handyman,
                          value: "1.240+",
                          title: "Mitra Terverifikasi",
                          subtitle: "di 12 kota besar",
                        )
                            .animate(delay: 550.ms)
                            .fadeIn(duration: 500.ms)
                            .slideY(begin: .25),

                        const StatCounter(
                          icon: Icons.star,
                          value: "4.9 / 5",
                          title: "Rating Rata-rata",
                          subtitle: "dari 8.200+ ulasan",
                        )
                            .animate(delay: 700.ms)
                            .fadeIn(duration: 500.ms)
                            .slideY(begin: .25),

                        const StatCounter(
                          icon: Icons.card_giftcard,
                          value: "Rp 0",
                          title: "Biaya Pasang Iklan",
                          subtitle: "posting gratis selamanya",
                          showDivider: false,
                        )
                            .animate(delay: 850.ms)
                            .fadeIn(duration: 500.ms)
                            .slideY(begin: .25),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}