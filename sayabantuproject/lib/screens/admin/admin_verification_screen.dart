import 'package:flutter/material.dart';
import 'admin_layout.dart';
import '../../data/admin_activity_data.dart';

class AdminVerificationScreen extends StatefulWidget {
  const AdminVerificationScreen({
    super.key,
  });

  @override
  State<AdminVerificationScreen> createState() =>
      _AdminVerificationScreenState();
}

class _AdminVerificationScreenState
    extends State<AdminVerificationScreen> {
  // =========================================================
  // DATA PARTNER
  // =========================================================

  final List<Map<String, dynamic>> partners = [
    {
      'name': 'Ahmad Fauzi',
      'email': 'ahmad.fauzi@gmail.com',
      'category': 'AC & Elektronik',
      'city': 'Jakarta Selatan',
      'time': '2 jam lalu',
    },
    {
      'name': 'Dewi Lestari',
      'email': 'dewilestari@gmail.com',
      'category': 'Plumbing',
      'city': 'Jakarta Barat',
      'time': '5 jam lalu',
    },
    {
      'name': 'Rudi Hartono',
      'email': 'rudi.h@gmail.com',
      'category': 'Pertukangan',
      'city': 'Bogor',
      'time': '1 hari lalu',
    },
  ];

  int approvedToday = 12;
  int rejected = 3;

  // =========================================================
  // BUILD
  // =========================================================

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isMobile = screenWidth < 700;
    final isTablet =
        screenWidth >= 700 && screenWidth < 1100;

    return _buildContent(
      context,
      isMobile,
      isTablet,
    );
  }

  // =========================================================
  // CONTENT
  // =========================================================

  Widget _buildContent(
    BuildContext context,
    bool isMobile,
    bool isTablet,
  ) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xFFF4F7FB),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            isMobile ? 16 : 26,
            isMobile ? 18 : 28,
            isMobile ? 16 : 26,
            30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Verifikasi Mitra Baru',
                style: TextStyle(
                  fontSize: isMobile ? 23 : 27,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0F172A),
                ),
              ),

              const SizedBox(height: 5),

              Text(
                '${partners.length} mitra menunggu persetujuan',
                style: TextStyle(
                  fontSize: isMobile ? 12 : 13,
                  color: const Color(0xFF64748B),
                ),
              ),

              const SizedBox(height: 22),

              _buildStatistics(
                isMobile,
                isTablet,
              ),

              const SizedBox(height: 22),

              _buildPartnerList(
                context,
                isMobile,
                isTablet,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // =========================================================
  // STATISTICS
  // =========================================================

  Widget _buildStatistics(
    bool isMobile,
    bool isTablet,
  ) {
    if (isMobile) {
      return Column(
        children: [
          _statCard(
            title: 'Menunggu',
            value: partners.length.toString(),
            icon: Icons.hourglass_empty,
            iconColor: const Color(0xFFF59E0B),
          ),
          const SizedBox(height: 10),
          _statCard(
            title: 'Disetujui Hari Ini',
            value: approvedToday.toString(),
            icon: Icons.check_circle_outline,
            iconColor: const Color(0xFF10B981),
          ),
          const SizedBox(height: 10),
          _statCard(
            title: 'Ditolak',
            value: rejected.toString(),
            icon: Icons.cancel_outlined,
            iconColor: const Color(0xFFEF4444),
          ),
        ],
      );
    }

    return Row(
      children: [
        Expanded(
          child: _statCard(
            title: 'Menunggu',
            value: partners.length.toString(),
            icon: Icons.hourglass_empty,
            iconColor: const Color(0xFFF59E0B),
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: _statCard(
            title: 'Disetujui Hari Ini',
            value: approvedToday.toString(),
            icon: Icons.check_circle_outline,
            iconColor: const Color(0xFF10B981),
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: _statCard(
            title: 'Ditolak',
            value: rejected.toString(),
            icon: Icons.cancel_outlined,
            iconColor: const Color(0xFFEF4444),
          ),
        ),
      ],
    );
  }

  Widget _statCard({
    required String title,
    required String value,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      width: double.infinity,
      height: 82,
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 23,
            color: iconColor,
          ),

          const SizedBox(width: 12),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w700,
                  color: iconColor,
                ),
              ),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFF64748B),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // =========================================================
  // PARTNER LIST
  // =========================================================

  Widget _buildPartnerList(
    BuildContext context,
    bool isMobile,
    bool isTablet,
  ) {
    if (partners.isEmpty) {
      return _emptyState();
    }

    if (isMobile) {
      return Column(
        children: partners.map((partner) {
          return _buildMobilePartnerCard(
            context,
            partner,
          );
        }).toList(),
      );
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: const Color(0xFFDCE3EC),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          _buildTableHeader(),

          ...partners.map(
            (partner) => _buildTableRow(
              context,
              partner,
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // TABLE HEADER
  // =========================================================

  Widget _buildTableHeader() {
    return Container(
      width: double.infinity,
      height: 50,
      color: const Color(0xFFF8FAFC),
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: _headerText('Nama Mitra'),
          ),

          Expanded(
            flex: 2,
            child: _headerText('Kategori'),
          ),

          Expanded(
            flex: 2,
            child: _headerText('Kota'),
          ),

          Expanded(
            flex: 1,
            child: _headerText('Waktu Daftar'),
          ),

          Expanded(
            flex: 2,
            child: _headerText('Berkas'),
          ),

          Expanded(
            flex: 2,
            child: _headerText('Aksi'),
          ),
        ],
      ),
    );
  }

  Widget _headerText(String text) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Color(0xFF334155),
      ),
    );
  }

  // =========================================================
  // TABLE ROW
  // =========================================================

  Widget _buildTableRow(
    BuildContext context,
    Map<String, dynamic> partner,
  ) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(
        minHeight: 96,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xFFE2E8F0),
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // NAMA
          Expanded(
            flex: 2,
            child: _partnerName(partner),
          ),

          // KATEGORI
          Expanded(
            flex: 2,
            child: Text(
              partner['category'],
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF334155),
              ),
            ),
          ),

          // KOTA
          Expanded(
            flex: 2,
            child: Text(
              partner['city'],
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF334155),
              ),
            ),
          ),

          // WAKTU
          Expanded(
            flex: 1,
            child: Text(
              partner['time'],
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF334155),
              ),
            ),
          ),

          // BERKAS
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: _documentButton(context),
            ),
          ),

          // AKSI
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: _actionButtons(
                context,
                partner,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // EMPTY STATE
  // =========================================================

  Widget _emptyState() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 50,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: const Color(0xFFDCE3EC),
        ),
      ),
      child: const Column(
        children: [
          Icon(
            Icons.verified_outlined,
            size: 42,
            color: Color(0xFF10B981),
          ),

          SizedBox(height: 10),

          Text(
            'Tidak ada mitra yang menunggu verifikasi',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF334155),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // MOBILE CARD
  // =========================================================

  Widget _buildMobilePartnerCard(
    BuildContext context,
    Map<String, dynamic> partner,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFDCE3EC),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _partnerName(partner),

          const SizedBox(height: 14),

          _mobileInfo(
            Icons.category_outlined,
            'Kategori',
            partner['category'],
          ),

          const SizedBox(height: 8),

          _mobileInfo(
            Icons.location_on_outlined,
            'Kota',
            partner['city'],
          ),

          const SizedBox(height: 8),

          _mobileInfo(
            Icons.access_time,
            'Waktu Daftar',
            partner['time'],
          ),

          const SizedBox(height: 15),

          const Divider(
            color: Color(0xFFE2E8F0),
            height: 1,
          ),

          const SizedBox(height: 13),

          Wrap(
            spacing: 7,
            runSpacing: 7,
            children: [
              _documentButton(context),

              _approveButton(
                context,
                partner,
              ),

              _rejectButton(
                context,
                partner,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _mobileInfo(
    IconData icon,
    String title,
    String value,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: const Color(0xFF64748B),
        ),

        const SizedBox(width: 7),

        Text(
          '$title: ',
          style: const TextStyle(
            fontSize: 11,
            color: Color(0xFF64748B),
          ),
        ),

        Expanded(
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF334155),
            ),
          ),
        ),
      ],
    );
  }

  // =========================================================
  // PARTNER NAME
  // =========================================================

  Widget _partnerName(
    Map<String, dynamic> partner,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          partner['name'],
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Color(0xFF0F172A),
          ),
        ),

        const SizedBox(height: 2),

        Text(
          partner['email'],
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 10,
            color: Color(0xFF94A3B8),
          ),
        ),
      ],
    );
  }

  // =========================================================
  // DOCUMENT BUTTON
  // =========================================================

  Widget _documentButton(
    BuildContext context,
  ) {
    return ElevatedButton.icon(
      onPressed: () {
        showDialog(
          context: context,
          builder: (dialogContext) {
            return AlertDialog(
              title: const Text(
                'Berkas Mitra',
              ),
              content: const Text(
                'Berkas pendaftaran mitra dapat diperiksa di sini.',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(
                      dialogContext,
                    );
                  },
                  child: const Text(
                    'Tutup',
                  ),
                ),
              ],
            );
          },
        );
      },
      icon: const Icon(
        Icons.attach_file,
        size: 13,
      ),
      label: const Text(
        'Lihat Berkas',
        style: TextStyle(
          fontSize: 11,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFEDE9FE),
        foregroundColor: const Color(0xFF7C3AED),
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: 11,
          vertical: 9,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
      ),
    );
  }

  // =========================================================
  // ACTION BUTTONS
  // =========================================================

  Widget _actionButtons(
    BuildContext context,
    Map<String, dynamic> partner,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _approveButton(
          context,
          partner,
        ),

        const SizedBox(height: 6),

        _rejectButton(
          context,
          partner,
        ),
      ],
    );
  }

  // =========================================================
  // APPROVE BUTTON
  // =========================================================

  Widget _approveButton(
    BuildContext context,
    Map<String, dynamic> partner,
  ) {
    return ElevatedButton.icon(
      onPressed: () {
        setState(() {
          partners.remove(partner);
          approvedToday++;
        });
        AdminActivityData.addApprovedPartner();

        _showMessage(
          context,
          'Mitra berhasil disetujui.',
          const Color(0xFF10B981),
        );
      },
      icon: const Icon(
        Icons.check,
        size: 13,
      ),
      label: const Text(
        'Approve',
        style: TextStyle(
          fontSize: 11,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF10B981),
        foregroundColor: Colors.white,
        elevation: 0,
        minimumSize: const Size(
          84,
          36,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 11,
          vertical: 9,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
      ),
    );
  }

  // =========================================================
  // REJECT BUTTON
  // =========================================================

  Widget _rejectButton(
    BuildContext context,
    Map<String, dynamic> partner,
  ) {
    return OutlinedButton.icon(
      onPressed: () {
        setState(() {
          partners.remove(partner);
          rejected++;
        });
        AdminActivityData.addRejectedPartner();

        _showMessage(
          context,
          'Mitra ditolak.',
          const Color(0xFFEF4444),
        );
      },
      icon: const Icon(
        Icons.close,
        size: 13,
      ),
      label: const Text(
        'Reject',
        style: TextStyle(
          fontSize: 11,
        ),
      ),
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFFEF4444),
        side: const BorderSide(
          color: Color(0xFFFCA5A5),
        ),
        minimumSize: const Size(
          84,
          36,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 11,
          vertical: 9,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
      ),
    );
  }

  // =========================================================
  // MESSAGE
  // =========================================================

  void _showMessage(
    BuildContext context,
    String message, [
    Color? color,
  ]) {
    ScaffoldMessenger.of(context)
        .hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}