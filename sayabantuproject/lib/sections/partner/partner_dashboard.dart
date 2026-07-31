import 'package:flutter/material.dart';
import '../../data/job_data.dart';
import '../../models/job_model.dart';
import '../../widgets/partner_job_card.dart';

class PartnerDashboard extends StatelessWidget {
  final Function(JobModel) onTakeOffer;

  const PartnerDashboard({
    super.key,
    required this.onTakeOffer,
    });

  @override
  Widget build(BuildContext context) {
  
    final availableJobs = jobs.where((job) {
      return job.status == "Mencari Mitra";
    }).toList();

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.all(30),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Lowongan Tersedia",
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            "Temukan pekerjaan yang sesuai dengan keahlianmu.",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 30),

          Row(
            children: [
              Expanded(
                child: _statCard(
                  Icons.work_outline,
                  "Total Lowongan",
                  jobs.length.toString(),
                  Colors.blue,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _statCard(
                  Icons.description_outlined,
                  "Penawaran Aktif",
                  "0",
                  Colors.orange,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _statCard(
                  Icons.stars,
                  "Total Poin",
                  "120",
                  Colors.green,
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          Expanded(
            child: ListView.builder(
              itemCount: availableJobs.length,
              itemBuilder: (context, index) {
                return PartnerJobCard(
                  job: availableJobs[index],
                  onTakeOffer: () {
                    onTakeOffer(availableJobs[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(String text, [bool active = false]) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: active
            ? const Color(0xffF97316)
            : Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: const Color(0xffE5E7EB),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: active
              ? Colors.white
              : Colors.black87,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

Widget _statCard(
  IconData icon,
  String title,
  String value,
  Color color,
) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: const Color(0xffE5E7EB)),
    ),
    child: Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: color.withOpacity(0.15),
          child: Icon(
            icon,
            color: color,
          ),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}