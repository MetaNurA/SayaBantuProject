import 'package:flutter/material.dart';

import '../../sections/landing/category_section.dart';
import '../../sections/landing/footer_section.dart';
import '../../sections/landing/hero_section.dart';
import '../../sections/landing/how_it_works_section.dart';
import '../../sections/landing/navbar.dart';
import '../../sections/landing/partner_cta_section.dart';
import '../../sections/landing/stats_section.dart';
import '../../sections/landing/testimonial_section.dart';
import '../../sections/landing/why_section.dart';
import '../../data/dummy_jobs.dart';
import '../../models/partner_job_model.dart';
import '../../sections/landing/search_result_section.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController scrollController = ScrollController();

  String searchKeyword = "";

  List<PartnerJobModel> filteredJobs = [];

  final GlobalKey layananKey = GlobalKey();
  final GlobalKey caraKerjaKey = GlobalKey();
  final GlobalKey mitraKey = GlobalKey();
  final GlobalKey tentangKey = GlobalKey();
  final GlobalKey searchResultKey = GlobalKey();

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
    void initState() {
      super.initState();
      filteredJobs = List.from(dummyJobs);
    }

    void searchJob(String keyword) {
      setState(() {
        searchKeyword = keyword;

        if (keyword.isEmpty) {
          filteredJobs = List.from(dummyJobs);
        } else {
          filteredJobs = dummyJobs.where((job) {
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

            CustomNavbar(
              onLayanan: () => scrollTo(layananKey),
              onCaraKerja: () => scrollTo(caraKerjaKey),
              onMitra: () => scrollTo(mitraKey),
              onTentang: () => scrollTo(tentangKey),
            ),

            HeroSection(
              onCariJasa: () => scrollTo(layananKey),
              onJadiMitra: () => scrollTo(mitraKey),
              onSearch: searchJob,
            ),

            if (searchKeyword.isNotEmpty)
              Container(
                key: searchResultKey,
                child: SearchResultSection(
                  jobs: filteredJobs,
                  keyword: searchKeyword,
                ),
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