import 'package:flutter/material.dart';

import 'feature_item.dart';

class WhySection extends StatelessWidget {
  const WhySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 90,
        vertical: 100,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          /// LEFT
          Expanded(
            flex: 5,
            child: Column(
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

                const Text(
                  "Bukan Sekadar",
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: Color(0xff08162F),
                  ),
                ),

                const Text(
                  "Direktori Tukang",
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: Color(0xffF97316),
                  ),
                ),

                const SizedBox(height: 25),

                const SizedBox(
                  width: 600,
                  child: Text(
                    "SayaBantu dirancang dengan mekanisme kompetitif yang memastikan kamu selalu mendapatkan mitra terpercaya dengan harga terbaik tanpa patokan harga sepihak.",
                    style: TextStyle(
                      color: Color(0xff64748B),
                      fontSize: 17,
                      height: 1.8,
                    ),
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
                      "Lihat semua penawaran, bandingkan harga dan pilih yang paling sesuai dengan kebutuhanmu.",
                ),

                const FeatureItem(
                  icon: Icons.verified_user,
                  bgColor: Color(0xffF5F3FF),
                  iconColor: Color(0xff8B5CF6),
                  title: "Semua Mitra Diverifikasi Admin",
                  description:
                      "Seluruh mitra melewati proses verifikasi identitas sebelum dapat menerima pekerjaan.",
                ),

                const FeatureItem(
                  icon: Icons.flash_on,
                  bgColor: Color(0xffFFF1E8),
                  iconColor: Color(0xffF97316),
                  title: "Real-time, Seperti Ojek Online",
                  description:
                      "Penawaran masuk dalam hitungan menit dan selalu diperbarui secara langsung.",
                ),
              ],
            ),
          ),

          const SizedBox(width: 70),

          /// RIGHT
          Expanded(
            flex: 5,
            child: Stack(
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
                      )
                    ],
                  ),
                ),

                Positioned(
                  right: -20,
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
                        )
                      ],
                    ),
                    child: Row(
                      children: [

                        const CircleAvatar(
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

                        const SizedBox(width: 16),

                        const Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
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

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xffDCFCE7),
                            borderRadius:
                                BorderRadius.circular(12),
                          ),
                          child: const Text(
                            "✓ Terverifikasi",
                            style: TextStyle(
                              color: Color(0xff16A34A),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}