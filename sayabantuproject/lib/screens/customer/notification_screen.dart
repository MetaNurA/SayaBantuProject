import 'package:flutter/material.dart';

import '../../models/notification_model.dart';
import '../../widgets/customer_sidebar.dart';
import '../../widgets/dashboard_header.dart';
import '../../widgets/notification_card.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final List<NotificationModel> notifications = [
    NotificationModel(
      title: "Penawaran Baru",
      message: "Budi Teknik AC mengirim penawaran untuk pekerjaan Anda.",
      time: "2 menit lalu",
      type: "offer",
    ),
    NotificationModel(
      title: "Pekerjaan Diproses",
      message: "Andi Service mulai mengerjakan pekerjaan Anda.",
      time: "1 jam lalu",
      type: "progress",
    ),
    NotificationModel(
      title: "Pekerjaan Selesai",
      message: "Service AC Bocor telah selesai.",
      time: "Kemarin",
      type: "done",
    ),
    NotificationModel(
      title: "Selamat Datang",
      message: "Terima kasih telah bergabung di SayaBantu.",
      time: "3 hari lalu",
      type: "system",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F7FB),
      body: Row(
        children: [
          const CustomerSidebar(
            activeMenu:"Notifikasi",
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
                    "Notifikasi",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Semua aktivitas terbaru akan muncul di sini.",
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 30),

                  Expanded(
                    child: ListView.separated(
                      itemCount: notifications.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        return NotificationCard(
                          notification: notifications[index],
                        );
                      },
                    ),
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