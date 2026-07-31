import 'offer_model.dart';
import 'dart:typed_data';

class JobModel {
  String title;
  String category;
  String description;
  String location;
  String price;
  String status;
  String time;

  int bidderCount;

  String? partnerName;
  String? acceptedPrice;
  String? completedDate;

  Uint8List? imageBytes;

  List<OfferModel> offers;


  JobModel({
    required this.title,
    required this.category,
    required this.description,
    required this.location,
    required this.price,
    required this.status,
    required this.time,
    required this.bidderCount,
    required this.offers,

    this.partnerName,
    this.acceptedPrice,
    this.completedDate,
    this.imageBytes,
  });


  int get offerCount => offers.length;
}