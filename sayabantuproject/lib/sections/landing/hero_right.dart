import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';

class HeroRight extends StatelessWidget {
  const HeroRight({super.key});
@override
Widget build(BuildContext context) {
  return LayoutBuilder(
    builder: (context, constraints) {

      final width = constraints.maxWidth;

      final isMobile = width < 768;
      final isTablet = width >= 768 && width < 1100;
      final isLaptop = width >= 1100 && width < 1440;
      final isDesktop = width >= 1440;

      final double cardWidth = isMobile
        ? width
        : width.clamp(320.0, 520.0);


      return SizedBox(
        width: double.infinity,
       height: isMobile
          ? 390
          : isTablet
              ? 430
              : isLaptop
                  ? 470
                  : 500,
        child: Stack(
          clipBehavior: Clip.none,
          children: [

            /// CARD
            Positioned(
              bottom: isDesktop ? 20 : 0,
              child: Container(
                width: cardWidth,
                padding: EdgeInsets.all(
                  isMobile
                      ? 14
                      : isLaptop
                          ? 18
                          : 22,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xff202C3F),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Theme.of(context)
                        .cardColor
                        .withOpacity(.08),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.35),
                      blurRadius: 35,
                      offset: const Offset(0, 20),
                    )
                  ],
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Text(
                      "PENAWARAN MASUK — SERVICE AC",
                      style: TextStyle(
                        color: Colors.white.withOpacity(.45),
                        fontSize: isMobile ? 10 : 12,
                        letterSpacing: 1,
                      ),
                    ),

                    SizedBox(
                      height: isMobile ? 12 : 18,
                    ),


                    _offerItem(
                       isMobile: isMobile,
                      active: true,
                      initials: "BS",
                      name: "Pak Budi S.",
                      rating: "4.9",
                      point: "248 poin",
                      price: "Rp 170.000",
                      badge: "ANTREAN #1",
                    ),


                    const SizedBox(height: 12),


                    _offerItem(
                       isMobile: isMobile,
                      initials: "EP",
                      name: "Mas Eko P.",
                      rating: "4.7",
                      point: "182 poin",
                      price: "Rp 155.000",
                    ),


                    const SizedBox(height: 12),


                    _offerItem(
                       isMobile: isMobile,
                      initials: "JW",
                      name: "Pak Joko W.",
                      rating: "4.5",
                      point: "97 poin",
                      price: "Rp 140.000",
                    ),


                    const SizedBox(height: 16),


                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        text: "✓ Terima Mitra Terbaik",
                        width: double.infinity,
                        height: isMobile
                              ? 42
                              : isTablet
                                  ? 46
                                  : 50,
                        backgroundColor:
                            const Color(0xff17C67A),
                        onPressed: () {},
                      ),
                    ),

                  ],
                ),
              ),
            ),


            /// VERIFIED BADGE
            Positioned(
              right: isMobile ? 5 : 0,
              top: isMobile
                  ? 5
                  : isLaptop
                      ? 10
                      : 18,

              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 10 : 16,
                  vertical: isMobile ? 8 : 12,
                ),

                decoration: BoxDecoration(
                  color: const Color(0xff18C57A),
                  borderRadius:
                      BorderRadius.circular(14),
                ),

                child: Row(
                  children: [

                    Icon(
                      Icons.verified,
                      color: Color(0xFF1E293B),
                      size: isMobile ? 16 : 20,
                    ),

                    SizedBox(width: 8),


                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        Text(
                          "Terverifikasi",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? 11 : 13,
                          ),
                        ),


                        Text(
                          "Admin reviewed",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: isMobile ? 10 : 11,
                          ),
                        ),

                      ],
                    )

                  ],
                ),
              ),
            ),


            /// ONLINE BADGE
            Positioned(
              bottom: isDesktop ? -8 : -16,
              left: isMobile ? 10 : 20,

              child: Container(
                padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 10 : 16,
                vertical: isMobile ? 6 : 9,
            ),

                decoration: BoxDecoration(
                  color: const Color(0xff293549),
                  borderRadius:
                      BorderRadius.circular(25),
                ),

                child: const Row(
                  children: [

                    CircleAvatar(
                      radius: 4,
                      backgroundColor:
                          Color(0xff17C67A),
                    ),

                    SizedBox(width: 8),


                    Text(
                      "47 mitra online sekarang",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    )

                  ],
                ),
              ),
            )

          ],
        ),
      );
    },
  );
}

  Widget _offerItem({
  required bool isMobile,
  required String initials,
  required String name,
  required String rating,
  required String point,
  required String price,
  String? badge,
  bool active = false,
    }) {
    return Container(
      padding: EdgeInsets.all(
          isMobile ? 10 : 14,
      ),
      decoration: BoxDecoration(
        color: active
            ? const Color(0xff2B3445)
            : const Color(0xff303B4E),
        borderRadius: BorderRadius.circular(14),
        border: active
            ? Border.all(
                color: const Color(0xffF97316),
              )
            : null,
      ),
      child: Row(
        children: [

          CircleAvatar(
            radius: isMobile ? 16 : 20,
            backgroundColor: active
                ? const Color(0xffF97316)
                : const Color(0xff3E4A5F),
            child: Text(
              initials,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(
              width:isMobile ? 10 : 14,
          ),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [

                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isMobile ? 13 : 15,
                  ),
                ),

                const SizedBox(height: 4),

                Row(
                  children: [

                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 14,
                    ),

                    const SizedBox(width: 3),

                    Text(
                      rating,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),

                    const SizedBox(width: 6),

                    Text(
                      "• $point",
                      style: const TextStyle(
                        color: Colors.white38,
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          Column(
            crossAxisAlignment:
                CrossAxisAlignment.end,
            children: [

              Text(
                price,
                style: TextStyle(
                  color: active
                      ? const Color(0xffFF9A3E)
                      : Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),

              if (badge != null)
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffF97316),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    badge,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}