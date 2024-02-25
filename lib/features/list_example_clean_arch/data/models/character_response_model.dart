import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character_response_model.g.dart';


@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,  
)

class CharacterResponseModel extends Equatable{
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final LocationRes? origin;
  final LocationRes? location;
  final String? image;
  final List<String>? episode;
  final String? url;
  final DateTime? created;

 const CharacterResponseModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

   factory CharacterResponseModel.fromJson(Map<String,dynamic> json) => _$CharacterResponseModelFromJson(json);

   Map<String,dynamic> toJson() => _$CharacterResponseModelToJson(this);

  @override
  List<Object?> get props => [  id,
        name,
        status,
        species,
        type,
        gender,
        origin,
        location,
        image,
        episode,
        url,
        created,];

          bool get isAlive => status == 'Alive';

}

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,  
)
class LocationRes with EquatableMixin {
  LocationRes({
    this.name,
    this.url,
  });

  final String? name;
  final String? url;

     factory LocationRes.fromJson(Map<String,dynamic> json) => _$LocationResFromJson(json);

   Map<String,dynamic> toJson() => _$LocationResToJson(this);

  @override
  List<Object?> get props => [
        name,
        url,
      ];
}