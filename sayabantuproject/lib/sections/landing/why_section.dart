import 'package:flutter/material.dart';

import 'feature_item.dart';

class WhySection extends StatelessWidget {
  const WhySection({super.key});

  @override
  @override
Widget build(BuildContext context) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final width = constraints.maxWidth;
      final isMobile = width < 800;

      return Container(
        color: Colors.white,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 90,
          vertical: isMobile ? 50 : 100,
        ),
        child: isMobile
            ? Column(
                children: [
                  _content(),
                  const SizedBox(height: 50),
                  _imageSection(),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: _content(),
                  ),
                  const SizedBox(width: 70),
                  Expanded(
                    child: _imageSection(),
                  ),
                ],
              ),
      );
    },
  );
}
    Widget _content() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "KENAPA SAYABANTU?",
            style: TextStyle(
              color: Color(0xffF97316),
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 16),

          Text(
            "Bukan Sekadar",
            style: TextStyle(
              fontSize: 48,
              color: Color(0xff08162F),
              fontWeight: FontWeight.w900,
            ),
          ),

          Text(
            "Direktori Tukang",
            style: TextStyle(
              fontSize: 48,
              color: Color(0xffF97316),
              fontWeight: FontWeight.w900,
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            "SayaBantu dirancang dengan mekanisme kompetitif yang memastikan kamu selalu mendapatkan mitra terpercaya dengan harga terbaik tanpa patokan harga sepihak.",
            style: TextStyle(
              color: Color(0xff64748B),
              fontSize: 17,
              height: 1.8,
            ),
          ),

          const SizedBox(height: 40),

          const FeatureItem(
            icon: Icons.workspace_premium,
            bgColor: Color(0xffFFF5E6),
            iconColor: Color(0xffF59E0B),
            title: "Sistem Poin & Reputasi",
            description:
                "Mitra dengan poin tertinggi tampil lebih dulu sehingga kamu lebih mudah menemukan penyedia jasa terbaik.",
          ),

          const FeatureItem(
            icon: Icons.chat_bubble_outline,
            bgColor: Color(0xffEEF7FF),
            iconColor: Color(0xff3B82F6),
            title: "Negosiasi Harga Transparan",
            description:
                "Lihat semua penawaran, bandingkan harga dan pilih yang sesuai.",
          ),

          const FeatureItem(
            icon: Icons.verified_user,
            bgColor: Color(0xffF5F3FF),
            iconColor: Color(0xff8B5CF6),
            title: "Semua Mitra Diverifikasi Admin",
            description:
                "Seluruh mitra melewati proses verifikasi identitas.",
          ),

          const FeatureItem(
            icon: Icons.flash_on,
            bgColor: Color(0xffFFF1E8),
            iconColor: Color(0xffF97316),
            title: "Real-time, Seperti Ojek Online",
            description:
                "Penawaran masuk dalam hitungan menit.",
          ),
        ],
      );
    }
    Widget _imageSection() {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        height: 520,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          image: const DecorationImage(
            image: AssetImage(
              'assets/images/worker.jpg',
            ),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: const Offset(0, 20),
            ),
          ],
        ),
      ),

      Positioned(
        right: 10,
        top: 30,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            color: const Color(0xff111827),
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "PENAWARAN DITERIMA",
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 11,
                ),
              ),
              SizedBox(height: 6),
              Text(
                "Rp 170.000 ✓",
                style: TextStyle(
                  color: Color(0xff10B981),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),

      Positioned(
        left: 25,
        right: 25,
        bottom: 25,
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.12),
                blurRadius: 20,
              ),
            ],
          ),
          child: const Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Color(0xffF97316),
                child: Text(
                  "BS",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pak Budi Santoso",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "AC & Elektronik • 248 Poin • ⭐ 4.9",
                      style: TextStyle(
                        color: Color(0xff64748B),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
}