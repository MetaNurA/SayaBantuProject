import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String icon;
  final String title;
  final String total;
  final Color bgColor;
  final Color borderColor;

  const CategoryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.total,
    required this.bgColor,
    required this.borderColor,
  });


  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints) {

        final isSmall = constraints.maxWidth < 250;

        return Container(
          padding: EdgeInsets.all(
            isSmall ? 14 : 22,
          ),

          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(18),

            border: Border.all(
              color: borderColor,
            ),
          ),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              Text(
                icon,
                style: TextStyle(
                  fontSize: isSmall ? 26 : 34,
                ),
              ),

              SizedBox(
                height: isSmall ? 12 : 20,
              ),

              Text(
                title,
                maxLines: 2,
                overflow:
                    TextOverflow.ellipsis,

                style: TextStyle(
                  fontSize: isSmall ? 16 : 20,
                  fontWeight:
                      FontWeight.bold,
                  color:
                      const Color(0xff08162F),
                ),
              ),

              SizedBox(
                height: isSmall ? 5 : 8,
              ),

              Text(
                total,
                style: TextStyle(
                  fontSize:
                      isSmall ? 12 : 14,
                  color:
                      const Color(0xffF97316),
                  fontWeight:
                      FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}