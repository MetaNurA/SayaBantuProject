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
    return LayoutBuilder(
      builder: (context, constraints) {

        final width = constraints.maxWidth;
        final isMobile = width < 768;
        final isTablet = width >= 768 && width < 1200;
        final isDesktop = width >= 1200;

        return Stack(
          children: [

            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff111827),
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/Logo_SayaBantu",
                  ),
                  fit: BoxFit.cover,
                  opacity: .15,
                ),
              ),

              padding: EdgeInsets.symmetric(
                horizontal: isMobile
                    ? 20
                    : isTablet
                        ? 40
                        : 90,
                vertical: isMobile
                    ? 50
                    : isTablet
                        ? 70
                        : 90,
              ),
              child: Flex(
                direction: (isMobile || isTablet)
                    ? Axis.vertical
                    : Axis.horizontal,
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  /// LEFT
                  Expanded(
                  flex: (isMobile || isTablet) ? 0 : 5,
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        Container(
                          padding:
                              const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 10,
                          ),

                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(30),
                            border: Border.all(
                              color:
                                  const Color(0xffF97316),
                            ),
                          ),

                          child: const Text(
                            "🔧 Untuk Para Mitra & Teknisi",
                            style: TextStyle(
                              color:
                                  Color(0xffF97316),
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(height: 32),


                        Text(
                          "Jadikan Keahlianmu",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: isMobile
                                ? 36
                                : isTablet
                                    ? 46
                                    : 60,
                          ),
                        ),

                        Text(
                          "Penghasilan Rutin",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: isMobile
                                ? 36
                                : isTablet
                                    ? 46
                                    : 60,
                          ),
                        ),

                        const SizedBox(height: 30),


                        Text(
                          "Daftar sebagai mitra dan dapatkan pekerjaan dari ribuan pelanggan di sekitarmu. Semakin banyak pekerjaan yang selesai, semakin tinggi reputasi dan peluang dipilih pelanggan.",

                          style: TextStyle(
                            color:
                                Colors.white.withOpacity(.75),
                            height: 1.8,
                            fontSize:
                                isMobile ? 15 : 18,
                          ),
                        ),


                        const SizedBox(height: 40),


                        Wrap(
                          spacing: 15,
                          runSpacing: 15,

                          children: [

                            CustomButton(
                              text:
                                  "Daftar Jadi Mitra →",
                              width:
                                  isMobile ? 200 : 220,
                              height: 60,
                              backgroundColor:
                                  const Color(0xffF97316),

                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        const RegisterScreen(
                                      defaultRole:
                                          "Mitra",
                                    ),
                                  ),
                                );
                              },
                            ),


                            CustomButton(
                              text:
                                  "Pelajari Lebih Lanjut",
                              width:
                                  isMobile ? 200 : 220,
                              height: 60,
                              outlined: true,
                              textColor:
                                  Colors.white,
                              onPressed:
                                  onPelajari,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),


                  SizedBox(
                    width: isMobile ? 0 : 70,
                    height: isMobile ? 40 : 0,
                  ),


                  /// RIGHT BENEFIT
                  Expanded(
                  flex: (isMobile || isTablet) ? 0 : 4,

                    child: Column(
                      children: [

                        _benefitGrid(
                          isMobile,
                          width,
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
        Widget _benefitGrid(
          bool isMobile,
          double width,
          ) {
        return GridView.count(
          shrinkWrap: true,
          physics:
              const NeverScrollableScrollPhysics(),

          crossAxisCount: isMobile ? 1 : 2,

          crossAxisSpacing: 20,
          mainAxisSpacing: 20,

          childAspectRatio: isMobile ? 2.0 : 1.15,

          children: const [

            BenefitCard(
              icon: Icons.payments,
              iconColor:
                  Color(0xffF59E0B),
              title:
                  "Penghasilan Fleksibel",
              description:
                  "Tentukan sendiri harga jasa sesuai kemampuanmu.",
            ),

            BenefitCard(
              icon:
                  Icons.emoji_events,
              iconColor:
                  Color(0xffFBBF24),
              title:
                  "Sistem Poin Adil",
              description:
                  "Semakin bagus pelayanan, semakin tinggi peringkatmu.",
            ),

            BenefitCard(
              icon:
                  Icons.notifications_active,
              iconColor:
                  Color(0xff8B5CF6),
              title:
                  "Notifikasi Real-time",
              description:
                  "Pekerjaan baru langsung masuk ke perangkatmu.",
            ),

            BenefitCard(
              icon:
                  Icons.verified_user,
              iconColor:
                  Color(0xff3B82F6),
              title:
                  "Perlindungan Mitra",
              description:
                  "Pembayaran aman setelah pekerjaan selesai.",
            ),
          ],
        );
      }
}