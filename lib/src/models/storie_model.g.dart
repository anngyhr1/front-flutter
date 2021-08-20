// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StorieModel _$StorieModelFromJson(Map<String, dynamic> json) {
  return StorieModel(
    json['title'] as String,
    json['text'] as String,
    json['author'] as String,
    json['image'] as String,
    (json['rate'] as num)?.toDouble(),
    json['views'] as int,
    json['date'] as String,
    (json['categories'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$StorieModelToJson(StorieModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'text': instance.text,
      'author': instance.author,
      'image': instance.image,
      'rate': instance.rate,
      'views': instance.views,
      'date': instance.date,
      'categories': instance.categories,
    };
