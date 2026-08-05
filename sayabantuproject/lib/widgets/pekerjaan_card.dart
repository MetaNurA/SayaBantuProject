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
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xffE5E7EB),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: const Color(0xffF3F4F6),
              borderRadius: BorderRadius.circular(14),
            ),
            clipBehavior: Clip.antiAlias,
            child: job.imageBytes != null
                ? Image.memory(
                    job.imageBytes!,
                    fit: BoxFit.cover,
                  )
                : const Icon(
                    Icons.handyman,
                    size: 42,
                    color: Color(0xffF97316),
                  ),
          ),
          const SizedBox(width: 20),

          // Informasi
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  job.title,
                  style: TextStyle(
                    fontSize: isMobile ? 17 : 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1E293B),
                  ),
                ),

                const SizedBox(height: 10),
                  Text(
                    job.description,
                    style: TextStyle(
                      fontSize: isMobile ? 13 : 14,
                      color: Colors.grey,
                      height: 1.6,
                    ),
                  ),

                if (job.partnerName != null) ...[
                    const SizedBox(height: 12),
                      Wrap(
                        spacing: 6,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Icon(
                            Icons.person,
                            size: 18,
                            color: Colors.green,
                          ),
                          Text(
                            "Mitra: ${job.partnerName}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),

                    const SizedBox(height: 6),

                    Wrap(
                      spacing: 6,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Icon(
                          Icons.payments,
                          size: 18,
                          color: Colors.orange,
                        ),
                        Text(
                          "Harga Deal: ${job.acceptedPrice}",
                          style: const TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],

                  const SizedBox(height: 18),

                  Wrap(
                    spacing: 24,
                    runSpacing: 8,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      if (job.status == "Mencari Mitra") ...[
                        Text(
                          job.price,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                        _info(
                          Icons.people_alt_outlined,
                          "${job.offerCount} Penawar",
                        ),
                      ],

                      _info(
                        Icons.access_time,
                        job.time,
                      ),
                    ],
                  ),
              ]
            ),
          ),

          SizedBox(
            width: isMobile ? 12 : 20,
          ),

          // Status
          Column(
            crossAxisAlignment:
                isMobile
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.end,
            children: [
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
                child: 
                Text(
                  job.status,
                  style: TextStyle(
                    color: job.status == "Selesai"
                      ? Colors.green
                      : job.status == "Sedang Dikerjakan"
                          ? Colors.blue
                          : Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              if (job.status == "Mencari Mitra")
                ElevatedButton(
                  onPressed: () {
                    onOpenOffer(job);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(
                      isMobile ? 120 : 0,
                      44,
                      ),
                    backgroundColor: const Color(0xffF97316),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                  ),
                  child: const Text("Lihat Penawaran"),
                )
             else if (job.status == "Sedang Dikerjakan")
                ElevatedButton(
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
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                ),
                child: const Text("Selesaikan"),
              ),
            ],
          ),
        ],
      ),
    );
    },
    );
  }

  Widget _info(IconData icon, String text) {
  return Row(
    children: [
      Icon(
        icon,
        size: 18,
        color: Colors.grey,
      ),
      const SizedBox(width: 6),
      Text(
        text,
        style: const TextStyle(
          color: Colors.grey,
        ),
      ),
    ],
  );
}
}