import 'package:flutter/material.dart';
import '../models/active_offer_model.dart';

class ActiveOfferCard extends StatelessWidget {
  final ActiveOfferModel offer;
  final VoidCallback? onFinishJob;

  const ActiveOfferCard({
    super.key,
    required this.offer,
    this.onFinishJob,
  });

  Color _statusColor(String status) {
    switch (status) {
      case "Menunggu Respon":
        return Colors.orange;

      case "Sedang Dikerjakan":
        return Colors.blue;

      case "Selesai":
        return Colors.teal;

      case "Ditolak":
        return Colors.red;

      default:
        return Colors.grey;
    }
  }

  IconData _statusIcon(String status) {
    switch (status) {
      case "Menunggu Respon":
        return Icons.access_time;

      case "Sedang Dikerjakan":
        return Icons.build;

      case "Selesai":
        return Icons.task_alt;

      case "Ditolak":
        return Icons.cancel;

      default:
        return Icons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    final String status = offer.status;

    return Container(
      margin: const EdgeInsets.only(bottom: 22),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: _statusColor(status),
          width: 1.5,
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

              const Spacer(),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 9,
                ),
                decoration: BoxDecoration(
                  color: _statusColor(status).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _statusIcon(status),
                      size: 18,
                      color: _statusColor(status),
                    ),

                    const SizedBox(width: 6),

                    Text(
                      status,
                      style: TextStyle(
                        color: _statusColor(status),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (status == "Sedang Dikerjakan") ...[
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onFinishJob,
                icon: const Icon(Icons.task_alt),
                label: const Text("Selesaikan Pekerjaan"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
                  ],
      ),
    );
  }
}