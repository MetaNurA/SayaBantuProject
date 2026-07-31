import 'package:flutter/material.dart';
import '../../widgets/offer_card.dart';
import '../../models/job_model.dart';
import '../../models/offer_model.dart';

class OfferScreen extends StatelessWidget {
  final JobModel job;
  final Function(OfferModel) onAccept;
  final VoidCallback onBack;
  final Function(OfferModel) onOpenProfile;
  final Function(OfferModel) onReject;

  const OfferScreen({
    super.key,
    required this.job,
    required this.onAccept,
    required this.onBack,
    required this.onOpenProfile,
    required this.onReject,
    });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBack,
        ),
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

            Text(
              job.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "Budget : ${job.price}",
              style: const TextStyle(
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
                    job: job,
                    offer: job.offers[index],
                    onAccept: onAccept,
                    onOpenProfile: onOpenProfile,
                    onReject: onReject,
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