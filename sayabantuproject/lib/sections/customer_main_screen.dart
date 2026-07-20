import 'package:flutter/material.dart';

import '../../models/sidebar_menu.dart';
import '../../widgets/customer_sidebar.dart';

import '../models/job_model.dart';
import '../models/offer_model.dart';

import '../screens/customer/offer_screen.dart';
import '../screens/customer/partner_profile_screen.dart';

import '../../sections/customer_dashboard.dart';
import '../../sections/notification_screen.dart';
import '../../sections/setting_screen.dart';

class CustomerMainDashboard extends StatefulWidget {
  const CustomerMainDashboard({super.key});

  @override
  State<CustomerMainDashboard> createState() =>
      _CustomerMainDashboardState();
}

class _CustomerMainDashboardState
    extends State<CustomerMainDashboard> {

  SidebarMenu selectedMenu = SidebarMenu.beranda;

  JobModel? selectedJob;

  /// DATA JOB DISIMPAN DI SINI
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

  Widget currentPage() {
    switch (selectedMenu) {

      case SidebarMenu.beranda:
        return CustomerDashboard(
          jobs: jobs,
          onOpenOffer: (job) {
            setState(() {
              selectedJob = job;
              selectedMenu = SidebarMenu.penawaran;
            });
          },
        );

      case SidebarMenu.penawaran:
        return OfferScreen(
          job: selectedJob!,
          onBack: () {
            setState(() {
              selectedMenu = SidebarMenu.beranda;
            });
          },
          onOpenProfile: () {
            setState(() {
              selectedMenu = SidebarMenu.profilMitra;
            });
          },
          onAccept: () {
            setState(() {
              selectedJob!.status = "Sedang Dikerjakan";
              selectedMenu = SidebarMenu.beranda;
            });
          },
        );

      case SidebarMenu.profilMitra:
        return PartnerProfileScreen(
          onFinish: () {
            setState(() {
              selectedMenu = SidebarMenu.penawaran;
            });
          },
        );

      case SidebarMenu.notifikasi:
        return NotificationScreen();

      case SidebarMenu.pengaturan:
        return const SettingScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          CustomerSidebar(
            activeMenu: selectedMenu,
            onMenuSelected: (menu) {
              setState(() {
                selectedMenu = menu;
              });
            },
          ),

          Expanded(
            child: currentPage(),
          ),
        ],
      ),
    );
  }
}