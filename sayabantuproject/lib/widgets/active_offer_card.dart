import 'package:flutter/material.dart';
import '../models/active_offer_model.dart';

class ActiveOfferCard extends StatelessWidget {
  final ActiveOfferModel offer;

  const ActiveOfferCard({
    super.key,
    required this.offer,
  });

  @override
  Widget build(BuildContext context) {
    final bool accepted = offer.accepted;

    return Container(
      margin: const EdgeInsets.only(bottom: 22),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: accepted
              ? const Color(0xff16A34A)
              : const Color(0xffE5E7EB),
          width: accepted ? 2 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            offer.job.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            offer.job.category,
            style: const TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              const Icon(
                Icons.attach_money,
                color: Colors.orange,
              ),

              const SizedBox(width: 6),

              Text(
                offer.price,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),

              const SizedBox(width: 35),

              const Icon(
                Icons.groups_outlined,
                color: Colors.blue,
              ),

              const SizedBox(width: 6),

              Text(
                "Posisi #${offer.queue}",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),

              if (offer.queue == 1) ...[
                const SizedBox(width: 10),
                const Text(
                  "TERATAS!",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],

              const Spacer(),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 9,
                ),
                decoration: BoxDecoration(
                  color: accepted
                      ? const Color(0xffDCFCE7)
                      : const Color(0xffFFF7ED),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Icon(
                      accepted
                          ? Icons.check_circle
                          : Icons.access_time,
                      size: 18,
                      color: accepted
                          ? Colors.green
                          : Colors.orange,
                    ),

                    const SizedBox(width: 6),

                    Text(
                      accepted
                          ? "Diterima Pelanggan"
                          : "Menunggu",
                      style: TextStyle(
                        color: accepted
                            ? Colors.green
                            : Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}