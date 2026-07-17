import 'package:flutter/material.dart';

import '../models/job_model.dart';
import '../models/offer_model.dart';

import '../widgets/dashboard_header.dart';
import '../widgets/pekerjaan_card.dart';
import '../widgets/statistic_card.dart';

class CustomerDashboard extends StatefulWidget {
  const CustomerDashboard({super.key});

  @override
  State<CustomerDashboard> createState() =>
      _CustomerDashboardState();
}

class _CustomerDashboardState
    extends State<CustomerDashboard> {

  final List<JobModel> jobs = [
    JobModel(
      title: "Service AC Bocor",
      description: "AC mengeluarkan air sejak kemarin.",
      price: "Rp150.000",
      status: "Mencari Mitra",
      time: "2 jam lalu",
      offers: [
        OfferModel(
          name: "Andi Teknik AC",
          rating: 4.9,
          verified: true,
          jobsCompleted: 120,
          price: "Rp145.000",
        ),
      ],
    ),
    JobModel(
      title: "Perbaikan Kunci Rumah",
      description: "Kunci utama macet dan sulit diputar.",
      price: "Rp120.000",
      status: "Sedang Dikerjakan",
      time: "Kemarin",
      offers: [],
    ),
    JobModel(
      title: "Pasang Lampu Teras",
      description: "Butuh pemasangan lampu taman.",
      price: "Rp200.000",
      status: "Selesai",
      time: "3 hari lalu",
      offers: [],
    ),
  ];

  void addJob(JobModel job) {
    setState(() {
      jobs.insert(0, job);
    });
  }

  @override
  Widget build(BuildContext context) {

    final int runningJobs = jobs
        .where((job) => job.status == "Sedang Dikerjakan")
        .length;

    final int completedJobs = jobs
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
                value: jobs.length.toString(),
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
            itemCount: jobs.length,
            separatorBuilder: (_, __) =>
                const SizedBox(height: 18),
            itemBuilder: (context, index) {
              return JobCard(
                job: jobs[index],
                onRefresh: () {
                  setState(() {
                  });
                },
              );
            },
          ),
        ),
      ],
    ),
  );
}
}