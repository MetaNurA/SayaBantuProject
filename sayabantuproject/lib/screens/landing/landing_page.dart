import 'package:flutter/material.dart';

import '../../sections/category_section.dart';
import '../../sections/footer_section.dart';
import '../../sections/hero_section.dart';
import '../../sections/how_it_works_section.dart';
import '../../sections/navbar.dart';
import '../../sections/partner_cta_section.dart';
import '../../sections/stats_section.dart';
import '../../sections/testimonial_section.dart';
import '../../sections/why_section.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController scrollController = ScrollController();

  final GlobalKey layananKey = GlobalKey();
  final GlobalKey caraKerjaKey = GlobalKey();
  final GlobalKey mitraKey = GlobalKey();
  final GlobalKey tentangKey = GlobalKey();

  void scrollTo(GlobalKey key) {
    final context = key.currentContext;

    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [

            CustomNavbar(
              onLayanan: () => scrollTo(layananKey),
              onCaraKerja: () => scrollTo(caraKerjaKey),
              onMitra: () => scrollTo(mitraKey),
              onTentang: () => scrollTo(tentangKey),
            ),

            HeroSection(
              onCariJasa: () => scrollTo(layananKey),
              onJadiMitra: () => scrollTo(mitraKey),
            ),

            Container(
              key: layananKey,
              child: const CategorySection(),
            ),

            Container(
              key: caraKerjaKey,
              child: const HowItWorksSection(),
            ),

            const StatsSection(),

            const WhySection(),

            const TestimonialSection(),

            Container(
              key: mitraKey,
              child: PartnerCTASection(
                onDaftarMitra: () => scrollTo(mitraKey),
                onPelajari: () => scrollTo(caraKerjaKey),
              ),
            ),

            Container(
              key: tentangKey,
              child: const FooterSection(),
            ),
          ],
        ),
      ),
    );
  }
}