import 'package:flutter/material.dart';

import '../../models/sidebar_menu.dart';
import '../../widgets/customer_sidebar.dart';

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

  Widget currentPage() {
    switch (selectedMenu) {
      case SidebarMenu.beranda:
        return const CustomerDashboard();

      case SidebarMenu.notifikasi:
        return  NotificationScreen();

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