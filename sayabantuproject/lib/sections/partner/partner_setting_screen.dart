import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import '../../screens/Screens_auth/login_page.dart';

class PartnerSettingScreen extends StatefulWidget {
  final VoidCallback onProfileUpdate;

  const PartnerSettingScreen({
    super.key,
    required this.onProfileUpdate,
    });

  @override
  State<PartnerSettingScreen> createState() =>
      _PartnerSettingScreenState();
}

class _PartnerSettingScreenState
    extends State<PartnerSettingScreen> {
  bool jobNotification = true;

  String name = "";
  String email = "";
  String phone = "";
  String address = "";

  Uint8List? profileImage;

  final ImagePicker picker = ImagePicker();

  @override
    void initState() {
      super.initState();
      loadProfile();
    }


Future<void> loadProfile() async {
  final prefs = await SharedPreferences.getInstance();

  setState(() {
  name = prefs.getString("name") ?? "";
  email = prefs.getString("email") ?? "";
  phone = prefs.getString("phone") ?? "";
  address = prefs.getString("address") ?? "";

  jobNotification =
      prefs.getBool("job_notification") ?? true;

  final image = prefs.getString("profile_image");

  if (image != null) {
    profileImage = base64Decode(image);
  }
  });
}
Future<void> pickProfileImage() async {
  final XFile? file = await picker.pickImage(
    source: ImageSource.gallery,
  );

  if (file == null) return;

  final bytes = await file.readAsBytes();

  final prefs = await SharedPreferences.getInstance();

  await prefs.setString(
    "profile_image",
    base64Encode(bytes),
  );

  setState(() {
    profileImage = bytes;
  });

  widget.onProfileUpdate();
}
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pengaturan",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Kelola profil, notifikasi, dan keamanan akun.",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 35),

            /// =========================
            /// HEADER PROFIL
            /// =========================
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 55,
                        backgroundColor: const Color(0xffFFF3E8),
                        backgroundImage:
                            profileImage != null
                                ? MemoryImage(profileImage!)
                                : null,
                        child: profileImage == null
                            ? const Icon(
                                Icons.person,
                                size: 60,
                                color: Color(0xffF97316),
                              )
                            : null,
                      ),

                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                            onTap: pickProfileImage,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffF97316),
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(7),
                              child: const Icon(
                                Icons.camera_alt,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    email,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: 170,
                    height: 45,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        final nameController = TextEditingController(text: name);
                        final emailController = TextEditingController(text: email);
                        final phoneController = TextEditingController(text: phone);
                        final addressController = TextEditingController(text: address);

                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Edit Profil"),
                              content: SizedBox(
                                width: 450,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [

                                      TextField(
                                        controller: nameController,
                                        decoration: const InputDecoration(
                                          labelText: "Nama",
                                          prefixIcon: Icon(Icons.person_outline),
                                        ),
                                      ),

                                      const SizedBox(height: 15),

                                      TextField(
                                        controller: emailController,
                                        decoration: const InputDecoration(
                                          labelText: "Email",
                                          prefixIcon: Icon(Icons.email_outlined),
                                        ),
                                      ),

                                      const SizedBox(height: 15),

                                      TextField(
                                        controller: phoneController,
                                        decoration: const InputDecoration(
                                          labelText: "Nomor HP",
                                          prefixIcon: Icon(Icons.phone_outlined),
                                        ),
                                      ),

                                      const SizedBox(height: 15),

                                      TextField(
                                        controller: addressController,
                                        maxLines: 2,
                                        decoration: const InputDecoration(
                                          labelText: "Alamat",
                                          prefixIcon: Icon(Icons.location_on_outlined),
                                        ),
                                      ),
                                    ],
                                  ),
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
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xffF97316),
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () async {
                                    final prefs =
                                        await SharedPreferences.getInstance();

                                    await prefs.setString(
                                        "name", nameController.text);

                                    await prefs.setString(
                                        "email", emailController.text);

                                    await prefs.setString(
                                        "phone", phoneController.text);

                                    await prefs.setString(
                                        "address", addressController.text);

                                    Navigator.pop(context);

                                    await loadProfile();
                                    
                                    widget.onProfileUpdate();

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text("Profil berhasil diperbarui."),
                                      ),
                                    );
                                  },
                                  child: const Text("Simpan"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.edit),
                      label: const Text("Edit Profil"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffF97316),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            /// =========================
            /// INFORMASI AKUN
            /// =========================

            const Text(
              "Informasi Akun",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 15),

            _buildCard(
              icon: Icons.person_outline,
              title: "Nama",
              subtitle: name,
            ),

            _buildCard(
              icon: Icons.email_outlined,
              title: "Email",
              subtitle: email,
            ),

            _buildCard(
              icon: Icons.phone_outlined,
              title: "Nomor HP",
              subtitle: phone.isEmpty ? "-" : phone,
            ),

            _buildCard(
              icon: Icons.location_on_outlined,
              title: "Alamat",
              subtitle: address.isEmpty ? "-" : address,
            ),

            const SizedBox(height: 35),

            /// =========================
            /// NOTIFIKASI
            /// =========================

            const Text(
              "Notifikasi",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 15),

            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(16),
                side: const BorderSide(
                  color: Color(0xffE5E7EB),
                ),
              ),
              child: SwitchListTile(
                value: jobNotification,
                activeColor: const Color(0xffF97316),
                secondary: const Icon(
                  Icons.notifications_active_outlined,
                  color: Color(0xffF97316),
                ),
                title: const Text(
                  "Notifikasi Pekerjaan Baru",
                ),
                subtitle: const Text(
                  "Terima notifikasi saat ada pekerjaan baru.",
                ),
                onChanged: (value) async {
                  final prefs = await SharedPreferences.getInstance();

                  await prefs.setBool(
                    "job_notification",
                    value,
                  );

                  setState(() {
                    jobNotification = value;
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        value
                            ? "Notifikasi pekerjaan diaktifkan"
                            : "Notifikasi pekerjaan dinonaktifkan",
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 35),

            /// =========================
            /// KEAMANAN
            /// =========================

            const Text(
              "Keamanan",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 15),

            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(16),
                side: const BorderSide(
                  color: Color(0xffE5E7EB),
                ),
              ),
              child: Column(
                children: [

                  ListTile(
                    leading: const Icon(
                      Icons.lock_outline,
                      color: Color(0xffF97316),
                    ),
                    title:
                        const Text("Ganti Password"),
                    trailing: const Icon(
                        Icons.chevron_right),
                    onTap: () {
                      final oldPasswordController = TextEditingController();
                      final newPasswordController = TextEditingController();
                      final confirmPasswordController = TextEditingController();

                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: const Text("Ganti Password"),
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
                                      prefixIcon: Icon(Icons.lock_outline),
                                    ),
                                  ),

                                  const SizedBox(height: 15),

                                  TextField(
                                    controller: newPasswordController,
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      labelText: "Password Baru",
                                      prefixIcon: Icon(Icons.lock),
                                    ),
                                  ),

                                  const SizedBox(height: 15),

                                  TextField(
                                    controller: confirmPasswordController,
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      labelText: "Konfirmasi Password",
                                      prefixIcon: Icon(Icons.lock_reset),
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
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffF97316),
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: () async {

                                  final prefs =
                                      await SharedPreferences.getInstance();

                                  final currentPassword =
                                      prefs.getString("password") ?? "";

                                  if (oldPasswordController.text !=
                                      currentPassword) {

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Password lama salah"),
                                      ),
                                    );
                                    return;
                                  }

                                  if (newPasswordController.text !=
                                      confirmPasswordController.text) {

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text("Konfirmasi password tidak sesuai"),
                                      ),
                                    );
                                    return;
                                  }

                                  if (newPasswordController.text.length < 6) {

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "Password minimal 6 karakter",
                                        ),
                                      ),
                                    );
                                    return;
                                  }

                                  await prefs.setString(
                                    "password",
                                    newPasswordController.text,
                                  );

                                  if (!context.mounted) return;

                                  Navigator.pop(context);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Password berhasil diperbarui",
                                      ),
                                    ),
                                  );
                                },
                                child: const Text("Simpan"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),

                  const Divider(height: 1),

                  ListTile(
                    leading: const Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    title: const Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: const Icon(
                        Icons.chevron_right),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title:
                              const Text("Logout"),
                          content: const Text(
                            "Apakah Anda yakin ingin keluar dari akun ini?",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(
                                    context);
                              },
                              child:
                                  const Text("Batal"),
                            ),

                            ElevatedButton(
                              style:
                                  ElevatedButton
                                      .styleFrom(
                                backgroundColor:
                                    Colors.red,
                                foregroundColor:
                                    Colors.white,
                              ),
                              onPressed: () async {
                                final prefs = await SharedPreferences.getInstance();

                                await prefs.setBool("isLoggedIn", false);

                                if (!context.mounted) return;

                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const LoginScreen(),
                                  ),
                                  (route) => false,
                                );
                              },
                              child:
                                  const Text("Logout"),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(16),
          side: const BorderSide(
            color: Color(0xffE5E7EB),
          ),
        ),
        child: ListTile(
          leading: Icon(
            icon,
            color: const Color(0xffF97316),
          ),
          title: Text(title),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}