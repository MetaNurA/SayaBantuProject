import 'package:flutter/material.dart';

import '../../models/offer_model.dart';
import '../../widgets/offer_card.dart';
import '../../models/job_model.dart';

class OfferScreen extends StatelessWidget {
  final JobModel job;

  const OfferScreen({
    super.key,
    required this.job,
    });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).cardColor,
        foregroundColor: Colors.black,
        title: const Text(
          "Penawaran Mitra",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Service AC Bocor",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Budget : Rp150.000",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            Text(
              "${job.offers.length} Mitra Mengirim Penawaran",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.separated(
                itemCount: job.offers.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  return OfferCard(
                    offer: job.offers[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}