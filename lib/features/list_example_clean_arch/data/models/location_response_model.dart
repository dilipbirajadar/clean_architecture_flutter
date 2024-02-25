import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_response_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,  
)

class LocationResponseModel extends Equatable{
  final String? name;
  final String? url;

  const LocationResponseModel({
    required this.name,
    required this.url,

  });

   factory LocationResponseModel.fromJson(Map<String,dynamic> json) => _$LocationResponseModelFromJson(json);

   Map<String,dynamic> toJson() => _$LocationResponseModelToJson(this);

  @override
  List<Object?> get props => [name,url];

}