import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

import '../../models/job_model.dart';

class PostingJasaDialog extends StatefulWidget {
  const PostingJasaDialog({super.key});

  @override
  State<PostingJasaDialog> createState() => _PostingJasaDialogState();
}

class _PostingJasaDialogState extends State<PostingJasaDialog> {
  final _judulController = TextEditingController();
  final _deskripsiController = TextEditingController();
  final _budgetController = TextEditingController();
  final _lokasiController = TextEditingController();

  File? _selectedImage;

  String _kategori = "Service AC";

  final List<String> kategoriList = [
    "Service AC",
    "Plumbing",
    "Listrik",
    "Cat Rumah",
    "Kebersihan",
    "Lainnya",
  ];

  @override
  void dispose() {
    _judulController.dispose();
    _deskripsiController.dispose();
    _budgetController.dispose();
    _lokasiController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();

    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  void _postingJasa() {
    if (_judulController.text.isEmpty ||
        _deskripsiController.text.isEmpty ||
        _budgetController.text.isEmpty ||
        _lokasiController.text.isEmpty ||
        _selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Lengkapi semua data dan unggah foto kendala."),
        ),
      );
      return;
    }

    final job = JobModel(
      title: _judulController.text,
      description: _deskripsiController.text,
      price: "Rp${_budgetController.text}",
      status: "Mencari Mitra",
      time: "Baru saja",
      offers: [],
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Posting jasa berhasil dibuat."),
      ),
    );

    Navigator.pop(context, job);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Container(
        width: 650,
        padding: const EdgeInsets.all(28),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Posting Jasa Baru",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              const Text("Judul Jasa"),
              const SizedBox(height: 8),

              TextField(
                controller: _judulController,
                decoration: const InputDecoration(
                  hintText: "Contoh: Service AC Bocor",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              const Text("Kategori"),
              const SizedBox(height: 8),

              DropdownButtonFormField<String>(
                value: _kategori,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                items: kategoriList.map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _kategori = value!;
                  });
                },
              ),

              const SizedBox(height: 20),

              const Text("Deskripsi"),
              const SizedBox(height: 8),

              TextField(
                controller: _deskripsiController,
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: "Jelaskan masalah secara detail...",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              const Text("Budget"),
              const SizedBox(height: 8),
              TextField(
                controller: _budgetController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  CurrencyInputFormatter(
                    leadingSymbol: "Rp ",
                    thousandSeparator: ThousandSeparator.Period,
                    mantissaLength: 0,
                  ),
                ],
                decoration: const InputDecoration(
                  hintText: "Rp 0",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              const Text("Lokasi"),
              const SizedBox(height: 8),

              TextField(
                controller: _lokasiController,
                decoration: const InputDecoration(
                  hintText: "Masukkan alamat",
                  prefixIcon: Icon(Icons.location_on_outlined),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              const Text("Foto Kendala"),
              const SizedBox(height: 8),

              InkWell(
                onTap: _pickImage,
                child: Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: _selectedImage == null
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cloud_upload_outlined,
                              size: 40,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Klik untuk upload foto",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.file(
                            _selectedImage!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 30),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Batal"),
                    ),
                  ),

                  const SizedBox(width: 18),

                  Expanded(
                    flex: 2,
                    child: ElevatedButton.icon(
                      onPressed: _postingJasa,
                      icon: const Icon(Icons.rocket_launch),
                      label: const Text("Posting Sekarang"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffF97316),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}