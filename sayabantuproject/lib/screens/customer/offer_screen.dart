import 'package:flutter/material.dart';

import '../../models/offer_model.dart';
import '../../widgets/offer_card.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final offers = [
      const OfferModel(
        name: "Pak Budi",
        rating: 4.9,
        jobsCompleted: 248,
        price: "Rp170.000",
      ),
      const OfferModel(
        name: "Mas Eko",
        rating: 4.8,
        jobsCompleted: 183,
        price: "Rp160.000",
      ),
      const OfferModel(
        name: "Pak Joko",
        rating: 4.7,
        jobsCompleted: 120,
        price: "Rp150.000",
      ),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
              "${offers.length} Mitra Mengirim Penawaran",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.separated(
                itemCount: offers.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  return OfferCard(
                    offer: offers[index],
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