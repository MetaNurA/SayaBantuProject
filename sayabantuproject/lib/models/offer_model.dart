class OfferModel {
  final String name;
  final int jobsCompleted;
  final String price;
  final bool verified;
  String status; 
  

  OfferModel({
    required this.name,
    required this.jobsCompleted,
    required this.price,
    this.verified = true,
    this.status = "Menunggu Respon",
  });
  
}