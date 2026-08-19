import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminProfileScreen extends StatefulWidget {
  const AdminProfileScreen({super.key});

  @override
  State<AdminProfileScreen> createState() =>
      _AdminProfileScreenState();
}

class _AdminProfileScreenState
    extends State<AdminProfileScreen> {
  // =========================================================
  // SHARED PREFERENCES KEY
  // =========================================================

  static const String _nameKey = 'admin_name';
  static const String _emailKey = 'admin_email';
  static const String _passwordKey = 'admin_password';

  // =========================================================
  // DATA PROFIL
  // =========================================================

  String adminName = 'Admin Operator';
  String adminEmail = 'admin@sayabantu.com';

  bool _isLoading = true;

  // =========================================================
  // INIT
  // =========================================================

  @override
  void initState() {
    super.initState();
    _loadAdminProfile();
  }

  // =========================================================
  // LOAD PROFILE
  // =========================================================

  Future<void> _loadAdminProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final savedName = prefs.getString(_nameKey);
      final savedEmail = prefs.getString(_emailKey);

      // Jika belum ada password, buat password awal.
      if (!prefs.containsKey(_passwordKey)) {
        await prefs.setString(
          _passwordKey,
          'admin123',
        );
      }

      if (!mounted) return;

      setState(() {
        adminName = savedName?.trim().isNotEmpty == true
            ? savedName!
            : 'Admin Operator';

        adminEmail = savedEmail?.trim().isNotEmpty == true
            ? savedEmail!
            : 'admin@sayabantu.com';

        _isLoading = false;
      });

      // Simpan default jika belum ada.
      if (savedName == null) {
        await prefs.setString(
          _nameKey,
          adminName,
        );
      }

      if (savedEmail == null) {
        await prefs.setString(
          _emailKey,
          adminEmail,
        );
      }
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _isLoading = false;
      });
    }
  }

  // =========================================================
  // SAVE PROFILE
  // =========================================================

  Future<void> _saveAdminProfile({
    required String name,
    required String email,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      _nameKey,
      name,
    );

    await prefs.setString(
      _emailKey,
      email,
    );

    if (!mounted) return;

    setState(() {
      adminName = name;
      adminEmail = email;
    });
  }

  // =========================================================
  // BUILD
  // =========================================================

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFFF4F7FB),
        child: const Center(
          child: CircularProgressIndicator(
            color: Color(0xFF7C3AED),
          ),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;

        final isMobile = screenWidth < 700;

        final isTablet =
            screenWidth >= 700 && screenWidth < 1100;

        return _buildContent(
          context,
          isMobile,
          isTablet,
        );
      },
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
        padding: EdgeInsets.fromLTRB(
          isMobile ? 16 : 26,
          isMobile ? 18 : 28,
          isMobile ? 16 : 26,
          30,
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            // =================================================
            // TITLE
            // =================================================

            Text(
              'Profil Admin',
              style: TextStyle(
                fontSize: isMobile ? 23 : 27,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF0F172A),
              ),
            ),

            const SizedBox(height: 5),

            Text(
              'Kelola informasi dan keamanan akun admin',
              style: TextStyle(
                fontSize: isMobile ? 12 : 13,
                color: const Color(0xFF64748B),
              ),
            ),

            const SizedBox(height: 22),

            // =================================================
            // PROFILE CARD
            // =================================================

            _buildProfileCard(
              context,
              isMobile,
            ),

            const SizedBox(height: 18),

            // =================================================
            // ACCOUNT CARD
            // =================================================

            _buildAccountCard(
              isMobile,
            ),

            const SizedBox(height: 18),

            // =================================================
            // SECURITY CARD
            // =================================================

            _buildSecurityCard(
              context,
              isMobile,
            ),
          ],
        ),
      ),
    );
  }

  // =========================================================
  // PROFILE CARD
  // =========================================================

  Widget _buildProfileCard(
    BuildContext context,
    bool isMobile,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        isMobile ? 16 : 22,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: const Color(0xFFDCE3EC),
        ),
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                _profileInfo(),

                const SizedBox(height: 16),

                _editButton(context),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: _profileInfo(),
                ),

                _editButton(context),
              ],
            ),
    );
  }

  // =========================================================
  // PROFILE INFO
  // =========================================================

  Widget _profileInfo() {
    return Row(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: const BoxDecoration(
            color: Color(0xFFF0E9FF),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.shield_outlined,
            color: Color(0xFF7C3AED),
            size: 32,
          ),
        ),

        const SizedBox(width: 15),

        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                adminName,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF111827),
                ),
              ),

              const SizedBox(height: 5),

              Text(
                adminEmail,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF64748B),
                ),
              ),

              const SizedBox(height: 7),

              Container(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFDCFCE7),
                  borderRadius:
                      BorderRadius.circular(20),
                ),
                child: const Text(
                  'Admin Harian',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF16A34A),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // =========================================================
  // EDIT BUTTON
  // =========================================================

  Widget _editButton(
    BuildContext context,
  ) {
    return ElevatedButton.icon(
      onPressed: () {
        _showEditProfileDialog(context);
      },
      icon: const Icon(
        Icons.edit_outlined,
        size: 15,
      ),
      label: const Text(
        'Edit Profil',
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor:
            const Color(0xFF7C3AED),
        foregroundColor: Colors.white,
        elevation: 0,
        padding:
            const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 12,
        ),
        shape:
            RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(7),
        ),
      ),
    );
  }

  // =========================================================
  // EDIT PROFILE DIALOG
  // =========================================================

  void _showEditProfileDialog(
    BuildContext context,
  ) {
    final nameController =
        TextEditingController(
      text: adminName,
    );

    final emailController =
        TextEditingController(
      text: adminEmail,
    );

    final formKey =
        GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(12),
          ),
          title: const Text(
            'Edit Profil',
            style: TextStyle(
              fontSize: 18,
              fontWeight:
                  FontWeight.w700,
              color:
                  Color(0xFF111827),
            ),
          ),

          content: SizedBox(
            width: 420,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize:
                    MainAxisSize.min,
                children: [
                  // =================================================
                  // NAMA
                  // =================================================

                  TextFormField(
                    controller:
                        nameController,
                    decoration:
                        InputDecoration(
                      labelText:
                          'Nama Lengkap',
                      prefixIcon:
                          const Icon(
                        Icons.person_outline,
                      ),
                      border:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius
                                .circular(8),
                      ),
                      focusedBorder:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius
                                .circular(8),
                        borderSide:
                            const BorderSide(
                          color:
                              Color(0xFF7C3AED),
                        ),
                      ),
                    ),
                    validator:
                        (value) {
                      if (value == null ||
                          value.trim()
                              .isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }

                      if (value
                              .trim()
                              .length <
                          3) {
                        return 'Nama minimal 3 karakter';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 16,
                  ),

                  // =================================================
                  // EMAIL
                  // =================================================

                  TextFormField(
                    controller:
                        emailController,
                    keyboardType:
                        TextInputType
                            .emailAddress,
                    decoration:
                        InputDecoration(
                      labelText: 'Email',
                      prefixIcon:
                          const Icon(
                        Icons
                            .email_outlined,
                      ),
                      border:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius
                                .circular(8),
                      ),
                      focusedBorder:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius
                                .circular(8),
                        borderSide:
                            const BorderSide(
                          color:
                              Color(0xFF7C3AED),
                        ),
                      ),
                    ),
                    validator:
                        (value) {
                      if (value == null ||
                          value.trim()
                              .isEmpty) {
                        return 'Email tidak boleh kosong';
                      }

                      final email =
                          value.trim();

                      final emailRegex =
                          RegExp(
                        r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                      );

                      if (!emailRegex
                          .hasMatch(email)) {
                        return 'Format email tidak valid';
                      }

                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),

          // =================================================
          // BUTTON
          // =================================================

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(
                  dialogContext,
                );
              },
              child: const Text(
                'Batal',
                style: TextStyle(
                  color:
                      Color(0xFF64748B),
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () async {
                if (!formKey
                    .currentState!
                    .validate()) {
                  return;
                }

                final name =
                    nameController.text
                        .trim();

                final email =
                    emailController.text
                        .trim();

                try {
                  await _saveAdminProfile(
                    name: name,
                    email: email,
                  );

                  if (!mounted) return;

                  Navigator.pop(
                    dialogContext,
                  );

                  _showMessage(
                    context,
                    'Profil berhasil diperbarui',
                    const Color(
                      0xFF16A34A,
                    ),
                  );
                } catch (e) {
                  if (!mounted) return;

                  _showMessage(
                    context,
                    'Gagal menyimpan profil',
                    const Color(
                      0xFFEF4444,
                    ),
                  );
                }
              },
              style:
                  ElevatedButton.styleFrom(
                backgroundColor:
                    const Color(
                  0xFF7C3AED,
                ),
                foregroundColor:
                    Colors.white,
                elevation: 0,
                shape:
                    RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(
                    7,
                  ),
                ),
              ),
              child: const Text(
                'Simpan',
              ),
            ),
          ],
        );
      },
    );
  }

  // =========================================================
  // ACCOUNT CARD
  // =========================================================

  Widget _buildAccountCard(
    bool isMobile,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        isMobile ? 16 : 22,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(9),
        border: Border.all(
          color:
              const Color(0xFFDCE3EC),
        ),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Text(
            'Informasi Akun',
            style: TextStyle(
              fontSize: 15,
              fontWeight:
                  FontWeight.w700,
              color:
                  Color(0xFF0F172A),
            ),
          ),

          const SizedBox(height: 4),

          const Text(
            'Informasi dasar akun administrator',
            style: TextStyle(
              fontSize: 11,
              color:
                  Color(0xFF64748B),
            ),
          ),

          const SizedBox(height: 20),

          if (isMobile)
            Column(
              children: [
                _infoItem(
                  Icons.person_outline,
                  'Nama Lengkap',
                  adminName,
                ),

                const SizedBox(
                  height: 15,
                ),

                _infoItem(
                  Icons.email_outlined,
                  'Email',
                  adminEmail,
                ),

                const SizedBox(
                  height: 15,
                ),

                _infoItem(
                  Icons
                      .admin_panel_settings_outlined,
                  'Level Akses',
                  'Admin Harian',
                ),

                const SizedBox(
                  height: 15,
                ),

                _infoItem(
                  Icons
                      .check_circle_outline,
                  'Status Akun',
                  'Aktif',
                  valueColor:
                      const Color(
                    0xFF16A34A,
                  ),
                ),
              ],
            )
          else
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      _infoItem(
                        Icons.person_outline,
                        'Nama Lengkap',
                        adminName,
                      ),

                      const SizedBox(
                        height: 18,
                      ),

                      _infoItem(
                        Icons
                            .admin_panel_settings_outlined,
                        'Level Akses',
                        'Admin Harian',
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  width: 40,
                ),

                Expanded(
                  child: Column(
                    children: [
                      _infoItem(
                        Icons.email_outlined,
                        'Email',
                        adminEmail,
                      ),

                      const SizedBox(
                        height: 18,
                      ),

                      _infoItem(
                        Icons
                            .check_circle_outline,
                        'Status Akun',
                        'Aktif',
                        valueColor:
                            const Color(
                          0xFF16A34A,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  // =========================================================
  // INFO ITEM
  // =========================================================

  Widget _infoItem(
    IconData icon,
    String label,
    String value, {
    Color? valueColor,
  }) {
    return Row(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color:
                const Color(0xFFF8FAFC),
            borderRadius:
                BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: 18,
            color:
                const Color(0xFF64748B),
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style:
                    const TextStyle(
                  fontSize: 10,
                  color:
                      Color(0xFF94A3B8),
                ),
              ),

              const SizedBox(height: 4),

              Text(
                value,
                overflow:
                    TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight:
                      FontWeight.w600,
                  color: valueColor ??
                      const Color(
                        0xFF334155,
                      ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // =========================================================
  // SECURITY CARD
  // =========================================================

  Widget _buildSecurityCard(
    BuildContext context,
    bool isMobile,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        isMobile ? 16 : 22,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(9),
        border: Border.all(
          color:
              const Color(0xFFDCE3EC),
        ),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Text(
            'Keamanan Akun',
            style: TextStyle(
              fontSize: 15,
              fontWeight:
                  FontWeight.w700,
              color:
                  Color(0xFF0F172A),
            ),
          ),

          const SizedBox(height: 4),

          const Text(
            'Pengaturan keamanan akun administrator',
            style: TextStyle(
              fontSize: 11,
              color:
                  Color(0xFF64748B),
            ),
          ),

          const SizedBox(height: 18),

          _securityItem(
            context,
            Icons.lock_outline,
            'Kata Sandi',
            'Kata sandi terakhir diperbarui',
            'Ubah',
            const Color(0xFF7C3AED),
          ),

          const Divider(
            height: 1,
            color:
                Color(0xFFE2E8F0),
          ),

          _securityItem(
            context,
            Icons
                .verified_user_outlined,
            'Verifikasi Akun',
            'Akun administrator telah terverifikasi',
            'Terverifikasi',
            const Color(0xFF16A34A),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // SECURITY ITEM
  // =========================================================

  Widget _securityItem(
    BuildContext context,
    IconData icon,
    String title,
    String description,
    String action,
    Color actionColor,
  ) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color:
                  const Color(0xFFF8FAFC),
              borderRadius:
                  BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: 18,
              color:
                  const Color(0xFF64748B),
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
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

                const SizedBox(height: 3),

                Text(
                  description,
                  style:
                      const TextStyle(
                    fontSize: 10,
                    color:
                        Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          OutlinedButton(
            onPressed: () {
              if (title == 'Kata Sandi') {
                _showChangePasswordDialog(
                  context,
                );
              }
            },
            style:
                OutlinedButton.styleFrom(
              foregroundColor:
                  actionColor,
              side: BorderSide(
                color: actionColor,
              ),
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              minimumSize: Size.zero,
              tapTargetSize:
                  MaterialTapTargetSize
                      .shrinkWrap,
              shape:
                  RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(
                  7,
                ),
              ),
            ),
            child: Text(
              action,
              style:
                  const TextStyle(
                fontSize: 10,
                fontWeight:
                    FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // CHANGE PASSWORD
  // =========================================================

  void _showChangePasswordDialog(
    BuildContext context,
  ) {
    final formKey =
        GlobalKey<FormState>();

    final oldPasswordController =
        TextEditingController();

    final newPasswordController =
        TextEditingController();

    final confirmPasswordController =
        TextEditingController();

    bool obscureOld = true;
    bool obscureNew = true;
    bool obscureConfirm = true;

    showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder:
              (context, setDialogState) {
            return AlertDialog(
              backgroundColor:
                  Colors.white,
              shape:
                  RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(
                  12,
                ),
              ),

              title: const Text(
                'Ubah Kata Sandi',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight:
                      FontWeight.w700,
                ),
              ),

              content: SizedBox(
                width: 420,
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize:
                        MainAxisSize.min,
                    children: [
                      // =================================================
                      // OLD PASSWORD
                      // =================================================

                      TextFormField(
                        controller:
                            oldPasswordController,
                        obscureText:
                            obscureOld,
                        decoration:
                            InputDecoration(
                          labelText:
                              'Kata Sandi Lama',
                          prefixIcon:
                              const Icon(
                            Icons
                                .lock_outline,
                          ),
                          suffixIcon:
                              IconButton(
                            onPressed: () {
                              setDialogState(
                                () {
                                  obscureOld =
                                      !obscureOld;
                                },
                              );
                            },
                            icon: Icon(
                              obscureOld
                                  ? Icons
                                      .visibility_outlined
                                  : Icons
                                      .visibility_off_outlined,
                            ),
                          ),
                        ),
                        validator:
                            (value) {
                          if (value ==
                                  null ||
                              value.isEmpty) {
                            return 'Masukkan kata sandi lama';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(
                        height: 14,
                      ),

                      // =================================================
                      // NEW PASSWORD
                      // =================================================

                      TextFormField(
                        controller:
                            newPasswordController,
                        obscureText:
                            obscureNew,
                        decoration:
                            InputDecoration(
                          labelText:
                              'Kata Sandi Baru',
                          prefixIcon:
                              const Icon(
                            Icons
                                .lock_outline,
                          ),
                          suffixIcon:
                              IconButton(
                            onPressed: () {
                              setDialogState(
                                () {
                                  obscureNew =
                                      !obscureNew;
                                },
                              );
                            },
                            icon: Icon(
                              obscureNew
                                  ? Icons
                                      .visibility_outlined
                                  : Icons
                                      .visibility_off_outlined,
                            ),
                          ),
                        ),
                        validator:
                            (value) {
                          if (value ==
                                  null ||
                              value.length <
                                  6) {
                            return 'Minimal 6 karakter';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(
                        height: 14,
                      ),

                      // =================================================
                      // CONFIRM PASSWORD
                      // =================================================

                      TextFormField(
                        controller:
                            confirmPasswordController,
                        obscureText:
                            obscureConfirm,
                        decoration:
                            InputDecoration(
                          labelText:
                              'Konfirmasi Kata Sandi',
                          prefixIcon:
                              const Icon(
                            Icons
                                .lock_outline,
                          ),
                          suffixIcon:
                              IconButton(
                            onPressed: () {
                              setDialogState(
                                () {
                                  obscureConfirm =
                                      !obscureConfirm;
                                },
                              );
                            },
                            icon: Icon(
                              obscureConfirm
                                  ? Icons
                                      .visibility_outlined
                                  : Icons
                                      .visibility_off_outlined,
                            ),
                          ),
                        ),
                        validator:
                            (value) {
                          if (value ==
                                  null ||
                              value.isEmpty) {
                            return 'Konfirmasi kata sandi';
                          }

                          if (value !=
                              newPasswordController
                                  .text) {
                            return 'Kata sandi tidak sama';
                          }

                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),

              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(
                      dialogContext,
                    );
                  },
                  child:
                      const Text('Batal'),
                ),

                ElevatedButton(
                  onPressed: () async {
                    if (!formKey
                        .currentState!
                        .validate()) {
                      return;
                    }

                    final prefs =
                        await SharedPreferences
                            .getInstance();

                    final savedPassword =
                        prefs.getString(
                      _passwordKey,
                    );

                    final oldPassword =
                        oldPasswordController
                            .text;

                    // =================================================
                    // CEK PASSWORD LAMA
                    // =================================================

                    if (savedPassword !=
                        oldPassword) {
                      if (!mounted) return;

                      ScaffoldMessenger
                          .of(context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Kata sandi lama salah',
                          ),
                          backgroundColor:
                              Color(
                            0xFFEF4444,
                          ),
                        ),
                      );

                      return;
                    }

                    // =================================================
                    // SIMPAN PASSWORD BARU
                    // =================================================

                    await prefs.setString(
                      _passwordKey,
                      newPasswordController
                          .text,
                    );

                    if (!mounted) return;

                    Navigator.pop(
                      dialogContext,
                    );

                    _showMessage(
                      context,
                      'Kata sandi berhasil diubah',
                      const Color(
                        0xFF16A34A,
                      ),
                    );
                  },
                  style:
                      ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(
                      0xFF7C3AED,
                    ),
                    foregroundColor:
                        Colors.white,
                    elevation: 0,
                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                        7,
                      ),
                    ),
                  ),
                  child:
                      const Text('Simpan'),
                ),
              ],
            );
          },
        );
      },
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

    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor:
            color ??
                const Color(0xFF7C3AED),
        behavior:
            SnackBarBehavior.floating,
        margin:
            const EdgeInsets.all(16),
      ),
    );
  }
}