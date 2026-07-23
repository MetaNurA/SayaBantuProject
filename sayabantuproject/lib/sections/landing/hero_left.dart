import 'package:flutter/material.dart';

class HeroLeft extends StatefulWidget {
  final VoidCallback onCariJasa;
  final VoidCallback onJadiMitra;
  final Function(String) onSearch;

  const HeroLeft({
    super.key,
    required this.onCariJasa,
    required this.onJadiMitra,
    required this.onSearch,
  });

@override
  State<HeroLeft> createState() => _HeroLeftState();
}

class _HeroLeftState extends State<HeroLeft> {
  final TextEditingController searchController =
      TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Badge
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 7,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF2C2118),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: const Color(0xFFFF8A00),
            ),
          ),
          child: const Text(
            "🔥 1.240+ Mitra Terverifikasi Siap Melayani",
            style: TextStyle(
              color: Color(0xFFFFC27A),
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        const SizedBox(height: 28),

        const Text(
          "Bantuan\nRumah",
          style: TextStyle(
            color: Colors.white,
            fontSize: 48,
            fontWeight: FontWeight.w800,
            height: 1,
          ),
        ),

        const SizedBox(height: 4),

        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w800,
              height: 1,
            ),
            children: [
              TextSpan(
                text: "Tepat Harga,\n",
                style: TextStyle(
                  color: Color(0xFFFF7A00),
                ),
              ),
              TextSpan(
                text: "Tepat Waktu.",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 22),

        const SizedBox(
          width: 430,
          child: Text(
            "Posting masalah, negosiasi harga langsung dengan mitra terbaik di area kamu. Transparan penuh sehingga kamu tetap memegang kendali.",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              height: 1.8,
            ),
          ),
        ),

        const SizedBox(height: 30),

        // Search Box
        Container(
          width: 450,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              const SizedBox(width: 15),

              const Icon(
                Icons.search,
                color: Colors.grey,
                size: 20,
              ),

              const SizedBox(width: 10),

              Expanded(
                child: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    hintText: "Mau jasa apa hari ini?",
                    border: InputBorder.none,
                    isCollapsed: true,
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  widget.onSearch(
                    searchController.text.trim(),
                  );
                },
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                ),
                child: Container(
                  width: 120,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF7A00),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(14),
                      bottomRight: Radius.circular(14),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Cari Mitra",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Tombol CTA
        Row(
          children: [
            ElevatedButton(
              onPressed: widget.onCariJasa,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF7A00),
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 18,
                ),
              ),
              child: const Text(
                "Cari Jasa Sekarang",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(width: 16),

            OutlinedButton(
              onPressed: widget.onJadiMitra,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.white,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 18,
                ),
              ),
              child: const Text(
                "Jadi Mitra",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        const Row(
          children: [
            HeroInfo(
              icon: "⭐",
              value: "4.9",
              label: "Rating",
            ),
            SizedBox(width: 35),
            HeroInfo(
              icon: "✔",
              value: "12rb+",
              label: "Job Selesai",
            ),
            SizedBox(width: 35),
            HeroInfo(
              icon: "🎁",
              value: "0%",
              label: "Biaya Posting",
            ),
          ],
        ),
      ],
    );
  }

  Widget chip(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF233447),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
        ),
      ),
    );
  }
}

class HeroInfo extends StatelessWidget {
  final String icon;
  final String value;
  final String label;

  const HeroInfo({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$icon $value",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white60,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}