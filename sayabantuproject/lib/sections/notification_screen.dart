import 'package:flutter/material.dart';

import '../models/notification_model.dart';
import '../models/sidebar_menu.dart';

import '../widgets/customer_sidebar.dart';
import '../widgets/page_header.dart';
import '../widgets/notification_card.dart';

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
    return Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const PageHeader(
                    title: "Notifikasi",
                    subtitle: "Semua aktivitas terbaru akan muncul di sini.",
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