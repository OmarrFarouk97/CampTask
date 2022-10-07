import 'DescriptionSection.dart';
import 'Features.dart';
import 'MapSection.dart';
import 'RelatedSection.dart';

class All {
  final int id;
  final String owner;
  final String title;
  final String featuredImage;
  final int rating;
  final String address;
  final String checkInDayUse;
  final String checkOutDayUse;
  final String checkInNightUse;
  final String checkOutNightUse;
  final String checkInOvernightUse;
  final String checkOutOvernightUse;
  final String description;
  final DescriptionSection descriptionSection;
  final MapSection mapSection;
  final RelatedSection relatedSection;
  final List<List<Features>> features;


  All(
      {required this.id,
      required this.owner,
      required this.description,
      required this.checkInDayUse,
      required this.checkOutDayUse,
      required this.checkInNightUse,
      required this.checkOutNightUse,
      required this.checkInOvernightUse,
      required this.checkOutOvernightUse,
      required this.features,
      required this.rating,
      required this.address,
      required this.descriptionSection,
      required this.relatedSection,
      required this.title,
      required this.featuredImage,
      required this.mapSection});
}
