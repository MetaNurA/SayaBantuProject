import 'package:flutter/material.dart';
import '../models/job_model.dart';

class PartnerJobCard extends StatelessWidget {
  final JobModel job;
  final VoidCallback onTakeOffer;

  const PartnerJobCard({
    super.key,
    required this.job,
    required this.onTakeOffer,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final isMobile = width < 700;
        final isTablet = width >= 700 && width < 1000;

        final cardPadding = isMobile
            ? 16.0
            : isTablet
                ? 18.0
                : 20.0;

        return Container(
          margin: const EdgeInsets.only(bottom: 18),
          padding: EdgeInsets.all(cardPadding),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: Theme.of(context).dividerColor,
            ),
          ),
          child: isMobile
              ? _buildMobile(context)
              : _buildDesktop(
                  context,
                  isTablet: isTablet,
                ),
        );
      },
    );
  }

  // ============================================================
  // MOBILE
  // ============================================================

  Widget _buildMobile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _thumbnail(
              context,
              70,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: _jobInfo(
                context,
                isMobile: true,
              ),
            ),
          ],
        ),

        const SizedBox(height: 18),

        _locationTime(
          context,
          isMobile: true,
        ),

        const SizedBox(height: 18),

        _priceAndButton(
          context,
          isMobile: true,
        ),
      ],
    );
  }

  // ============================================================
  // TABLET / DESKTOP
  // ============================================================

  Widget _buildDesktop(
    BuildContext context, {
    required bool isTablet,
  }) {
    final thumbnailSize = isTablet ? 75.0 : 85.0;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _thumbnail(
          context,
          thumbnailSize,
        ),

        SizedBox(
          width: isTablet ? 14 : 18,
        ),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _jobInfo(
                context,
                isMobile: false,
              ),

              const SizedBox(height: 14),

              _locationTime(
                context,
                isMobile: false,
              ),
            ],
          ),
        ),

        SizedBox(
          width: isTablet ? 14 : 20,
        ),

        _priceAndButton(
          context,
          isMobile: false,
          isTablet: isTablet,
        ),
      ],
    );
  }

  // ============================================================
  // THUMBNAIL
  // ============================================================

  Widget _thumbnail(
    BuildContext context,
    double size,
  ) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: const Color(0xffFFF3E8),
        borderRadius: BorderRadius.circular(14),
      ),
      clipBehavior: Clip.antiAlias,
      child: job.imageBytes != null
          ? Image.memory(
              job.imageBytes!,
              fit: BoxFit.cover,
            )
          : Icon(
              Icons.handyman,
              color: const Color(0xffF97316),
              size: size * 0.5,
            ),
    );
  }

  // ============================================================
  // JOB INFORMATION
  // ============================================================

  Widget _jobInfo(
    BuildContext context, {
    bool isMobile = false,
  }) {
    final titleColor =
        Theme.of(context).textTheme.titleLarge?.color;

    final descriptionColor = Theme.of(context)
        .textTheme
        .bodyMedium
        ?.color
        ?.withOpacity(0.65);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          job.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: isMobile ? 17 : 20,
            fontWeight: FontWeight.bold,
            color: titleColor,
            height: 1.25,
          ),
        ),

        const SizedBox(height: 8),

        // CATEGORY
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              job.category,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),

        const SizedBox(height: 10),

        // DESCRIPTION
        Text(
          job.description,
          maxLines: isMobile ? 2 : 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: descriptionColor,
            height: 1.5,
            fontSize: isMobile ? 13 : 14,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // LOCATION & TIME
  // ============================================================

  Widget _locationTime(
    BuildContext context, {
    bool isMobile = false,
  }) {
    final textColor = Theme.of(context)
        .textTheme
        .bodyMedium
        ?.color
        ?.withOpacity(0.6);

    return Wrap(
      spacing: isMobile ? 14 : 18,
      runSpacing: 8,
      children: [
        // LOCATION
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 18,
              color: textColor,
            ),
            const SizedBox(width: 5),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isMobile ? 180 : 220,
              ),
              child: Text(
                job.location,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: textColor,
                  fontSize: isMobile ? 13 : 14,
                ),
              ),
            ),
          ],
        ),

        // TIME
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.access_time,
              size: 18,
              color: textColor,
            ),
            const SizedBox(width: 5),
            Text(
              job.time,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: textColor,
                fontSize: isMobile ? 13 : 14,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ============================================================
  // PRICE + BUTTON
  // ============================================================

  Widget _priceAndButton(
    BuildContext context, {
    bool isMobile = false,
    bool isTablet = false,
  }) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _price(),

          const SizedBox(height: 5),

          _bidderCount(),

          const SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            child: _offerButton(
              isMobile: true,
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: isTablet ? 170 : 220,
          ),
          child: _price(
            textAlign: TextAlign.right,
          ),
        ),

        const SizedBox(height: 5),

        _bidderCount(
          textAlign: TextAlign.right,
        ),

        const SizedBox(height: 20),

        _offerButton(
          isMobile: false,
        ),
      ],
    );
  }

  // ============================================================
  // PRICE
  // ============================================================

  Widget _price({
    TextAlign textAlign = TextAlign.left,
  }) {
    return Text(
      job.price,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    );
  }

  // ============================================================
  // BIDDER COUNT
  // ============================================================

  Widget _bidderCount({
    TextAlign textAlign = TextAlign.left,
  }) {
    return Text(
      "${job.bidderCount} sudah menawar",
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 13,
      ),
    );
  }

  // ============================================================
  // OFFER BUTTON
  // ============================================================

  Widget _offerButton({
    bool isMobile = false,
  }) {
    if (job.status == "Menunggu Respon") {
      return ElevatedButton.icon(
        onPressed: null,
        icon: const Icon(
          Icons.hourglass_top,
          size: 19,
        ),
        label: const Text(
          "Menunggu Respon",
          overflow: TextOverflow.ellipsis,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade400,
          foregroundColor: Colors.white,
          disabledBackgroundColor: Colors.grey.shade400,
          disabledForegroundColor: Colors.white,
          elevation: 0,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 14 : 18,
            vertical: 14,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    }

    return ElevatedButton.icon(
      onPressed: onTakeOffer,
      icon: const Icon(
        Icons.flash_on,
        size: 19,
      ),
      label: const Text(
        "Ambil & Nego",
        overflow: TextOverflow.ellipsis,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffF97316),
        foregroundColor: Colors.white,
        elevation: 0,
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 14 : 18,
          vertical: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}