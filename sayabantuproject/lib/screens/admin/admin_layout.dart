import 'package:flutter/material.dart';

import 'admin_verification_screen.dart';
import 'admin_moderation_screen.dart';
import 'admin_daily_report_screen.dart';
import 'admin_profile_screen.dart';

class AdminLayout extends StatefulWidget {
  final String activeMenu;

  const AdminLayout({
    super.key,
    this.activeMenu = 'verification',
  });

  @override
  State<AdminLayout> createState() => _AdminLayoutState();
}

class _AdminLayoutState extends State<AdminLayout> {
  late String activeMenu;

  @override
  void initState() {
    super.initState();
    activeMenu = widget.activeMenu;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isMobile = screenWidth < 700;
    final isTablet =
        screenWidth >= 700 && screenWidth < 1100;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FB),

      // =====================================================
      // MOBILE DRAWER
      // =====================================================

      drawer: isMobile
          ? Drawer(
              width: 270,
              child: SafeArea(
                child: _buildSidebar(context),
              ),
            )
          : null,

      // =====================================================
      // MOBILE APP BAR
      // =====================================================

      appBar: isMobile
          ? AppBar(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              elevation: 0,
              leading: Builder(
                builder: (context) {
                  return IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: Color(0xFF334155),
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
              title: const Text(
                'Admin Operator',
                style: TextStyle(
                  color: Color(0xFF111827),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          : null,

      // =====================================================
      // BODY
      // =====================================================

      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // SIDEBAR DESKTOP / TABLET
          if (!isMobile)
            SizedBox(
              width: isTablet ? 210 : 230,
              child: _buildSidebar(context),
            ),

          // CONTENT
          Expanded(
            child: _buildCurrentPage(
              context,
              isMobile,
              isTablet,
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // CURRENT PAGE
  // =========================================================

  Widget _buildCurrentPage(
    BuildContext context,
    bool isMobile,
    bool isTablet,
  ) {
    switch (activeMenu) {
      case 'verification':
        return const AdminVerificationScreen();

      case 'moderation':
        return const AdminModerationScreen();

      case 'report':
        return const AdminDailyReportScreen();

      case 'profile':
        return const AdminProfileScreen();

      default:
        return const AdminVerificationScreen();
    }
  }

  // =========================================================
  // SIDEBAR
  // =========================================================

  Widget _buildSidebar(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 20),

          // =================================================
          // PROFILE ADMIN
          // =================================================

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xFF8B5CF6),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.shield_outlined,
                    color: Colors.white,
                    size: 21,
                  ),
                ),

                const SizedBox(width: 10),

                const Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Admin Operator',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF111827),
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'Level: Admin Harian',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // =================================================
          // VERIFIKASI MITRA
          // =================================================

          _menuItem(
            context: context,
            icon: Icons.verified_outlined,
            title: 'Verifikasi Mitra',
            badge: '3',
            active: activeMenu == 'verification',
            onTap: () {
              _changePage(context, 'verification');
            },
          ),

          // =================================================
          // MODERASI KONTEN
          // =================================================

          _menuItem(
            context: context,
            icon: Icons.flag_outlined,
            title: 'Moderasi Konten',
            badge: '2',
            active: activeMenu == 'moderation',
            onTap: () {
              _changePage(context, 'moderation');
            },
          ),

          // =================================================
          // LAPORAN HARIAN
          // =================================================

          _menuItem(
            context: context,
            icon: Icons.bar_chart_outlined,
            title: 'Laporan Harian',
            active: activeMenu == 'report',
            onTap: () {
              _changePage(context, 'report');
            },
          ),

          // =================================================
          // PROFIL ADMIN
          // =================================================

          _menuItem(
            context: context,
            icon: Icons.person_outline,
            title: 'Profil Admin',
            active: activeMenu == 'profile',
            onTap: () {
              _changePage(context, 'profile');
            },
          ),

          const Spacer(),

          // =================================================
          // IMAGE PLACEHOLDER
          // =================================================

          Padding(
            padding: const EdgeInsets.fromLTRB(
              16,
              0,
              16,
              20,
            ),
            child: Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFE2E8F0),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.image_outlined,
                color: Color(0xFF94A3B8),
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // CHANGE PAGE
  // =========================================================

  void _changePage(
    BuildContext context,
    String menu,
  ) {
    setState(() {
      activeMenu = menu;
    });

    // Kalau mobile, tutup drawer setelah memilih menu.
    if (MediaQuery.of(context).size.width < 700) {
      Navigator.of(context).pop();
    }
  }

  // =========================================================
  // MENU ITEM
  // =========================================================

  Widget _menuItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required bool active,
    required VoidCallback onTap,
    String? badge,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 46,
        padding: const EdgeInsets.symmetric(
          horizontal: 17,
        ),
        decoration: BoxDecoration(
          color: active
              ? const Color(0xFFF3E8FF)
              : Colors.transparent,
          border: active
              ? const Border(
                  right: BorderSide(
                    color: Color(0xFF8B5CF6),
                    width: 3,
                  ),
                )
              : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 18,
              color: active
                  ? const Color(0xFF7C3AED)
                  : const Color(0xFF475569),
            ),

            const SizedBox(width: 11),

            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: active
                      ? FontWeight.w600
                      : FontWeight.w400,
                  color: active
                      ? const Color(0xFF7C3AED)
                      : const Color(0xFF475569),
                ),
              ),
            ),

            if (badge != null)
              Container(
                width: 19,
                height: 19,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color(0xFFEF4444),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  badge,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}