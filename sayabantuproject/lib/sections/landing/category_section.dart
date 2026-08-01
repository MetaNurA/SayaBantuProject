import 'package:flutter/material.dart';
import 'category_card.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints) {

        final width = constraints.maxWidth;

        final isMobile = width < 600;
        final isTablet = width >= 600 && width < 1100;


        final horizontalPadding = isMobile
            ? 20.0
            : isTablet
                ? 50.0
                : 120.0;


        final titleSize = isMobile
            ? 32.0
            : isTablet
                ? 38.0
                : 46.0;


        final columnCount = isMobile
            ? 1
            : isTablet
                ? 2
                : 4;


        return Container(
          color: Theme.of(context).cardColor,

          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: isMobile ? 50 : 80,
          ),


          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [


              /// HEADER

              Text(
                "KATEGORI JASA",
                style: const TextStyle(
                  color: Color(0xffF97316),
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                  fontSize: 14,
                ),
              ),


              const SizedBox(height: 10),


              Text(
                "Semua Kebutuhan\nRumahmu Ada Di Sini",

                style: TextStyle(
                  fontSize: titleSize,
                  height: 1.15,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff08162F),
                ),
              ),



              SizedBox(
                height: isMobile ? 30 : 50,
              ),



              /// CATEGORY GRID

              GridView.count(

                shrinkWrap: true,

                physics:
                    const NeverScrollableScrollPhysics(),

                crossAxisCount: columnCount,


                crossAxisSpacing:
                    isMobile ? 12 : 20,

                mainAxisSpacing:
                    isMobile ? 12 : 20,


                childAspectRatio:
                    isMobile ? 2.2 : 1.7,


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
      },
    );
  }
}