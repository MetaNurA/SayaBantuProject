import 'offer_model.dart';

class JobModel {
  final String title;
  final String description;
  final String price;
  String status;
  final String time;

  /// Daftar penawaran dari mitra
  List<OfferModel> offers;

  JobModel({
    required this.title,
    required this.description,
    required this.price,
    required this.status,
    required this.time,
    required this.offers,
  });

  /// Jumlah penawar dihitung otomatis
  int get offerCount => offers.length;
}