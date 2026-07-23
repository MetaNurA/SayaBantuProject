import 'package:flutter/material.dart';

import '../../models/partner_sidebar_menu.dart';
import '../../models/partner_job_model.dart';

import '../../widgets/partner_sidebar.dart';

import '../../sections/partner/partner_dashboard.dart';
import '../../sections/partner/active_offer_screen.dart';
import '../../sections/partner/income_screen.dart';
import '../../sections/partner/partner_profile_section.dart';
import '../../sections/partner/partner_setting_screen.dart';
import '../../sections/partner/offer_job_screen.dart';

class PartnerMainDashboard extends StatefulWidget {
  const PartnerMainDashboard({super.key});

  @override
  State<PartnerMainDashboard> createState() =>
      _PartnerMainDashboardState();
}

class _PartnerMainDashboardState extends State<PartnerMainDashboard> {

  PartnerSidebarMenu selectedMenu =
      PartnerSidebarMenu.cariPekerjaan;

  PartnerJobModel? selectedJob;

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
        );

      case PartnerSidebarMenu.penawaranAktif:
        return const ActiveOfferScreen();

      case PartnerSidebarMenu.riwayatPenghasilan:
        return const IncomeScreen();

      case PartnerSidebarMenu.profil:
        return const PartnerProfileSection();

      case PartnerSidebarMenu.pengaturan:
        return const PartnerSettingScreen();
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