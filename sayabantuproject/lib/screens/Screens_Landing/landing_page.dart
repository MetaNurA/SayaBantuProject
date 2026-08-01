import 'package:flutter/material.dart';

import '../../data/job_data.dart';
import '../../models/job_model.dart';

import '../../sections/landing/category_section.dart';
import '../../sections/landing/footer_section.dart';
import '../../sections/landing/hero_section.dart';
import '../../sections/landing/how_it_works_section.dart';
import '../../sections/landing/navbar.dart';
import '../../sections/landing/partner_cta_section.dart';
import '../../sections/landing/search_result_section.dart';
import '../../sections/landing/stats_section.dart';
import '../../sections/landing/testimonial_section.dart';
import '../../sections/landing/why_section.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController scrollController = ScrollController();

  String searchKeyword = "";
  List<JobModel> filteredJobs = [];

  final GlobalKey layananKey = GlobalKey();
  final GlobalKey caraKerjaKey = GlobalKey();
  final GlobalKey mitraKey = GlobalKey();
  final GlobalKey tentangKey = GlobalKey();
  final GlobalKey searchResultKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    filteredJobs = List.from(jobs);
  }

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

  void searchJob(String keyword) {
    setState(() {
      searchKeyword = keyword;

      if (keyword.isEmpty) {
        filteredJobs = List.from(jobs);
      } else {
        filteredJobs = jobs.where((job) {
          return job.title.toLowerCase().contains(keyword.toLowerCase()) ||
              job.description.toLowerCase().contains(keyword.toLowerCase()) ||
              job.category.toLowerCase().contains(keyword.toLowerCase());
        }).toList();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (searchResultKey.currentContext != null) {
        Scrollable.ensureVisible(
          searchResultKey.currentContext!,
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            /// ================= NAVBAR =================
            CustomNavbar(
              onLayanan: () => scrollTo(layananKey),
              onCaraKerja: () => scrollTo(caraKerjaKey),
              onMitra: () => scrollTo(mitraKey),
              onTentang: () => scrollTo(tentangKey),
            ),

            /// ================= HERO =================
            HeroSection(
              onCariJasa: () => scrollTo(layananKey),
              onJadiMitra: () => scrollTo(mitraKey),
              onSearch: searchJob,
            ),

            /// ================= SEARCH RESULT =================
            if (searchKeyword.isNotEmpty)
              Container(
                key: searchResultKey,
                child: SearchResultSection(
                  jobs: filteredJobs,
                  keyword: searchKeyword,
                ),
              ),

            /// ================= CATEGORY =================
            Container(
              key: layananKey,
              child: const CategorySection(),
            ),

            /// ================= HOW IT WORKS =================
            Container(
              key: caraKerjaKey,
              child: const HowItWorksSection(),
            ),

            /// ================= STATS =================
            const StatsSection(),

            /// ================= WHY =================
            const WhySection(),

            /// ================= TESTIMONIAL =================
            const TestimonialSection(),

            /// ================= CTA MITRA =================
            Container(
              key: mitraKey,
              child: PartnerCTASection(
                onDaftarMitra: () => scrollTo(mitraKey),
                onPelajari: () => scrollTo(caraKerjaKey),
              ),
            ),

            /// ================= FOOTER =================
            Container(
              key: tentangKey,
              child: const FooterSection(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}