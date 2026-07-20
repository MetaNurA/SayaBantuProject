import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/partner_sidebar_menu.dart';

class PartnerSidebar extends StatefulWidget {
  final PartnerSidebarMenu activeMenu;
  final Function(PartnerSidebarMenu) onMenuSelected;

  const PartnerSidebar({
    super.key,
    required this.activeMenu,
    required this.onMenuSelected,
  });

  @override
  State<PartnerSidebar> createState() => _PartnerSidebarState();
}

class _PartnerSidebarState extends State<PartnerSidebar> {
  String username = "Partner";

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      username = prefs.getString("name") ?? "Partner";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: const Color(0xff111827),
      child: Column(
        children: [
          const SizedBox(height: 25),

Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Row(
    children: [
      const CircleAvatar(
        radius: 28,
        backgroundColor: Colors.orange,
        child: Text(
          "EP",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      const SizedBox(width: 12),

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            username,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 3),
          Text(
            "Mitra Aktif",
            style: TextStyle(
              color: Colors.white60,
              fontSize: 13,
            ),
          ),
        ],
      ),
    ],
  ),
),

const SizedBox(height: 20),

Container(
  margin: const EdgeInsets.symmetric(horizontal: 18),
  padding: const EdgeInsets.all(15),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    gradient: const LinearGradient(
      colors: [
        Color(0xffFF8A00),
        Color(0xffF97316),
      ],
    ),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Text(
        "TOTAL POIN SAYA",
        style: TextStyle(
          color: Colors.white70,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),

      SizedBox(height: 10),

      Row(
        children: [

          Icon(
            Icons.emoji_events,
            color: Colors.amber,
            size: 34,
          ),

          SizedBox(width: 10),

              Text(
                "182",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 34,
                ),
              ),
            ],
          ),

              SizedBox(height: 8),

              Text(
                "Peringkat ke-47 dari 1.240 mitra",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),

          const SizedBox(height: 12),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 18),
            padding: const EdgeInsets.symmetric(
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: const Color(0xffE8F7EE),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 18,
                ),

                SizedBox(width: 6),

                Text(
                  "Akun Terverifikasi",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),
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
    final bool active = widget.activeMenu == menu;

    return InkWell(
      onTap: () => widget.onMenuSelected(menu),
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