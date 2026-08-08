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
    final status = offer.status;
    final statusColor = _statusColor(status);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Container(
          margin: const EdgeInsets.only(bottom: 18),
          padding: EdgeInsets.all(isMobile ? 16 : 25),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: statusColor,
              width: 1.5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                offer.job.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 19 : 22,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                offer.job.category,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 18),

              if (isMobile)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _price(context),
                    const SizedBox(height: 12),
                    _status(status, statusColor),
                  ],
                )
              else
                Row(
                  children: [
                    Expanded(
                      child: _price(context),
                    ),
                    const SizedBox(width: 16),
                    _status(status, statusColor),
                  ],
                ),

              if (status == "Sedang Dikerjakan") ...[
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: onFinishJob,
                    icon: const Icon(Icons.task_alt),
                    label: const Text(
                      "Selesaikan Pekerjaan",
                    ),
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
      },
    );
  }

  Widget _price(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.attach_money,
          color: Colors.orange,
          size: 20,
        ),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            offer.price,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.color,
            ),
          ),
        ),
      ],
    );
  }

  Widget _status(String status, Color statusColor) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _statusIcon(status),
            size: 18,
            color: statusColor,
          ),
          const SizedBox(width: 6),
          Text(
            status,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: statusColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}