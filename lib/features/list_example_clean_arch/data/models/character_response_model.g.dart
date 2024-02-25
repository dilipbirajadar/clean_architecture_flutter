// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterResponseModel _$CharacterResponseModelFromJson(
        Map<String, dynamic> json) =>
    CharacterResponseModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      status: json['status'] as String?,
      species: json['species'] as String?,
      type: json['type'] as String?,
      gender: json['gender'] as String?,
      origin: json['origin'] == null
          ? null
          : LocationRes.fromJson(json['origin'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : LocationRes.fromJson(json['location'] as Map<String, dynamic>),
      image: json['image'] as String?,
      episode:
          (json['episode'] as List<dynamic>?)?.map((e) => e as String).toList(),
      url: json['url'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$CharacterResponseModelToJson(
        CharacterResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'origin': instance.origin?.toJson(),
      'location': instance.location?.toJson(),
      'image': instance.image,
      'episode': instance.episode,
      'url': instance.url,
      'created': instance.created?.toIso8601String(),
    };

LocationRes _$LocationResFromJson(Map<String, dynamic> json) => LocationRes(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$LocationResToJson(LocationRes instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
