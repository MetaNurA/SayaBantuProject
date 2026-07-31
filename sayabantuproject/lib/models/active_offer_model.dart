import 'job_model.dart';

class ActiveOfferModel {
  final JobModel job;
  final String price;
  final String message;

  String status;

  ActiveOfferModel({
    required this.job,
    required this.price,
    required this.message,
    this.status = "Menunggu Respon",
  });
}