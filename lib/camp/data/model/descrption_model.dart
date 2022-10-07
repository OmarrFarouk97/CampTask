import '../../domain/entity/DescriptionSection.dart';

class DescriptionModel extends DescriptionSection {
  DescriptionModel({
  required super.title,
  required super.subtitle,
  required super.description
  });

  factory DescriptionModel.fromJson (Map<String,dynamic>json)=> DescriptionModel(
title: json['title'],
subtitle:json['subtitle'],
description: json['description']
);

}