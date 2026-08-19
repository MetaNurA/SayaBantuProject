import 'package:flutter/material.dart';

import '../../data/admin_activity_data.dart';

class AdminVerificationScreen extends StatefulWidget {
  // =========================================================
  // CALLBACK UNTUK MENGIRIM JUMLAH PENDING KE ADMIN LAYOUT
  // =========================================================

  final ValueChanged<int>? onPendingCountChanged;

  const AdminVerificationScreen({
    super.key,
    this.onPendingCountChanged,
  });

  @override
  State<AdminVerificationScreen> createState() =>
      _AdminVerificationScreenState();
}

class _AdminVerificationScreenState
    extends State<AdminVerificationScreen> {
  final List<Map<String, dynamic>> partners = [
    {
      'name': 'Dewi Lestari',
      'email': 'dewi lestari@gmail.com',
      'category': 'Plumbing',
      'city': 'Jakarta Barat',
      'time': '5 jam lalu',
      'documents': [
        {
          'title': 'KTP / Identitas',
          'file': 'ktp_dewi.jpg',
          'valid': true,
        },
        {
          'title': 'Foto Profil',
          'file': 'foto_dewi.jpg',
          'valid': true,
        },
        {
          'title': 'Bukti Keahlian',
          'file': 'sertifikat_plumbing.pdf',
          'valid': true,
        },
        {
          'title': 'Bukti Alamat',
          'file': 'alamat_dewi.jpg',
          'valid': true,
        },
      ],
    },
    {
      'name': 'Rudi Hartono',
      'email': 'rudi.h@gmail.com',
      'category': 'Pertukangan',
      'city': 'Bogor',
      'time': '1 hari lalu',
      'documents': [
        {
          'title': 'KTP / Identitas',
          'file': 'ktp_rudi.jpg',
          'valid': true,
        },
        {
          'title': 'Foto Profil',
          'file': 'foto_rudi.jpg',
          'valid': true,
        },
        {
          'title': 'Bukti Keahlian',
          'file': 'sertifikat_pertukangan.pdf',
          'valid': true,
        },
        {
          'title': 'Bukti Alamat',
          'file': 'alamat_rudi.jpg',
          'valid': true,
        },
      ],
    },
  ];

  // =========================================================
  // STATISTIK
  // =========================================================

  int approvedToday = 13;
  int rejected = 3;

  // =========================================================
  // INIT STATE
  // =========================================================

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _syncPending();
    });
  }

  // =========================================================
  // SYNC PENDING
  // =========================================================

  void _syncPending() {
    // Update data global
    AdminActivityData.setPendingPartnerCount(
      partners.length,
    );

    // Update badge pada AdminLayout
    widget.onPendingCountChanged?.call(
      partners.length,
    );
  }

  // =========================================================
  // CHECK DOKUMEN
  // =========================================================

  bool _documentsComplete(
    Map<String, dynamic> partner,
  ) {
    final docs = List<Map<String, dynamic>>.from(
      partner['documents'] ?? [],
    );

    return docs.isNotEmpty &&
        docs.every(
          (doc) => doc['valid'] == true,
        );
  }

  // =========================================================
  // APPROVE
  // =========================================================

  Future<void> _approve(int index) async {
    if (index < 0 || index >= partners.length) {
      return;
    }

    final partner = partners[index];
    final name = partner['name'] as String;

    if (!_documentsComplete(partner)) {
      _message(
        'Berkas $name belum lengkap atau belum valid.',
        error: true,
      );
      return;
    }

    final ok = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              'Approve Mitra',
            ),
            content: Text(
              'Yakin ingin memverifikasi $name?\n\n'
              'Pastikan identitas, alamat, foto profil, '
              'dan bukti keahlian sudah sesuai.',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    false,
                  );
                },
                child: const Text(
                  'Batal',
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(
                    context,
                    true,
                  );
                },
                icon: const Icon(
                  Icons.check,
                  size: 17,
                ),
                label: const Text(
                  'Approve',
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF10B981),
                  foregroundColor:
                      Colors.white,
                ),
              ),
            ],
          ),
        ) ??
        false;

    if (!ok || !mounted) {
      return;
    }

    setState(() {
      partners.removeAt(index);
      approvedToday++;
    });

    // Update jumlah pending setelah approve
    _syncPending();

    AdminActivityData.addApprovedPartner(
      name: name,
    );

    _message(
      '$name berhasil diverifikasi.',
    );
  }

  // =========================================================
  // REJECT
  // =========================================================

  Future<void> _reject(int index) async {
    if (index < 0 || index >= partners.length) {
      return;
    }

    final name = partners[index]['name'] as String;

    final controller = TextEditingController();

    final reason = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Tolak Pendaftaran',
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              'Berikan alasan penolakan untuk $name.',
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller,
              maxLines: 4,
              decoration: InputDecoration(
                hintText:
                    'Contoh: KTP tidak jelas atau bukti keahlian tidak sesuai.',
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Batal',
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              if (controller.text
                  .trim()
                  .isNotEmpty) {
                Navigator.pop(
                  context,
                  controller.text.trim(),
                );
              }
            },
            icon: const Icon(
              Icons.close,
              size: 17,
            ),
            label: const Text(
              'Reject',
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color(0xFFEF4444),
              foregroundColor:
                  Colors.white,
            ),
          ),
        ],
      ),
    );

    controller.dispose();

    if (reason == null || !mounted) {
      return;
    }

    setState(() {
      partners.removeAt(index);
      rejected++;
    });

    // Update jumlah pending setelah reject
    _syncPending();

    _message(
      '$name ditolak: $reason',
      error: true,
    );
  }

  // =========================================================
  // VIEW DOCUMENTS
  // =========================================================

  void _viewDocuments(
    Map<String, dynamic> partner,
  ) {
    final docs = List<Map<String, dynamic>>.from(
      partner['documents'] ?? [],
    );

    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Berkas ${partner['name']}',
        ),
        content: SizedBox(
          width: 520,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: docs.map((doc) {
              final valid =
                  doc['valid'] == true;

              return Container(
                margin:
                    const EdgeInsets.only(
                  bottom: 9,
                ),
                padding:
                    const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        const Color(0xFFE2E8F0),
                  ),
                  borderRadius:
                      BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      valid
                          ? Icons.check_circle
                          : Icons.error_outline,
                      color: valid
                          ? const Color(
                              0xFF10B981,
                            )
                          : const Color(
                              0xFFEF4444,
                            ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            doc['title'],
                            style:
                                const TextStyle(
                              fontWeight:
                                  FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            doc['file'],
                            style:
                                const TextStyle(
                              fontSize: 11,
                              color: Color(
                                0xFF64748B,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      valid
                          ? 'Sesuai'
                          : 'Periksa',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight:
                            FontWeight.w700,
                        color: valid
                            ? const Color(
                                0xFF10B981,
                              )
                            : const Color(
                                0xFFEF4444,
                              ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Tutup',
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // MESSAGE
  // =========================================================

  void _message(
    String text, {
    bool error = false,
  }) {
    if (!mounted) return;

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(text),
          behavior:
              SnackBarBehavior.floating,
          backgroundColor: error
              ? const Color(0xFFEF4444)
              : null,
        ),
      );
  }

  // =========================================================
  // BUILD
  // =========================================================

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AdminActivityData.instance,
      builder: (context, _) => LayoutBuilder(
        builder: (
          context,
          constraints,
        ) {
          final mobile =
              constraints.maxWidth < 700;

          final tablet =
              constraints.maxWidth >= 700 &&
                  constraints.maxWidth < 1100;

          return Container(
            color: const Color(0xFFF4F7FB),
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                mobile ? 16 : 26,
                mobile ? 18 : 28,
                mobile ? 16 : 26,
                30,
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    'Verifikasi Mitra Baru',
                    style: TextStyle(
                      fontSize: mobile
                          ? 23
                          : tablet
                              ? 25
                              : 27,
                      fontWeight:
                          FontWeight.w700,
                      color:
                          const Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${partners.length} mitra menunggu persetujuan',
                    style:
                        const TextStyle(
                      fontSize: 13,
                      color:
                          Color(0xFF64748B),
                    ),
                  ),
                  const SizedBox(height: 22),
                  _summary(mobile),
                  const SizedBox(height: 20),
                  partners.isEmpty
                      ? _empty()
                      : _table(mobile),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // =========================================================
  // SUMMARY
  // =========================================================

  Widget _summary(bool mobile) {
    final cards = [
      _summaryCard(
        'Menunggu',
        partners.length.toString(),
        'Perlu Ditinjau',
        Icons.hourglass_empty,
        const Color(0xFFF59E0B),
        const Color(0xFFFFF7ED),
      ),
      _summaryCard(
        'Disetujui Hari Ini',
        approvedToday.toString(),
        'Mitra Disetujui',
        Icons.check_circle_outline,
        const Color(0xFF10B981),
        const Color(0xFFECFDF5),
      ),
      _summaryCard(
        'Ditolak',
        rejected.toString(),
        'Pendaftaran Ditolak',
        Icons.cancel_outlined,
        const Color(0xFFEF4444),
        const Color(0xFFFEF2F2),
      ),
    ];

    if (mobile) {
      return Column(
        children: [
          for (
            var i = 0;
            i < cards.length;
            i++
          ) ...[
            cards[i],
            if (i < cards.length - 1)
              const SizedBox(height: 10),
          ],
        ],
      );
    }

    return Row(
      children: [
        for (
          var i = 0;
          i < cards.length;
          i++
        ) ...[
          Expanded(
            child: cards[i],
          ),
          if (i < cards.length - 1)
            const SizedBox(width: 10),
        ],
      ],
    );
  }

  // =========================================================
  // SUMMARY CARD
  // =========================================================

  Widget _summaryCard(
    String title,
    String value,
    String subtitle,
    IconData icon,
    Color iconColor,
    Color iconBg,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(9),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius:
                  BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 21,
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight:
                      FontWeight.w700,
                  color: iconColor,
                ),
              ),
              Text(
                title,
                style:
                    const TextStyle(
                  fontSize: 12,
                  fontWeight:
                      FontWeight.w600,
                  color:
                      Color(0xFF334155),
                ),
              ),
              Text(
                subtitle,
                style:
                    const TextStyle(
                  fontSize: 10,
                  color:
                      Color(0xFF94A3B8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // =========================================================
  // TABLE
  // =========================================================

  Widget _table(bool mobile) {
    if (mobile) {
      return Column(
        children: List.generate(
          partners.length,
          (i) => _mobileCard(
            partners[i],
            i,
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(9),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
        ),
      ),
      child: Column(
        children: [
          _tableHeader(),
          ...List.generate(
            partners.length,
            (i) => _tableRow(
              partners[i],
              i,
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // TABLE HEADER
  // =========================================================

  Widget _tableHeader() {
    return Container(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 13,
      ),
      color: const Color(0xFFF8FAFC),
      child: const Row(
        children: [
          Expanded(
            flex: 25,
            child: Text(
              'Nama Mitra',
              style: TextStyle(
                fontSize: 11,
                color:
                    Color(0xFF64748B),
              ),
            ),
          ),
          Expanded(
            flex: 22,
            child: Text(
              'Kategori',
              style: TextStyle(
                fontSize: 11,
                color:
                    Color(0xFF64748B),
              ),
            ),
          ),
          Expanded(
            flex: 18,
            child: Text(
              'Kota',
              style: TextStyle(
                fontSize: 11,
                color:
                    Color(0xFF64748B),
              ),
            ),
          ),
          Expanded(
            flex: 15,
            child: Text(
              'Waktu Daftar',
              style: TextStyle(
                fontSize: 11,
                color:
                    Color(0xFF64748B),
              ),
            ),
          ),
          Expanded(
            flex: 18,
            child: Text(
              'Berkas',
              style: TextStyle(
                fontSize: 11,
                color:
                    Color(0xFF64748B),
              ),
            ),
          ),
          Expanded(
            flex: 24,
            child: Text(
              'Aksi',
              style: TextStyle(
                fontSize: 11,
                color:
                    Color(0xFF64748B),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // TABLE ROW
  // =========================================================

  Widget _tableRow(
    Map<String, dynamic> p,
    int index,
  ) {
    return Container(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 14,
      ),
      decoration:
          const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xFFE2E8F0),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 25,
            child: _name(p),
          ),
          Expanded(
            flex: 22,
            child: Text(
              p['category'],
              style:
                  const TextStyle(
                fontSize: 11,
                color:
                    Color(0xFF475569),
              ),
            ),
          ),
          Expanded(
            flex: 18,
            child: Text(
              p['city'],
              style:
                  const TextStyle(
                fontSize: 11,
                color:
                    Color(0xFF475569),
              ),
            ),
          ),
          Expanded(
            flex: 15,
            child: Text(
              p['time'],
              style:
                  const TextStyle(
                fontSize: 11,
                color:
                    Color(0xFF64748B),
              ),
            ),
          ),
          Expanded(
            flex: 18,
            child: _documentButton(p),
          ),
          Expanded(
            flex: 24,
            child: _actions(index),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // NAME
  // =========================================================

  Widget _name(
    Map<String, dynamic> p,
  ) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          p['name'],
          style:
              const TextStyle(
            fontSize: 12,
            fontWeight:
                FontWeight.w700,
            color:
                Color(0xFF1E293B),
          ),
        ),
        const SizedBox(height: 3),
        Text(
          p['email'],
          style:
              const TextStyle(
            fontSize: 10,
            color:
                Color(0xFF94A3B8),
          ),
        ),
      ],
    );
  }

  // =========================================================
  // DOCUMENT BUTTON
  // =========================================================

  Widget _documentButton(
    Map<String, dynamic> p,
  ) {
    return Align(
      alignment:
          Alignment.centerLeft,
      child: TextButton.icon(
        onPressed: () {
          _viewDocuments(p);
        },
        icon: const Icon(
          Icons.attach_file,
          size: 14,
        ),
        label: const Text(
          'Lihat Berkas',
          style:
              TextStyle(fontSize: 10),
        ),
        style:
            TextButton.styleFrom(
          backgroundColor:
              const Color(0xFFF0EAFE),
          foregroundColor:
              const Color(0xFF8B5CF6),
          padding:
              const EdgeInsets.symmetric(
            horizontal: 9,
            vertical: 8,
          ),
          shape:
              RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(7),
          ),
        ),
      ),
    );
  }

  // =========================================================
  // ACTIONS
  // =========================================================

  Widget _actions(int index) {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            _approve(index);
          },
          icon: const Icon(
            Icons.check,
            size: 14,
          ),
          label: const Text(
            'Approve',
            style:
                TextStyle(fontSize: 10),
          ),
          style:
              ElevatedButton.styleFrom(
            backgroundColor:
                const Color(0xFF10B981),
            foregroundColor:
                Colors.white,
            elevation: 0,
            padding:
                const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 9,
            ),
            minimumSize: Size.zero,
            tapTargetSize:
                MaterialTapTargetSize
                    .shrinkWrap,
            shape:
                RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(7),
            ),
          ),
        ),
        OutlinedButton.icon(
          onPressed: () {
            _reject(index);
          },
          icon: const Icon(
            Icons.close,
            size: 14,
          ),
          label: const Text(
            'Reject',
            style:
                TextStyle(fontSize: 10),
          ),
          style:
              OutlinedButton.styleFrom(
            foregroundColor:
                const Color(0xFFEF4444),
            side:
                const BorderSide(
              color:
                  Color(0xFFFCA5A5),
            ),
            padding:
                const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 9,
            ),
            minimumSize: Size.zero,
            tapTargetSize:
                MaterialTapTargetSize
                    .shrinkWrap,
            shape:
                RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(7),
            ),
          ),
        ),
      ],
    );
  }

  // =========================================================
  // MOBILE CARD
  // =========================================================

  Widget _mobileCard(
    Map<String, dynamic> p,
    int index,
  ) {
    return Container(
      width: double.infinity,
      margin:
          const EdgeInsets.only(
        bottom: 12,
      ),
      padding:
          const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(9),
        border: Border.all(
          color:
              const Color(0xFFE2E8F0),
        ),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          _name(p),
          const SizedBox(height: 10),
          Text(
            '${p['category']} • ${p['city']}',
            style:
                const TextStyle(
              fontSize: 11,
              color:
                  Color(0xFF64748B),
            ),
          ),
          Text(
            p['time'],
            style:
                const TextStyle(
              fontSize: 10,
              color:
                  Color(0xFF94A3B8),
            ),
          ),
          const SizedBox(height: 9),
          _documentButton(p),
          const SizedBox(height: 5),
          _actions(index),
        ],
      ),
    );
  }

  // =========================================================
  // EMPTY
  // =========================================================

  Widget _empty() {
    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.symmetric(
        vertical: 60,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(9),
        border: Border.all(
          color:
              const Color(0xFFE2E8F0),
        ),
      ),
      child: const Column(
        children: [
          Icon(
            Icons.verified_outlined,
            size: 42,
            color:
                Color(0xFFCBD5E1),
          ),
          SizedBox(height: 12),
          Text(
            'Tidak ada mitra yang perlu diverifikasi.',
            textAlign:
                TextAlign.center,
            style:
                TextStyle(
              fontSize: 13,
              color:
                  Color(0xFF94A3B8),
            ),
          ),
        ],
      ),
    );
  }
}