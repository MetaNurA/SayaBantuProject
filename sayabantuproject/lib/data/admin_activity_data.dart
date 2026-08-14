class AdminActivityData {
  // =========================================================
  // STATISTIK
  // =========================================================

  static int approvedPartners = 0;
  static int rejectedPartners = 0;

  static int moderatedPosts = 0;
  static int rejectedPosts = 0;

  static int userReports = 0;
  static int handledReports = 0;

  // =========================================================
  // DAFTAR AKTIVITAS
  // =========================================================

  static final List<Map<String, dynamic>> activities = [];

  // =========================================================
  // MITRA DISETUJUI
  // =========================================================

  static void addApprovedPartner() {
    approvedPartners++;

    addActivity(
      icon: 'verified',
      title: '1 mitra berhasil diverifikasi',
      colorType: 'green',
    );
  }

  // =========================================================
  // MITRA DITOLAK
  // =========================================================

  static void addRejectedPartner() {
    rejectedPartners++;

    addActivity(
      icon: 'cancel',
      title: '1 mitra ditolak',
      colorType: 'red',
    );
  }

  // =========================================================
  // KONTEN DIMODERASI
  // =========================================================

  static void addModeratedPost() {
    moderatedPosts++;

    addActivity(
      icon: 'flag',
      title: '1 postingan telah dimoderasi',
      colorType: 'purple',
    );
  }

  // =========================================================
  // KONTEN DITOLAK
  // =========================================================

  static void addRejectedPost() {
    rejectedPosts++;

    addActivity(
      icon: 'cancel',
      title: '1 postingan ditolak',
      colorType: 'red',
    );
  }

  // =========================================================
  // LAPORAN PENGGUNA MASUK
  // =========================================================

  static void addUserReport() {
    userReports++;

    addActivity(
      icon: 'report',
      title: '1 laporan pengguna diterima',
      colorType: 'orange',
    );
  }

  // =========================================================
  // LAPORAN DITANGANI
  // =========================================================

  static void addHandledReport() {
    handledReports++;

    addActivity(
      icon: 'check',
      title: '1 laporan pengguna ditangani',
      colorType: 'green',
    );
  }

  // =========================================================
  // TAMBAH AKTIVITAS
  // =========================================================

  static void addActivity({
    required String icon,
    required String title,
    required String colorType,
  }) {
    final now = DateTime.now();

    activities.insert(
      0,
      {
        'icon': icon,
        'title': title,
        'time':
            '${now.hour.toString().padLeft(2, '0')}:'
            '${now.minute.toString().padLeft(2, '0')}',
        'colorType': colorType,
      },
    );
  }
}