import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/login_page.dart';
import '../widgets/customer_sidebar.dart';
import '../widgets/dashboard_header.dart';
import '../screens/customer/change_password_screen.dart';

class SettingScreen extends StatefulWidget {

  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String name = "Pengguna";
  String email = "-";
  String role = "Pelanggan";

  bool notification = true;
  bool darkMode = false;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      name = prefs.getString("name") ?? "Pengguna";
      email = prefs.getString("email") ?? "-";
      role = prefs.getString("role") ?? "Pelanggan";
    });
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool("isLoggedIn", false);

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      ),
    );
  }

  Widget settingTile({
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: const Color(0xffF97316),
        ),
        title: Text(title),
        subtitle: subtitle == null ? null : Text(subtitle),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F7FB),
      body: Row(
        children: [
          const CustomerSidebar(
            activeMenu: "Pengaturan",
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DashboardHeader(),

                  const SizedBox(height: 30),

                  const Text(
                    "Pengaturan",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),

                  settingTile(
                    icon: Icons.person,
                    title: name,
                    subtitle: "$email\n$role",
                  ),

                  settingTile(
                    icon: Icons.lock_outline,
                    title: "Ubah Password",
                    subtitle: "Ganti password akun Anda",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ChangePasswordScreen(),
                        ),
                      );
                    },
                  ),

                  settingTile(
                    icon: Icons.notifications_none,
                    title: "Notifikasi",
                    trailing: Switch(
                      value: notification,
                      onChanged: (value) {
                        setState(() {
                          notification = value;
                        });
                      },
                    ),
                  ),

                  settingTile(
                    icon: Icons.logout,
                    title: "Logout",
                    onTap: () async {
                      final result = await showDialog<bool>(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text("Logout"),
                          content: const Text(
                            "Apakah Anda yakin ingin keluar?",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(context, false),
                              child: const Text("Batal"),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              onPressed: () =>
                                  Navigator.pop(context, true),
                              child: const Text(
                                "Logout",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      );

                      if (result == true) {
                        logout();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// bagian yang belum bisa ubah password 
// notifikasi belum tau mau dibawa kemana
// tema modenya juga belum bisa berfungsi 