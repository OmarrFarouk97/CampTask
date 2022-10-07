class RelatedProperties {
  final int id;
  final String title;
  final String type;
  final String price;
  final int rating;
  final int reviews;
  final String featuredImage;
  final int isSaved;

  RelatedProperties(
      {required this.id,
      required this.title,
      required this.type,
      required this.price,
      required this.rating,
      required this.reviews,
      required this.featuredImage,
      required this.isSaved});
}
