import 'package:flutter/material.dart';

import '../models/partner_job_model.dart';
import '../widgets/partner_job_card.dart';
import '../screens/partner/offer_job_screen.dart';

class PartnerDashboard extends StatelessWidget {
  const PartnerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PartnerJobModel> jobs = [
      PartnerJobModel(
        title: "Service AC Bocor",
        category: "AC & Elektronik",
        description: "AC bocor sejak kemarin dan perlu diperbaiki.",
        location: "Jember",
        time: "2 jam lalu",
        price: "Rp150.000",
        bidderCount: 2,
        image: "",
      ),
      PartnerJobModel(
        title: "Pasang Kran Dapur",
        category: "Plumbing",
        description: "Butuh pemasangan kran baru di dapur.",
        location: "Bondowoso",
        time: "3 jam lalu",
        price: "Rp95.000",
        bidderCount: 0,
        image: "",
      ),
      PartnerJobModel(
        title: "Cat Kamar Tidur",
        category: "Cat & Tembok",
        description: "Cat ulang kamar ukuran 3x4 meter.",
        location: "Lumajang",
        time: "5 jam lalu",
        price: "Rp320.000",
        bidderCount: 4,
        image: "",
      ),
      PartnerJobModel(
        title: "Perbaikan Pintu",
        category: "Pertukangan",
        description: "Pintu kayu tidak bisa ditutup rapat.",
        location: "Banyuwangi",
        time: "1 hari lalu",
        price: "Rp70.000",
        bidderCount: 1,
        image: "",
      ),
    ];

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.all(30),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Lowongan Tersedia",
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            "Temukan pekerjaan yang sesuai dengan keahlianmu.",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 30),

          Row(
            children: [
              Expanded(
                child: _statCard(
                  Icons.work_outline,
                  "Total Lowongan",
                  jobs.length.toString(),
                  Colors.blue,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _statCard(
                  Icons.description_outlined,
                  "Penawaran Aktif",
                  "0",
                  Colors.orange,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _statCard(
                  Icons.stars,
                  "Total Poin",
                  "120",
                  Colors.green,
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          Expanded(
            child: ListView.builder(
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                return PartnerJobCard(
                  job: jobs[index],
                  onTakeOffer: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => OfferJobScreen(
                          job: jobs[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(String text, [bool active = false]) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: active
            ? const Color(0xffF97316)
            : Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: const Color(0xffE5E7EB),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: active
              ? Colors.white
              : Colors.black87,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

Widget _statCard(
  IconData icon,
  String title,
  String value,
  Color color,
) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: const Color(0xffE5E7EB)),
    ),
    child: Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: color.withOpacity(0.15),
          child: Icon(
            icon,
            color: color,
          ),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}