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
      locationResponseOriginModel: json['location_response_origin_model'] ==
              null
          ? null
          : LocationResponseModelOrigin.fromJson(
              json['location_response_origin_model'] as Map<String, dynamic>),
      locationResponseModel: json['location_response_model'] == null
          ? null
          : LocationResponseModel.fromJson(
              json['location_response_model'] as Map<String, dynamic>),
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
      'image': instance.image,
      'episode': instance.episode,
      'url': instance.url,
      'created': instance.created?.toIso8601String(),
      'location_response_model': instance.locationResponseModel?.toJson(),
      'location_response_origin_model':
          instance.locationResponseOriginModel?.toJson(),
    };

LocationResponseModel _$LocationResponseModelFromJson(
        Map<String, dynamic> json) =>
    LocationResponseModel(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$LocationResponseModelToJson(
        LocationResponseModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

LocationResponseModelOrigin _$LocationResponseModelOriginFromJson(
        Map<String, dynamic> json) =>
    LocationResponseModelOrigin(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$LocationResponseModelOriginToJson(
        LocationResponseModelOrigin instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
