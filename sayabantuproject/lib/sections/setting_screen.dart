import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/auth/login_page.dart';

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
  Future<void> _showChangePasswordDialog() async {
    final oldPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Ubah Password"),
          content: SizedBox(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: oldPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password Lama",
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: newPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password Baru",
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Konfirmasi Password",
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Batal"),
            ),

            ElevatedButton(
              onPressed: () async {
                final prefs =
                    await SharedPreferences.getInstance();

                final currentPassword =
                    prefs.getString("password") ?? "";

                if (oldPasswordController.text != currentPassword) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Password lama salah"),
                    ),
                  );
                  return;
                }

                if (newPasswordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Password baru tidak boleh kosong"),
                    ),
                  );
                  return;
                }

                if (newPasswordController.text !=
                    confirmPasswordController.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Konfirmasi password tidak sama"),
                    ),
                  );
                  return;
                }

                await prefs.setString(
                  "password",
                  newPasswordController.text,
                );

                if (!mounted) return;

                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Password berhasil diubah"),
                  ),
                );
              },
              child: const Text("Simpan"),
            ),
          ],
        );
      },
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
  return Container(
    color: const Color(0xffF4F7FB),
    padding: const EdgeInsets.all(30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Pengaturan",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 30),

        Expanded(
          child: ListView(
            children: [
              settingTile(
                icon: Icons.person,
                title: name,
                subtitle: "$email\n$role",
              ),

              settingTile(
                icon: Icons.lock_outline,
                title: "Ubah Password",
                subtitle: "Ganti password akun Anda",
                onTap: _showChangePasswordDialog,
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
      ],
    ),
  );
}
}