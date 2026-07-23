import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState
    extends State<ChangePasswordScreen> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool hideOld = true;
  bool hideNew = true;
  bool hideConfirm = true;

  Future<void> changePassword() async {
    final prefs = await SharedPreferences.getInstance();

    String savedPassword =
        prefs.getString("password") ?? "";

    if (oldPasswordController.text != savedPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password lama salah."),
        ),
      );
      return;
    }

    if (newPasswordController.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text("Password minimal 6 karakter."),
        ),
      );
      return;
    }

    if (newPasswordController.text !=
        confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text("Konfirmasi password tidak sama."),
        ),
      );
      return;
    }

    await prefs.setString(
      "password",
      newPasswordController.text,
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content:
            Text("Password berhasil diubah."),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ubah Password"),
      ),
      body: Center(
        child: SizedBox(
          width: 450,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [

                TextField(
                  controller: oldPasswordController,
                  obscureText: hideOld,
                  decoration: InputDecoration(
                    labelText: "Password Lama",
                    suffixIcon: IconButton(
                      icon: Icon(hideOld
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          hideOld = !hideOld;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: newPasswordController,
                  obscureText: hideNew,
                  decoration: InputDecoration(
                    labelText: "Password Baru",
                    suffixIcon: IconButton(
                      icon: Icon(hideNew
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          hideNew = !hideNew;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller:
                      confirmPasswordController,
                  obscureText: hideConfirm,
                  decoration: InputDecoration(
                    labelText:
                        "Konfirmasi Password Baru",
                    suffixIcon: IconButton(
                      icon: Icon(hideConfirm
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          hideConfirm = !hideConfirm;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: changePassword,
                    child: const Text(
                        "Simpan Password"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}