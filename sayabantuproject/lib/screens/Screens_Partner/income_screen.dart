import 'package:flutter/material.dart';

import '../../data/dummy_income.dart';


class IncomeScreen extends StatelessWidget {
  const IncomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    int totalIncome = 0;

    for (var income in dummyIncome) {
      totalIncome += int.parse(
        income.amount
            .replaceAll("Rp", "")
            .replaceAll(".", ""),
      );
    }

    return Scaffold(
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text(
          "Riwayat Penghasilan",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
        // TOTAL PENGHASILAN
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xffFF8A00),
                    Color(0xffF97316),
                  ],
                ),
                borderRadius:
                    BorderRadius.circular(20),
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Total Penghasilan",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 10),
                  Text(
                    "Rp${totalIncome.toString()}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Riwayat Transaksi",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount:
                    dummyIncome.length,
                itemBuilder: (context,index){
                  final income =
                      dummyIncome[index];
                  return Container(
                    margin:
                        const EdgeInsets.only(
                          bottom: 15,
                        ),
                    padding:
                        const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding:
                              const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color:
                                const Color(0xffffedd5),
                            borderRadius:
                                BorderRadius.circular(12),
                          ),

                          child: const Icon(
                            Icons.payments,
                            color: Colors.orange,
                          ),
                        ),

                        const SizedBox(width: 15),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                income.jobTitle,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                income.customerName,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                income.date,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Text(
                          income.amount,
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight:
                                FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
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