import '../../domain/entity/Features.dart';



class FeatureModel extends Features{
  FeatureModel({
  required super.id,
  required super.description,
  required super.isActive,
  required super.image});
factory FeatureModel.fromJson (Map<String,dynamic>json)=> FeatureModel(
id: json['id'],
description: json['description'],
isActive: json['is_active'],
image: json['image'],
);
}