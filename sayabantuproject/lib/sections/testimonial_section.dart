import 'package:flutter/material.dart';
import 'testimonial_card.dart';

class TestimonialSection extends StatelessWidget {
  const TestimonialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xffF8FAFC),
      padding: const EdgeInsets.symmetric(
        horizontal: 90,
        vertical: 100,
      ),
      child: Column(
        children: [
          const Text(
            "ULASAN PELANGGAN",
            style: TextStyle(
              color: Color(0xffF97316),
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 18),

          const Text(
            "Mereka Sudah Merasakan",
            style: TextStyle(
              fontSize: 46,
              fontWeight: FontWeight.w900,
              color: Color(0xff08162F),
            ),
          ),

          const Text(
            "Bedanya SayaBantu",
            style: TextStyle(
              fontSize: 46,
              fontWeight: FontWeight.w900,
              color: Color(0xffF97316),
            ),
          ),

          const SizedBox(height: 70),

          IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Expanded(
                child: TestimonialCard(
                  category: "🔧 Service AC Bocor",
                  review:
                      "\"Baru posting 10 menit, sudah ada 4 mitra yang nawar! Saya tinggal pilih yang poinnya paling tinggi. Kerjanya rapi dan profesional. Harga juga bisa dinego, jadi cocok banget sama budget saya.\"",
                  name: "Anisa Rahmawati",
                  job: "Ibu Rumah Tangga, Cilandak",
                  avatar: "AR",
                ),
              ),

              SizedBox(width: 24),

              Expanded(
                child: TestimonialCard(
                  category: "🪜 Cat Ulang 8 Kamar Kos",
                  review:
                      "\"Sebagai pemilik kos saya sering butuh tukang mendadak. Sekarang tinggal posting di SayaBantu dan tunggu penawaran masuk. Sudah belasan pekerjaan selesai tanpa ribet.\"",
                  name: "Rendra Kusuma",
                  job: "Pemilik Kos, Mampang",
                  avatar: "RK",
                  avatarColor: Color(0xff64748B),
                ),
              ),

              SizedBox(width: 24),

              Expanded(
                child: TestimonialCard(
                  category: "💡 Instalasi Wallpaper & Lampu",
                  review:
                      "\"Yang saya suka adalah transparansinya. Semua penawaran langsung terlihat sehingga saya bebas membandingkan harga dan memilih yang paling sesuai. Tidak ada biaya booking.\"",
                  name: "Sari Dewi Putri",
                  job: "Desainer Interior, Jakarta Selatan",
                  avatar: "SD",
                ),
              ),
            ],
          ),
        ),

          const SizedBox(height: 55),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Row(
                children: List.generate(
                  5,
                  (index) => Container(
                    margin: const EdgeInsets.only(right: 4),
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: [
                        const Color(0xffF97316),
                        const Color(0xff0EA5E9),
                        const Color(0xff8B5CF6),
                        const Color(0xff10B981),
                        const Color(0xffF59E0B),
                      ][index],
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      ["AN", "BS", "RK", "EP", "SD"][index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 20),

              const Text(
                "8.200+ ulasan dari pelanggan nyata",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff334155),
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(width: 30),

              Container(
                width: 1,
                height: 28,
                color: const Color(0xffCBD5E1),
              ),

              const SizedBox(width: 30),

              const Icon(
                Icons.star,
                color: Color(0xffFBBF24),
              ),

              const SizedBox(width: 8),

              const Text(
                "4.9 / 5 rata-rata kepuasan",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff334155),
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(width: 30),

              Container(
                width: 1,
                height: 28,
                color: const Color(0xffCBD5E1),
              ),

              const SizedBox(width: 30),

              const Text(
                "98% masalah terselesaikan",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff334155),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}