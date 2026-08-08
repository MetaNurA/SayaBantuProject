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

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final isMobile = width < 600;
        final isTablet = width >= 600 && width < 1000;

        final padding = isMobile
            ? 16.0
            : isTablet
                ? 24.0
                : 30.0;

        return Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Lowongan Tersedia",
                style: TextStyle(
                  fontSize: isMobile ? 26 : 34,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                "Temukan pekerjaan yang sesuai dengan keahlianmu.",
                style: TextStyle(
                  color: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.color
                      ?.withOpacity(0.6),
                  fontSize: isMobile ? 14 : 16,
                ),
              ),

              const SizedBox(height: 24),

              // =========================
              // STATISTIK
              // =========================
              GridView.count(
                crossAxisCount: isMobile
                    ? 1
                    : isTablet
                        ? 2
                        : 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: isMobile
                    ? 3.8
                    : isTablet
                        ? 2.8
                        : 2.4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _statCard(
                    context,
                    Icons.work_outline,
                    "Total Lowongan",
                    jobs.length.toString(),
                    Colors.blue,
                  ),

                  _statCard(
                    context,
                    Icons.description_outlined,
                    "Penawaran Aktif",
                    "0",
                    Colors.orange,
                  ),

                  _statCard(
                    context,
                    Icons.stars,
                    "Total Poin",
                    "120",
                    Colors.green,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // =========================
              // DAFTAR LOWONGAN
              // =========================
              Expanded(
                child: availableJobs.isEmpty
                    ? Center(
                        child: Text(
                          "Belum ada lowongan tersedia.",
                          style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.color
                                ?.withOpacity(0.6),
                          ),
                        ),
                      )
                    : ListView.separated(
                        itemCount: availableJobs.length,
                        separatorBuilder: (_, __) =>
                            const SizedBox(height: 18),
                        itemBuilder: (context, index) {
                          final job = availableJobs[index];

                          return PartnerJobCard(
                            job: job,
                            onTakeOffer: () {
                              onTakeOffer(job);
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _statCard(
    BuildContext context,
    IconData icon,
    String title,
    String value,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
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

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}