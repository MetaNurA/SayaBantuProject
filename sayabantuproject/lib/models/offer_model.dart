class OfferModel {
  final String name;
  final int jobsCompleted;
  final String price;
  final bool verified;
  

  const OfferModel({
    required this.name,
    required this.jobsCompleted,
    required this.price,
    this.verified = true,
  });
  
}