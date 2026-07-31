import 'package:flutter/material.dart';

import '../../data/job_data.dart';
import '../../data/active_offer_data.dart';
import '../../widgets/active_offer_card.dart';

class ActiveOfferScreen extends StatelessWidget {
  const ActiveOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final activeJobs = jobs.where((job) => job.offers.isNotEmpty).toList();

    return Container(
      color: const Color(0xffF8FAFC),
      padding: const EdgeInsets.all(35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Penawaran Aktif Saya",
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            "Seluruh pekerjaan yang sudah diberi penawaran.",
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 35),

          Expanded(
            child: ListView.builder(
              itemCount: activeOffers.length,
              itemBuilder: (context, index) {
                return ActiveOfferCard(
                  offer: activeOffers[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}