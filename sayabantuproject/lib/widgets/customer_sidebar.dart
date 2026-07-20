import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/sidebar_menu.dart';

class CustomerSidebar extends StatefulWidget {
  final SidebarMenu activeMenu;
  final Function(SidebarMenu) onMenuSelected;

  const CustomerSidebar({
    super.key,
    required this.activeMenu,
    required this.onMenuSelected,
  });

  @override
  State<CustomerSidebar> createState() => _CustomerSidebarState();
}

class _CustomerSidebarState extends State<CustomerSidebar> {
  String name = "Pengguna";
  String role = "Pelanggan";

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      name = prefs.getString("name") ?? "Pengguna";
      role = prefs.getString("role") ?? "Pelanggan";
    });
  }

  String getInitials(String text) {
    final words = text.trim().split(" ");

    if (words.isEmpty || words.first.isEmpty) {
      return "P";
    }

    if (words.length == 1) {
      return words.first[0].toUpperCase();
    }

    return (words[0][0] + words[1][0]).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          const SizedBox(height: 30),

          // ================= PROFILE =================

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: const Color(0xff2196F3),
                  child: Text(
                    getInitials(name),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),

                      const SizedBox(height: 3),

                      Text(
                        role,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),
          const Divider(),
          const SizedBox(height: 12),

          _menu(
            context,
            icon: Icons.home_outlined,
            title: "Beranda",
            menu: SidebarMenu.beranda,
          ),
          _menu(
            context,
            icon: Icons.home_outlined,
            title: "Notifikasi",
            menu: SidebarMenu.notifikasi,
          ),

          _menu(
            context,
            icon: Icons.settings_outlined,
            title: "Pengaturan",
            menu: SidebarMenu.pengaturan,
          ),
          const Spacer(),

          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              "SayaBantu v1.0",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _menu(
      BuildContext context, {
      required IconData icon,
      required String title,
      required SidebarMenu menu,
    }) {
    final bool active = widget.activeMenu == menu;

    return InkWell(
      onTap: () {
        if (!active) {
          widget.onMenuSelected(menu);
        }
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 56,
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 3,
        ),
        decoration: BoxDecoration(
          color: active
              ? Theme.of(context).colorScheme.primary.withOpacity(0.12)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const SizedBox(width: 16),

            Icon(
              icon,
              color: active
               ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurfaceVariant,
            ),

            const SizedBox(width: 15),

            Text(
              title,
              style: TextStyle(
                color: active
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurface,
                fontWeight:
                    active ? FontWeight.bold : FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}