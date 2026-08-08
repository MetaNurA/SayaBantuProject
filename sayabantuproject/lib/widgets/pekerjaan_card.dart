import 'package:flutter/material.dart';
import '../models/job_model.dart';

class JobCard extends StatelessWidget {
  final JobModel job;
  final Function(JobModel)? onFinish;
  final Function(JobModel) onOpenOffer;

  const JobCard({
    super.key,
    required this.job,
    this.onFinish,
    required this.onOpenOffer,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;

        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: Theme.of(context).dividerColor,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: isMobile ? 80 : 100,
                    height: isMobile ? 80 : 100,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: job.imageBytes != null
                        ? Image.memory(job.imageBytes!, fit: BoxFit.cover)
                        : Icon(
                            Icons.handyman,
                            size: 38,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          job.title,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          job.description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              if (job.partnerName != null) ...[
                Row(
                  children: [
                    const Icon(Icons.person, size: 18, color: Colors.green),
                    const SizedBox(width: 6),
                    Text(
                      "Mitra: ${job.partnerName}",
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.payments, size: 18, color: Colors.orange),
                    const SizedBox(width: 6),
                    Text(
                      "Harga Deal: ${job.acceptedPrice}",
                      style: const TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],

              Wrap(
                spacing: 20,
                runSpacing: 8,
                children: [
                  if (job.status == "Mencari Mitra") ...[
                    Text(job.price),
                    _info(Icons.people_alt_outlined, "${job.offerCount} Penawar"),
                  ],
                  _info(Icons.access_time, job.time),
                ],
              ),

              const SizedBox(height: 18),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: job.status == "Selesai"
                      ? Colors.green.shade100
                      : job.status == "Sedang Dikerjakan"
                          ? Colors.blue.shade100
                          : Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  job.status,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: job.status == "Selesai"
                        ? Colors.green
                        : job.status == "Sedang Dikerjakan"
                            ? Colors.blue
                            : Colors.orange,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: job.status == "Mencari Mitra"
                    ? ElevatedButton(
                        onPressed: () => onOpenOffer(job),
                        child: const Text("Lihat Penawaran"),
                      )
                    : job.status == "Sedang Dikerjakan"
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: const Text("Konfirmasi"),
                                  content: const Text(
                                    "Apakah pekerjaan ini benar-benar telah selesai?",
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("Batal"),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        onFinish?.call(job);
                                      },
                                      child: const Text("Ya"),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: const Text("Selesaikan"),
                          )
                        : const SizedBox.shrink(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _info(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: Colors.grey),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}