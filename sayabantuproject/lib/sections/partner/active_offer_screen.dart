import 'package:flutter/material.dart';

import '../../data/active_offer_data.dart';
import '../../widgets/active_offer_card.dart';

class ActiveOfferScreen extends StatelessWidget {
  const ActiveOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1000;

        final padding = isMobile
            ? 16.0
            : isTablet
                ? 24.0
                : 35.0;

        return Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Penawaran Aktif Saya",
                style: TextStyle(
                  fontSize: isMobile ? 27 : 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Seluruh pekerjaan yang sudah diberi penawaran.",
                style: TextStyle(
                  color: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.color
                      ?.withOpacity(0.6),
                  fontSize: isMobile ? 14 : 16,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: activeOffers.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.assignment_outlined,
                              size: 60,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.color
                                  ?.withOpacity(0.3),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              "Belum ada penawaran aktif.",
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.color
                                    ?.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: activeOffers.length,
                        itemBuilder: (context, index) {
                          return ActiveOfferCard(
                            offer: activeOffers[index],
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}