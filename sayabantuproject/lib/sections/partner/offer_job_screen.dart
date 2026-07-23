import 'package:flutter/material.dart';
import '../../models/partner_job_model.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import '../../data/dummy_offers.dart';
import '../../models/active_offer_model.dart';
import '../../data/dummy_jobs.dart';

class OfferJobScreen extends StatefulWidget {
  final PartnerJobModel job;

  const OfferJobScreen({
    super.key,
    required this.job,
  });

  @override
  State<OfferJobScreen> createState() => _OfferJobScreenState();
}

class _OfferJobScreenState extends State<OfferJobScreen> {
  final TextEditingController _priceController =
      TextEditingController();

  final TextEditingController _messageController =
      TextEditingController();

  @override
  void dispose() {
    _priceController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      appBar: AppBar(
        title: const Text("Ambil & Nego"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Informasi Job
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    widget.job.title,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    widget.job.category,
                    style: const TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    widget.job.description,
                    style: const TextStyle(
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 25),

                  Row(
                    children: [

                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey,
                      ),

                      const SizedBox(width: 6),

                      Text(widget.job.location),

                      const Spacer(),

                      const Icon(
                        Icons.access_time,
                        color: Colors.grey,
                      ),

                      const SizedBox(width: 6),

                      Text(widget.job.time),
                    ],
                  ),

                  const Divider(height: 35),

                  const Text(
                    "Budget Pelanggan",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    widget.job.price,
                    style: const TextStyle(
                      fontSize: 28,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Harga Penawaran",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                CurrencyInputFormatter(
                  leadingSymbol: "Rp ",
                  thousandSeparator: ThousandSeparator.Period,
                  mantissaLength: 0,
                ),
              ],
              decoration: InputDecoration(
                hintText: "Rp 0",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Pesan untuk Pelanggan",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: _messageController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText:
                    "Contoh : Saya siap mengerjakan hari ini dengan garansi servis.",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text(
                  "Kirim Penawaran",
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffF97316),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (_priceController.text.isEmpty ||
                      _messageController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Lengkapi harga dan pesan terlebih dahulu.",
                        ),
                      ),
                    );
                    return;
                  }

                  // Simpan penawaran ke dummy_offers
                  dummyOffers.add(
                    ActiveOfferModel(
                      job: widget.job,
                      price: _priceController.text,
                      message: _messageController.text,
                    ),
                  );
                  dummyJobs.remove(widget.job);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Penawaran berhasil dikirim.",
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}