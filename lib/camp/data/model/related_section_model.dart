import 'package:jordon/camp/data/model/related_properties_model.dart';

import '../../domain/entity/RelatedProperties.dart';
import '../../domain/entity/RelatedSection.dart';

class RelatedSectionModel extends RelatedSection {
  RelatedSectionModel(
      {required super.title,
      required super.subtitle,
      required super.relatedProperties});
  factory RelatedSectionModel.fromJson(Map<String,dynamic> json)=> RelatedSectionModel(
title: json['title'],
subtitle:json['subtitle'],
relatedProperties:List<RelatedProperties>.from(json['related_properties'].map((e)=>RelatedPropertiesModel.fromJson(e))),
);

}
