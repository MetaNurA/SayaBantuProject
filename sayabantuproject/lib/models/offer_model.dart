class OfferModel {
  final String name;
  final double rating;
  final int jobsCompleted;
  final String price;
  final bool verified;
  

  const OfferModel({
    required this.name,
    required this.rating,
    required this.jobsCompleted,
    required this.price,
    this.verified = true,
  });
  
}