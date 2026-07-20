import 'package:flutter/material.dart';

import '../models/partner_job_model.dart';

class PartnerJobCard extends StatelessWidget {
  final PartnerJobModel job;
  final VoidCallback onTakeOffer;

  const PartnerJobCard({
    super.key,
    required this.job,
    required this.onTakeOffer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(20),
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

          // Thumbnail
          Container(
            width: 85,
            height: 85,
            decoration: BoxDecoration(
              color: const Color(0xffFFF3E8),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.handyman,
              color: Color(0xffF97316),
              size: 40,
            ),
          ),

          const SizedBox(width: 18),

          // Informasi Pekerjaan
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  job.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    job.category,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  job.description,
                  style: const TextStyle(
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 14),

                Row(
                  children: [

                    const Icon(
                      Icons.location_on_outlined,
                      size: 18,
                      color: Colors.grey,
                    ),

                    const SizedBox(width: 5),

                    Text(
                      job.location,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(width: 18),

                    const Icon(
                      Icons.access_time,
                      size: 18,
                      color: Colors.grey,
                    ),

                    const SizedBox(width: 5),

                    Text(
                      job.time,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 20),

          // Harga + Tombol
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              Text(
                job.price,
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                "${job.bidderCount} sudah menawar",
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 25),

              ElevatedButton.icon(
                onPressed: onTakeOffer,
                icon: const Icon(Icons.flash_on),
                label: const Text("Ambil & Nego"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffF97316),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}