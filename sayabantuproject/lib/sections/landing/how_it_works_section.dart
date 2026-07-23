import 'package:flutter/material.dart';
import 'step_card.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xffF8FAFC),
      padding: const EdgeInsets.symmetric(
        horizontal: 80,
        vertical: 90,
      ),
      child: Column(
        children: [
          const Text(
            "CARA KERJA",
            style: TextStyle(
              color: Color(0xffF97316),
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            "Sesederhana Itu.",
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w900,
              color: Color(0xff08162F),
            ),
          ),

          const Text(
            "Tiga Langkah Selesai.",
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w900,
              color: Color(0xffF97316),
            ),
          ),

          const SizedBox(height: 20),

          const SizedBox(
            width: 650,
            child: Text(
              "Tidak ada biaya tersembunyi. Tidak ada perantara. Kamu deal langsung dengan mitra pilihanmu.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff64748B),
                height: 1.8,
                fontSize: 18,
              ),
            ),
          ),

          const SizedBox(height: 70),

          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StepCard(
                number: "01",
                numberColor: Color(0xff1DA1F2),
                icon: Icons.edit_note,
                title: "Posting Masalahmu",
                description:
                    "Ceritakan masalah di rumahmu, upload foto kendala, dan set budget awal yang kamu bayangkan.",
                points: [
                  "Gratis tanpa biaya posting",
                  "Upload foto untuk deskripsi lebih jelas",
                  "Set budget fleksibel",
                ],
              ),

              SizedBox(width: 30),

              StepCard(
                number: "02",
                numberColor: Color(0xffF97316),
                icon: Icons.handshake,
                title: "Nego Langsung dengan Mitra",
                description:
                    "Mitra-mitra terverifikasi akan langsung mengajukan penawaran harga. Kamu bisa memilih sesuai poin & harga terbaik.",
                points: [
                  "Mitra diurutkan dari poin tertinggi",
                  "Bandingkan harga secara transparan",
                  "Chat langsung dengan mitra",
                ],
              ),

              SizedBox(width: 30),

              StepCard(
                number: "03",
                numberColor: Color(0xff10B981),
                icon: Icons.task_alt,
                title: "Terima & Konfirmasi Selesai",
                description:
                    "Terima tawaran terbaik, pantau progres pekerjaan, dan konfirmasi selesai untuk kirim poin reward ke mitra.",
                points: [
                  "Bayar hanya setelah puas",
                  "Poin reward otomatis terkirim",
                  "Beri rating & ulasan",
                ],
              ),
            ],
          ),

          const SizedBox(height: 50),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
              vertical: 20,
            ),
            decoration: BoxDecoration(
              color: const Color(0xff0F172A),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 12,
              children: [
                _Badge("Kamu Posting", Color(0xff1DA1F2)),
                Icon(Icons.arrow_forward, color: Colors.white38, size: 18),
                _Badge("Mitra Nawar", Color(0xffF97316)),
                Icon(Icons.arrow_forward, color: Colors.white38, size: 18),
                _Badge("Kamu Pilih", Color(0xffEAB308)),
                Icon(Icons.arrow_forward, color: Colors.white38, size: 18),
                _Badge("Kerja Jalan", Color(0xff8B5CF6)),
                Icon(Icons.arrow_forward, color: Colors.white38, size: 18),
                _Badge("Deal Selesai 🎉", Color(0xff10B981)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;
  final Color color;

  const _Badge(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(.15),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}