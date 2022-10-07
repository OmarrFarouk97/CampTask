import 'package:jordon/camp/domain/entity/MapSection.dart';

class MapSectionModel extends MapSection{
  MapSectionModel({
  required super.title,
  required super.subtitle,
  required super.address,
  required super.longitude,
  required super.latitude,
  required super.url
  });

factory MapSectionModel.fromJson(Map <String,dynamic> json)=>MapSectionModel(
title : json['title'],
subtitle : json['subtitle'],
address : json['address'],
longitude : json['longitude'],
latitude : json['latitude'],
url : json['url'],

);


}