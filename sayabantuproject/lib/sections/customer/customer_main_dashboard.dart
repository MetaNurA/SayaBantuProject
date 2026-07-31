import 'package:flutter/material.dart';

import '../../../models/sidebar_menu.dart';
import '../../../widgets/customer_sidebar.dart';

import '../../models/job_model.dart';
import '../../models/offer_model.dart';
import '../../data/job_data.dart';
import '../../data/active_offer_data.dart';

import '../../screens/Screens_Customer/offer_screen.dart';
import '../../screens/Screens_Customer/partner_profile_screen.dart';

import 'customer_dashboard.dart';
import 'notification_screen.dart';
import 'setting_screen.dart';

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
  OfferModel? selectedOffer;


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

          onFinish: (job) {
            setState(() {

            //status pekerjaan pelanggan
              job.status = "Selesai";
              job.completedDate = "Hari Ini";

            //status penawaran mitra 
              for (var activeOffer in activeOffers) {
                if (activeOffer.job.title == job.title) {
                  activeOffer.status = "Selesai";
                }
              }
            });

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("${job.title} selesai dikerjakan."),
              ),
            );
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

          onOpenProfile: (offer) {
            setState(() {
              selectedOffer = offer;
              selectedMenu = SidebarMenu.profilMitra;
            });
          },

          onAccept: (offer) {
            setState(() {
              selectedJob!.status = "Sedang Dikerjakan";

              selectedJob!.partnerName = offer.name;
              selectedJob!.acceptedPrice = offer.price;
                for (var activeOffer in activeOffers) {
                  if (activeOffer.job.title == selectedJob!.title &&
                      activeOffer.price == offer.price) {
                    activeOffer.status = "Sedang Dikerjakan";
                  } else if (activeOffer.job.title == selectedJob!.title) {
                    activeOffer.status = "Ditolak";
                  }
                }

              selectedMenu = SidebarMenu.beranda;
            });
          },

          onReject: (offer) {
            setState(() {
              for (var activeOffer in activeOffers) {
                if (activeOffer.job.title == selectedJob!.title &&
                    activeOffer.price == offer.price) {
                  activeOffer.status = "Ditolak";
                }
              }
              selectedJob!.offers.remove(offer);
              selectedJob!.bidderCount = selectedJob!.offers.length;
            });

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Penawaran ${offer.name} berhasil ditolak.",
                ),
              ),
            );
          },
        );

      case SidebarMenu.profilMitra:
        return PartnerProfileScreen(
          offer: selectedOffer!,
          onFinish: () {
            setState(() {
              selectedMenu = SidebarMenu.penawaran;
            });
          },
        );

      case SidebarMenu.notifikasi:
        return NotificationScreen();

     case SidebarMenu.pengaturan:
        return CustomerSettingScreen(
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