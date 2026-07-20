import 'package:flutter/material.dart';

import '../models/job_model.dart';

import '../widgets/dashboard_header.dart';
import '../widgets/pekerjaan_card.dart';
import '../widgets/statistic_card.dart';

class CustomerDashboard extends StatefulWidget {
  final List<JobModel> jobs;
  final Function(JobModel) onOpenOffer;

  const CustomerDashboard({
    super.key,
    required this.jobs,
    required this.onOpenOffer,
  });

  @override
  State<CustomerDashboard> createState() =>
      _CustomerDashboardState();
}

class _CustomerDashboardState
    extends State<CustomerDashboard> {

  void addJob(JobModel job) {
  setState(() {
    widget.jobs.insert(0, job);
  });
}

  @override
  Widget build(BuildContext context) {

    final int runningJobs = widget.jobs
        .where((job) => job.status == "Sedang Dikerjakan")
        .length;

    final int completedJobs = widget.jobs
        .where((job) => job.status == "Selesai")
        .length;

    return Container(
    color: Theme.of(context).scaffoldBackgroundColor,
    padding: const EdgeInsets.all(30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DashboardHeader(
          onAddJob: addJob,
        ),

        const SizedBox(height: 30),

        Row(
          children: [
            Expanded(
              child: StatisticCard(
                icon: Icons.assignment,
                value: widget.jobs.length.toString(),
                title: "Total Posting",
                color: Colors.blue,
              ),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: StatisticCard(
                icon: Icons.settings,
                value: runningJobs.toString(),
                title: "Sedang Berjalan",
                color: Colors.orange,
              ),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: StatisticCard(
                icon: Icons.check_circle,
                value: completedJobs.toString(),
                title: "Selesai",
                color: Colors.green,
              ),
            ),
          ],
        ),

        const SizedBox(height: 30),

                Expanded(
          child: ListView.separated(
            itemCount: widget.jobs.length,
            separatorBuilder: (_, __) =>
                const SizedBox(height: 18),
            itemBuilder: (context, index) {
              return JobCard(
                job: widget.jobs[index],
                onRefresh: () {
                  setState(() {});
                },
                onOpenOffer: widget.onOpenOffer,
              );
            },
          ),
        ),
      ],
    ),
  );
}
}