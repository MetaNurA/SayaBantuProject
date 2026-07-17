import 'package:flutter/material.dart';

import '../models/partner_sidebar_menu.dart';

class PartnerSidebar extends StatelessWidget {
  final PartnerSidebarMenu activeMenu;
  final Function(PartnerSidebarMenu) onMenuSelected;

  const PartnerSidebar({
    super.key,
    required this.activeMenu,
    required this.onMenuSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: const Color(0xff111827),
      child: Column(
        children: [
          const SizedBox(height: 40),

          const CircleAvatar(
            radius: 35,
            backgroundColor: Colors.orange,
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 35,
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            "Partner",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 40),

          _menu(
            context,
            icon: Icons.home_outlined,
            title: "Cari Pekerjaan",
            menu: PartnerSidebarMenu.cariPekerjaan,
          ),

          _menu(
            context,
            icon: Icons.assignment_outlined,
            title: "Penawaran Aktif",
            menu: PartnerSidebarMenu.penawaranAktif,
          ),

          _menu(
            context,
            icon: Icons.attach_money,
            title: "Riwayat Penghasilan",
            menu: PartnerSidebarMenu.riwayatPenghasilan,
          ),

          _menu(
            context,
            icon: Icons.person_outline,
            title: "Profil Saya",
            menu: PartnerSidebarMenu.profil,
          ),

          _menu(
            context,
            icon: Icons.settings_outlined,
            title: "Pengaturan",
            menu: PartnerSidebarMenu.pengaturan,
          ),
        ],
      ),
    );
  }

  Widget _menu(
    BuildContext context, {
    required IconData icon,
    required String title,
    required PartnerSidebarMenu menu,
  }) {
    final bool active = activeMenu == menu;

    return InkWell(
      onTap: () => onMenuSelected(menu),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        color: active
            ? Colors.orange.withOpacity(0.2)
            : Colors.transparent,
        child: Row(
          children: [
            Icon(
              icon,
              color: active ? Colors.orange : Colors.white70,
            ),
            const SizedBox(width: 15),
            Text(
              title,
              style: TextStyle(
                color: active ? Colors.orange : Colors.white,
                fontWeight:
                    active ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}