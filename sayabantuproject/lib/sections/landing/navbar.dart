import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../widgets/custom_button.dart';
import '../../screens/Screens_auth/login_page.dart';
import '../../screens/Screens_auth/register_page.dart';


class CustomNavbar extends StatelessWidget {
  final VoidCallback onLayanan;
  final VoidCallback onCaraKerja;
  final VoidCallback onMitra;
  final VoidCallback onTentang;

  const CustomNavbar({
    super.key,
    required this.onLayanan,
    required this.onCaraKerja,
    required this.onMitra,
    required this.onTentang,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Theme.of(context).cardColor,
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1400),
          child: Row(
            children: [
              /// Logo
              Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.handyman,
                      color: Color(0xFFF97316),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    "SayaBantu.Com",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                ],
              ),

              const Spacer(),

              _menu(
                "Layanan",
                onTap : onLayanan,
                ),
              _menu(
                "Cara Kerja",
                onTap : onCaraKerja,
                ),
              _menu(
                "Jadi Mitra",
                onTap : onMitra,
                ),
              _menu(
                "Tentang Kami",
                onTap : onTentang,
                ),

              const SizedBox(width: 60),

              /// Tombol Masuk
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LoginScreen(),
                    ),
                  );
                },
                child: const Text("Masuk"),
              ),

              const SizedBox(width: 15),

              /// Tombol Daftar
              CustomButton(
                text: "Daftar Gratis",
                width: 160,
                height: 50,
                backgroundColor: AppColors.primary,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RegisterScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menu(
      String title, {
      required VoidCallback onTap,
    }) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
        ),
      );
    }
}