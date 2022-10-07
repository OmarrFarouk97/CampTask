import 'package:jordon/camp/domain/entity/RelatedProperties.dart';

class RelatedPropertiesModel extends RelatedProperties {
  RelatedPropertiesModel(
      {required super.id,
      required super.title,
      required super.type,
      required super.price,
      required super.rating,
      required super.reviews,
      required super.featuredImage,
      required super.isSaved});
  factory RelatedPropertiesModel.fromJson(Map <String,dynamic> json)=>RelatedPropertiesModel(
id : json['id'],
title : json['title'],
type : json['type'],
price : json['price'],
rating : json['rating'],
reviews : json['reviews'],
featuredImage : json['featured_image'],
isSaved : json['is_saved'],
);
}
