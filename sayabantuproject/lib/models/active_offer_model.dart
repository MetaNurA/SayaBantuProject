import 'partner_job_model.dart';

class ActiveOfferModel {
  final PartnerJobModel job;
  final String price;
  final String message;

  int queue;
  bool accepted;

  ActiveOfferModel({
    required this.job,
    required this.price,
    required this.message,
    this.queue = 1,
    this.accepted = false,
  });
}