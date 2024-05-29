// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoriy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categoriy _$CategoriyFromJson(Map<String, dynamic> json) => Categoriy(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image: json['image'] as String,
      creationAt: json['creationAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$CategoriyToJson(Categoriy instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'creationAt': instance.creationAt,
      'updatedAt': instance.updatedAt,
    };
