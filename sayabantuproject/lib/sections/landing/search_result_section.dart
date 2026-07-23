import 'package:flutter/material.dart';
import '../../models/partner_job_model.dart';

class SearchResultSection extends StatelessWidget {
  final List<PartnerJobModel> jobs;
  final String keyword;

  const SearchResultSection({
    super.key,
    required this.jobs,
    required this.keyword,
  });

  @override
  Widget build(BuildContext context) {
    if (keyword.isEmpty) {
      return const SizedBox();
    }

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 80,
        vertical: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "Hasil pencarian \"$keyword\"",
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 30),

          if (jobs.isEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(50),
              decoration: BoxDecoration(
                color: const Color(0xffF8FAFC),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.search_off,
                    size: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Pekerjaan tidak ditemukan",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: jobs.length,
              itemBuilder: (_, index) {
                final job = jobs[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 18),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xffFFF3E8),
                      child: Icon(
                        Icons.work_outline,
                        color: Color(0xffF97316),
                      ),
                    ),

                    title: Text(job.title),

                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(job.description),
                        const SizedBox(height: 6),
                        Text(
                          job.location,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),

                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          job.price,
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Mencari Mitra",
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            )
        ],
      ),
    );
  }
}