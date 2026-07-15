import 'package:flutter/material.dart';
import '../screens/customer/posting_jasa_dialog.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Judul
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pekerjaan Saya",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1E293B),
                ),
              ),

              SizedBox(height: 8),

              Text(
                "Pantau status semua jasa yang kamu posting",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),

        ElevatedButton.icon(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => const PostingJasaDialog(),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffF97316),
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 18,
            ),
          ),
          icon: const Icon(Icons.add),
          label: const Text(
            "Posting Jasa Baru",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}