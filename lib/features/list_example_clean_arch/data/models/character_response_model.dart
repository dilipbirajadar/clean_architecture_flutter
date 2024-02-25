
import 'package:clean_architecture_example/features/list_example_clean_arch/domain/entity/charactor.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character_response_model.g.dart';


@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,  
)

class CharacterResponseModel  extends Character{
final LocationResponseModel? locationResponseModel;
final LocationResponseModelOrigin? locationResponseOriginModel;

  CharacterResponseModel({
    super.id,
    super.name,
    super.status,
    super.species,
    super.type,
    super.gender,
    required this.locationResponseOriginModel,
    required this.locationResponseModel,
    super.image,
    super.episode,
    super.url,
    super.created,
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
        locationResponseOriginModel,
        locationResponseModel,
        image,
        episode,
        url,
        created,];


}

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,  
)
class LocationResponseModel with EquatableMixin {
  LocationResponseModel({
    this.name,
    this.url,
  });

  final String? name;
  final String? url;

     factory LocationResponseModel.fromJson(Map<String,dynamic> json) => _$LocationResponseModelFromJson(json);

   Map<String,dynamic> toJson() => _$LocationResponseModelToJson(this);

  @override
  List<Object?> get props => [
        name,
        url,
      ];
}

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,  
)
class LocationResponseModelOrigin with EquatableMixin {
  LocationResponseModelOrigin({
    this.name,
    this.url,
  });

  final String? name;
  final String? url;

     factory LocationResponseModelOrigin.fromJson(Map<String,dynamic> json) => _$LocationResponseModelOriginFromJson(json);

   Map<String,dynamic> toJson() => _$LocationResponseModelOriginToJson(this);

  @override
  List<Object?> get props => [
        name,
        url,
      ];
}