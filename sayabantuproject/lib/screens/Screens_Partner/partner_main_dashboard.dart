import 'package:flutter/material.dart';

import '../../models/partner_sidebar_menu.dart';
import '../../models/job_model.dart';
import '../../widgets/partner_sidebar.dart';

import '../../sections/partner/partner_dashboard.dart';
import '../../sections/partner/active_offer_screen.dart';
import '../../sections/partner/partner_setting_screen.dart';
import '../../sections/partner/offer_job_screen.dart';

class PartnerMainDashboard extends StatefulWidget {
  const PartnerMainDashboard({super.key});

  @override
  State<PartnerMainDashboard> createState() =>
      _PartnerMainDashboardState();
}

class _PartnerMainDashboardState
    extends State<PartnerMainDashboard> {

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
        if (selectedJob == null) {
          return const SizedBox.shrink();
        }

        return OfferJobScreen(
          job: selectedJob!,
          onSubmit: () {
            setState(() {
              selectedMenu =
                  PartnerSidebarMenu.penawaranAktif;
            });
          },
          onBack: () {
            setState(() {
              selectedMenu =
                  PartnerSidebarMenu.cariPekerjaan;
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

  void _selectMenu(
    PartnerSidebarMenu menu,
    BuildContext context,
  ) {
    setState(() {
      selectedMenu = menu;
    });

    // Tutup Drawer jika sedang berada di mobile.
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;

        return Scaffold(
          drawer: isMobile
              ? Drawer(
                  width: 280,
                  child: SafeArea(
                    child: PartnerSidebar(
                      activeMenu: selectedMenu,
                      onMenuSelected: (menu) {
                        _selectMenu(menu, context);
                      },
                    ),
                  ),
                )
              : null,

          appBar: isMobile
              ? AppBar(
                  title: const Text(
                    "SayaBantu",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor:
                      Theme.of(context).scaffoldBackgroundColor,
                  foregroundColor:
                      Theme.of(context).textTheme.bodyLarge?.color,
                  surfaceTintColor: Colors.transparent,
                  elevation: 0,
                )
              : null,

          body: Row(
            children: [
              if (!isMobile)
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
      },
    );
  }
}