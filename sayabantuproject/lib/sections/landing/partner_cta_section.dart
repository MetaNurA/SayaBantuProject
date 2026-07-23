import 'package:flutter/material.dart';
import 'package:sayabantu_project/screens/Screens_auth/register_page.dart';

import 'benefit_card.dart';
import '../../widgets/custom_button.dart';


class PartnerCTASection extends StatelessWidget {
  final VoidCallback onDaftarMitra;
  final VoidCallback onPelajari;

  const PartnerCTASection({
    super.key,
    required this.onDaftarMitra,
    required this.onPelajari,
    });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xff111827),
            image: DecorationImage(
              image: AssetImage(
                "assets/images/tools_bg.jpg",
              ),
              fit: BoxFit.cover,
              opacity: .15,
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 90,
            vertical: 90,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// LEFT
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: const Color(0xffF97316),
                        ),
                      ),
                      child: const Text(
                        "🔧 Untuk Para Mitra & Teknisi",
                        style: TextStyle(
                          color: Color(0xffF97316),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    const Text(
                      "Jadikan Keahlianmu",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 60,
                      ),
                    ),

                    const Text(
                      "Penghasilan Rutin",
                      style: TextStyle(
                        color: Color(0xffF97316),
                        fontWeight: FontWeight.w900,
                        fontSize: 60,
                      ),
                    ),

                    const SizedBox(height: 30),

                    Text(
                      "Daftar sebagai mitra dan dapatkan pekerjaan dari ribuan pelanggan di sekitarmu. Semakin banyak pekerjaan yang selesai, semakin tinggi reputasi dan peluang dipilih pelanggan.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(.75),
                        height: 1.8,
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 45),

                    Row(
                      children: [
                        CustomButton(
                        text: "Daftar Jadi Mitra →",
                        width: 220,
                        height: 60,
                        backgroundColor: const Color(0xffF97316),
                        onPressed: () {
                          Navigator.push(
                            context,
                             MaterialPageRoute(
                              builder: (_) => const RegisterScreen(
                                defaultRole: "Mitra",
                              ),
                              ),
                             );
                        },
                      ),
                        const SizedBox(width: 18),

                        CustomButton(
                          text: "Pelajari Lebih Lanjut",
                          width: 220,
                          height: 60,
                          outlined: true,
                          textColor: Colors.white,
                          onPressed: onPelajari,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 70),

              /// RIGHT
              const Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: BenefitCard(
                            icon: Icons.payments,
                            iconColor: Color(0xffF59E0B),
                            title: "Penghasilan Fleksibel",
                            description:
                                "Tentukan sendiri harga jasa sesuai kemampuanmu.",
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: BenefitCard(
                            icon: Icons.emoji_events,
                            iconColor: Color(0xffFBBF24),
                            title: "Sistem Poin Adil",
                            description:
                                "Semakin bagus pelayanan, semakin tinggi peringkatmu.",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: BenefitCard(
                            icon: Icons.notifications_active,
                            iconColor: Color(0xff8B5CF6),
                            title: "Notifikasi Real-time",
                            description:
                                "Pekerjaan baru langsung masuk ke perangkatmu.",
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: BenefitCard(
                            icon: Icons.verified_user,
                            iconColor: Color(0xff3B82F6),
                            title: "Perlindungan Mitra",
                            description:
                                "Pembayaran aman setelah pekerjaan selesai.",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}