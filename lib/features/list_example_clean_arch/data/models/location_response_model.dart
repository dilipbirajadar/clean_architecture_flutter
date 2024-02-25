import 'package:clean_architecture_example/features/list_example_clean_arch/domain/entity/location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_response_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,  
)

class LocationResponseModel extends Location{

   LocationResponseModel({
     super.name,
    super.url,

  });

   factory LocationResponseModel.fromJson(Map<String,dynamic> json) => _$LocationResponseModelFromJson(json);

   Map<String,dynamic> toJson() => _$LocationResponseModelToJson(this);

  @override
  List<Object?> get props => [name,url];

}