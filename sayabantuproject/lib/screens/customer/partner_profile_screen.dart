import 'package:flutter/material.dart';
import 'customer_dashboard.dart';

class PartnerProfileScreen extends StatelessWidget {
  const PartnerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        title: const Text("Profil Mitra"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [

            // FOTO
            const CircleAvatar(
              radius: 60,
              backgroundColor: Color(0xffFFE7D1),
              child: Icon(
                Icons.person,
                size: 70,
                color: Color(0xffF97316),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Pak Budi Santoso",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 4),
                Text(
                  "4.9 (248 Review)",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.verified,
                    color: Colors.green,
                    size: 18,
                  ),
                  SizedBox(width: 6),
                  Text(
                    "Mitra Terverifikasi",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 35),

            // Statistik
            Row(
              children: const [

                Expanded(
                  child: _Statistic(
                    value: "248",
                    title: "Job Selesai",
                  ),
                ),

                SizedBox(width: 20),

                Expanded(
                  child: _Statistic(
                    value: "98%",
                    title: "Kepuasan",
                  ),
                ),

                SizedBox(width: 20),

                Expanded(
                  child: _Statistic(
                    value: "2022",
                    title: "Bergabung",
                  ),
                ),
              ],
            ),

            const SizedBox(height: 35),

            // Tentang
            _sectionTitle("Tentang"),

            const SizedBox(height: 12),

            const Text(
              "Berpengalaman lebih dari 5 tahun dalam bidang service AC, instalasi listrik, plumbing, dan perbaikan rumah. Mengutamakan kualitas pekerjaan, ketepatan waktu, serta kepuasan pelanggan.",
              style: TextStyle(
                height: 1.7,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 30),

            // Keahlian
            _sectionTitle("Keahlian"),

            const SizedBox(height: 12),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: const [
                Chip(label: Text("Service AC")),
                Chip(label: Text("Plumbing")),
                Chip(label: Text("Listrik")),
                Chip(label: Text("Cat Rumah")),
                Chip(label: Text("Perbaikan Kunci")),
              ],
            ),

            const SizedBox(height: 30),

            // Review
            _sectionTitle("Ulasan Pelanggan"),

            const SizedBox(height: 20),

            _review(
              "Andi",
              "Pengerjaan sangat cepat dan rapi.",
            ),

            _review(
              "Rina",
              "Harga sesuai dan orangnya ramah.",
            ),

            _review(
              "Fajar",
              "Recommended, pasti order lagi.",
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.check),
                label: const Text(
                  "Pilih Mitra",
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffF97316),
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Mitra berhasil dipilih."),
                      duration: Duration(seconds: 2),
                    ),
                  );

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CustomerDashboard(),
                    ),
                    (route) => false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _review(String name, String review) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.person),
        ),
        title: Text(name),
        subtitle: Text(review),
        trailing: const Icon(
          Icons.star,
          color: Colors.amber,
        ),
      ),
    );
  }
}

class _Statistic extends StatelessWidget {
  final String value;
  final String title;

  const _Statistic({
    required this.value,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xffF97316),
            ),
          ),
          const SizedBox(height: 6),
          Text(title),
        ],
      ),
    );
  }
}