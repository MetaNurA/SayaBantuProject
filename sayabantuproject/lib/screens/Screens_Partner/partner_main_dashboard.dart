import 'package:flutter/material.dart';

import '../../models/partner_sidebar_menu.dart';
import '../../models/job_model.dart';

import '../../widgets/partner_sidebar.dart';

import '../../sections/partner/partner_dashboard.dart';
import '../../sections/partner/active_offer_screen.dart';
import '../../sections/partner/partner_setting_screen.dart';
import '../../sections/partner/offer_job_screen.dart';

class PartnerMainDashboard extends StatefulWidget {
  const PartnerMainDashboard({super.key,});

  @override
  State<PartnerMainDashboard> createState() =>
      _PartnerMainDashboardState();
}

class _PartnerMainDashboardState extends State<PartnerMainDashboard> {

  PartnerSidebarMenu selectedMenu =
      PartnerSidebarMenu.cariPekerjaan;

  JobModel? selectedJob;

  Widget currentPage() {
    switch (selectedMenu) {

      case PartnerSidebarMenu.cariPekerjaan:
        return PartnerDashboard(
          onTakeOffer: (job) {
            setState(() {
              selectedJob = job;
              selectedMenu = PartnerSidebarMenu.offerJob;
            });
          },
        );

      case PartnerSidebarMenu.offerJob:
        return OfferJobScreen(
          job: selectedJob!,
          onSubmit: () {
            setState(() {
              selectedMenu = PartnerSidebarMenu.penawaranAktif;
            });
          },
          onBack: () {
            setState(() {
              selectedMenu = PartnerSidebarMenu.cariPekerjaan;
            });
          },
        );
      case PartnerSidebarMenu.penawaranAktif:
        return const ActiveOfferScreen();

      case PartnerSidebarMenu.pengaturan:
        return PartnerSettingScreen(
          onProfileUpdate: () {
            setState(() {});
          },
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          PartnerSidebar(
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