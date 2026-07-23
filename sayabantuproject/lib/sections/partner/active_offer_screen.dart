import 'package:flutter/material.dart';

import '../../data/dummy_offers.dart';
import '../../widgets/active_offer_card.dart';

class ActiveOfferScreen extends StatelessWidget {
  const ActiveOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            "Seluruh penawaran yang sedang menunggu respon pelanggan.",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 35),

          Expanded(
            child: ListView.builder(
              itemCount: dummyOffers.length,
              itemBuilder: (context, index) {
                return ActiveOfferCard(
                  offer: dummyOffers[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}