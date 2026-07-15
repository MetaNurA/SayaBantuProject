import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class HeroRight extends StatelessWidget {
  const HeroRight({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 460,
      height: 420,
      child: Stack(
        clipBehavior: Clip.none,
        children: [

          /// CARD
          Positioned(
            bottom: 0,
            child: Container(
              width: 440,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xff202C3F),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withOpacity(.08),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "PENAWARAN MASUK — SERVICE AC",
                    style: TextStyle(
                      color: Colors.white.withOpacity(.45),
                      fontSize: 12,
                      letterSpacing: 1,
                    ),
                  ),

                  const SizedBox(height: 18),

                  _offerItem(
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
                    initials: "EP",
                    name: "Mas Eko P.",
                    rating: "4.7",
                    point: "182 poin",
                    price: "Rp 155.000",
                  ),

                  const SizedBox(height: 12),

                  _offerItem(
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
                      height: 48,
                      backgroundColor: const Color(0xff17C67A),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// VERIFIED BADGE
          Positioned(
            right: 0,
            top: 15,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: const Color(0xff18C57A),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(.4),
                    blurRadius: 20,
                  )
                ],
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.verified,
                    color: Colors.white,
                    size: 18,
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
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        "Admin reviewed",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 11,
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
            bottom: -18,
            left: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: const Color(0xff293549),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Colors.white12,
                ),
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 4,
                    backgroundColor: Color(0xff17C67A),
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
  }

  Widget _offerItem({
    required String initials,
    required String name,
    required String rating,
    required String point,
    required String price,
    String? badge,
    bool active = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
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
            radius: 20,
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

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [

                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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