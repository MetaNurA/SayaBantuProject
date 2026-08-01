import 'package:flutter/material.dart';

class StepCard extends StatelessWidget {
  final String number;
  final Color numberColor;
  final IconData icon;
  final String title;
  final String description;
  final List<String> points;

  const StepCard({
    super.key,
    required this.number,
    required this.numberColor,
    required this.icon,
    required this.title,
    required this.description,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          constraints: const BoxConstraints(
            minHeight: 350,
          ),
          padding: const EdgeInsets.fromLTRB(24, 65, 24, 25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: const Color(0xffE6EDF5),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: numberColor,
                size: 32,
              ),

              const SizedBox(height: 20),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xff08162F),
                ),
              ),

              const SizedBox(height: 12),

              Text(
                description,
                style: const TextStyle(
                  color: Color(0xff64748B),
                  height: 1.6,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 20),

              ...points.map(
                (e) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check,
                        size: 16,
                        color: numberColor,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          e,
                          style: const TextStyle(
                            color: Color(0xff334155),
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

        Positioned(
          top: -24,
          left: 28,
          child: Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: numberColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: numberColor.withOpacity(.35),
                  blurRadius: 16,
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}