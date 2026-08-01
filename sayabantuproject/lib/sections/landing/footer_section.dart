import 'package:flutter/material.dart';

import 'footer_column.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {

        final isMobile = constraints.maxWidth < 700;

        return Container(
          width: double.infinity,
          color: const Color(0xff0F172A),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 90,
            vertical: 70,
          ),

          child: Column(
            children: [

              Flex(
                direction: isMobile
                    ? Axis.vertical
                    : Axis.horizontal,

                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Expanded(
                    flex: isMobile ? 0 : 2,
                    child: _footerBrand(context),
                  ),

                  SizedBox(
                    width: isMobile ? 0 : 60,
                    height: isMobile ? 40 : 0,
                  ),

                  const FooterColumn(
                    title: "Layanan",
                    items: [
                      "Service AC",
                      "Plumbing",
                      "Listrik",
                      "Cleaning Service",
                      "Renovasi Rumah",
                    ],
                  ),

                  const FooterColumn(
                    title: "Perusahaan",
                    items: [
                      "Tentang Kami",
                      "Karier",
                      "Blog",
                      "Kontak",
                    ],
                  ),

                  const FooterColumn(
                    title: "Dukungan",
                    items: [
                      "FAQ",
                      "Pusat Bantuan",
                      "Kebijakan Privasi",
                      "Syarat & Ketentuan",
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 50),

              Divider(
                color: Colors.white.withOpacity(.08),
              ),

              const SizedBox(height: 20),

              Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 10,
                children: [
                  Text(
                    "© 2026 SayaBantu. All Rights Reserved.",
                    style: TextStyle(
                      color: Colors.white.withOpacity(.55),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
      Widget _footerBrand(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: const Color(0xffF97316),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.home_repair_service,
                  color: Colors.white,
                ),
              ),

              const SizedBox(width: 12),

              const Text(
                "SayaBantu",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          Text(
            "Platform marketplace jasa rumah tangga yang mempertemukan pelanggan dengan mitra terpercaya secara cepat, transparan, dan aman.",
            style: TextStyle(
              color: Colors.white.withOpacity(.7),
              fontSize: 15,
              height: 1.8,
            ),
          ),

          const SizedBox(height: 28),

          Row(
            children: [
              _social(Icons.facebook),
              _social(Icons.camera_alt),
              _social(Icons.chat),
              _social(Icons.play_arrow),
            ],
          ),
        ],
      );
    }
    Widget _social(IconData icon) {
      return Container(
        margin: const EdgeInsets.only(right: 12),
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.08),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      );
    }
}