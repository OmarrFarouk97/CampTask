import 'package:jordon/camp/data/model/map_section_model.dart';
import 'package:jordon/camp/data/model/related_section_model.dart';
import 'package:jordon/camp/domain/entity/MapSection.dart';
import 'package:jordon/camp/domain/entity/RelatedSection.dart';

import '../../domain/entity/All.dart';
import '../../domain/entity/Features.dart';
import 'descrption_model.dart';
import 'features_model.dart';

class AllModel extends All {
  AllModel({
  required super.id,
  required super.owner,
  required super.address,
  required super.description,
  required super.rating,
  required super.title,
  required super.features,
  required super.descriptionSection,
  required super.relatedSection,
  required super.featuredImage,
  required super.checkInDayUse,
  required super.checkOutDayUse,
  required super.checkInNightUse,
  required super.checkOutNightUse,
  required super.checkInOvernightUse,
  required super.checkOutOvernightUse,
  required super.mapSection,

  });

  factory AllModel.fromJson(Map<String,dynamic> json)=> AllModel(
      id :json['id'],
      owner: json['owner'],
      title: json['title'],
      address: json['address'],
      rating: json['rating'],
     description: json['description'],
      featuredImage: json['featured_image'],
      checkInDayUse : json['check_in_day_use'],
      checkOutDayUse : json['check_out_day_use'],
      checkInNightUse : json['check_in_night_use'],
      checkOutNightUse : json['check_out_night_use'],
      checkInOvernightUse : json['check_in_overnight_use'],
      checkOutOvernightUse : json['check_out_overnight_use'],
      mapSection: MapSectionModel.fromJson(json['map_section']),

      features:List<List<Features>>.from(json["features"].map((x) => List<Features>.from(x.map((x) => FeatureModel.fromJson(x))))),
// List<List<Features>>.from(json['features'].map((e)=>FeatureModel.fromJson(e))),
      descriptionSection: DescriptionModel.fromJson(json['description_section']),
      relatedSection: RelatedSectionModel.fromJson(json['related_section']),

  );
}
