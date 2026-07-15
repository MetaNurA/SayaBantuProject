import 'package:flutter/material.dart';
import '../../models/job_model.dart';
import '../../widgets/customer_sidebar.dart';
import '../../widgets/dashboard_header.dart';
import '../../widgets/pekerjaan_card.dart';
import '../../widgets/statistic_card.dart'; 

class CustomerDashboard extends StatelessWidget {
  CustomerDashboard({super.key});

  final List<JobModel> jobs = [
    JobModel(
      title: "Service AC Bocor",
      description: "AC mengeluarkan air sejak kemarin.",
      price: "Rp150.000",
      status: "Mencari Mitra",
      time: "2 jam lalu",
      offer: 5,
    ),
    JobModel(
      title: "Perbaikan Kunci Rumah",
      description: "Kunci utama macet dan sulit diputar.",
      price: "Rp120.000",
      status: "Sedang Dikerjakan",
      time: "Kemarin",
      offer: 3,
    ),
    JobModel(
      title: "Pasang Lampu Teras",
      description: "Butuh pemasangan lampu taman.",
      price: "Rp200.000",
      status: "Selesai",
      time: "3 hari lalu",
      offer: 7,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Row(
        children: [
          const CustomerSidebar(
            activeMenu: "Beranda",
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DashboardHeader(),

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

                      const Expanded(
                        child: StatisticCard(
                          icon: Icons.settings,
                          value: "1",
                          title: "Sedang Berjalan",
                          color: Colors.orange,
                        ),
                      ),

                      const SizedBox(width: 20),

                      const Expanded(
                        child: StatisticCard(
                          icon: Icons.check_circle,
                          value: "1",
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
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 18),
                      itemBuilder: (context, index) {
                        return JobCard(
                          job: jobs[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}