import 'package:flutter/material.dart';
import 'category_card.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      padding: const EdgeInsets.symmetric(
        horizontal: 120,
        vertical: 80,
      ),
      child: Column(
        children: [

                    Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "KATEGORI JASA",
                      style: TextStyle(
                        color: Color(0xffF97316),
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Semua Kebutuhan\nRumahmu Ada Di Sini",
                      style: TextStyle(
                        fontSize: 46,
                        height: 1.15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff08162F),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 50),

          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1.7,
            children: const [
              CategoryCard(
                icon: "❄️",
                title: "AC & Elektronik",
                total: "284 mitra aktif",
                bgColor: Color(0xffEDF8FF),
                borderColor: Color(0xffD7ECFF),
              ),
              CategoryCard(
                icon: "🔌",
                title: "Plumbing",
                total: "198 mitra aktif",
                bgColor: Color(0xffF6F0FF),
                borderColor: Color(0xffE6D9FF),
              ),
              CategoryCard(
                icon: "💡",
                title: "Listrik",
                total: "321 mitra aktif",
                bgColor: Color(0xffFFF8E7),
                borderColor: Color(0xffFFE5A6),
              ),
              CategoryCard(
                icon: "🪣",
                title: "Cat & Tembok",
                total: "156 mitra aktif",
                bgColor: Color(0xffFFF5EC),
                borderColor: Color(0xffFFDDBD),
              ),
              CategoryCard(
                icon: "🔨",
                title: "Pertukangan",
                total: "247 mitra aktif",
                bgColor: Color(0xffF0FFF4),
                borderColor: Color(0xffCFEFD7),
              ),
              CategoryCard(
                icon: "🧹",
                title: "Kebersihan",
                total: "189 mitra aktif",
                bgColor: Color(0xffFFF0F6),
                borderColor: Color(0xffFFD6E7),
              ),
              CategoryCard(
                icon: "🌿",
                title: "Taman & Outdoor",
                total: "93 mitra aktif",
                bgColor: Color(0xffF0FFF7),
                borderColor: Color(0xffCFEFDB),
              ),
              CategoryCard(
                icon: "📦",
                title: "Pindahan Barang",
                total: "74 mitra aktif",
                bgColor: Color(0xffF8FAFC),
                borderColor: Color(0xffE2E8F0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}