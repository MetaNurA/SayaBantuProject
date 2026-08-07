import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme/app_colors.dart';
import '../../widgets/custom_button.dart';
import 'register_page.dart';
import '../../sections/customer/customer_main_dashboard.dart';
import '../Screens_Partner/partner_main_dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController =
      TextEditingController();

  final TextEditingController _passwordController =
      TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    final prefs = await SharedPreferences.getInstance();

    final email = prefs.getString("email");
    final password = prefs.getString("password");
    final role = prefs.getString("role");

    if (_emailController.text.trim() == email &&
        _passwordController.text.trim() == password) {
      await prefs.setBool("isLoggedIn", true);

      if (role == "Pelanggan") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const CustomerMainDashboard(),
          ),
        );
      } else if (role == "Mitra") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const PartnerMainDashboard(),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email atau Password salah"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;

        return Scaffold(
          backgroundColor: const Color(0xffF8FAFC),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Container(
                  width: isMobile
                      ? constraints.maxWidth * 0.9
                      : 450,
                  padding: EdgeInsets.all(
                    isMobile ? 24 : 35,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 25,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [

                      // Logo & Judul
                      Center(
                        child: Column(
                          children: [
                            Container(
                              width: isMobile ? 60 : 75,
                              height: isMobile ? 60 : 75,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius:
                                    BorderRadius.circular(18),
                              ),
                              child: Icon(
                                Icons.lock_open_rounded,
                                color: const Color(0xFFF97316),
                                size: isMobile ? 30 : 38,
                              ),
                            ),

                            const SizedBox(height: 20),

                            Text(
                              "Masuk",
                              style: TextStyle(
                                fontSize:
                                    isMobile ? 24 : 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              "Selamat datang kembali di SayaBantu",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize:
                                    isMobile ? 13 : 14,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                          height: isMobile ? 28 : 35),

                      const Text(
                        "Email",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 8),

                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: "Masukkan email",
                          prefixIcon:
                              const Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(14),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Password",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 8),

                      TextField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          hintText: "Masukkan password",
                          prefixIcon:
                              const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscurePassword =
                                    !_obscurePassword;
                              });
                            },
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(14),
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Lupa Password?",
                            style: TextStyle(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          text: "Masuk",
                          width: double.infinity,
                          height: 56,
                          backgroundColor:
                              AppColors.primary,
                          onPressed: _handleLogin,
                        ),
                      ),

                      const SizedBox(height: 25),

                      Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment:
                            WrapCrossAlignment.center,
                        children: [
                          const Text("Belum punya akun?"),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacement(
                                PageRouteBuilder(
                                  pageBuilder:
                                      (_, __, ___) =>
                                          const RegisterScreen(),
                                  transitionDuration:
                                      Duration.zero,
                                  reverseTransitionDuration:
                                      Duration.zero,
                                ),
                              );
                            },
                            child: Text(
                              "Daftar",
                              style: TextStyle(
                                color: AppColors.primary,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}