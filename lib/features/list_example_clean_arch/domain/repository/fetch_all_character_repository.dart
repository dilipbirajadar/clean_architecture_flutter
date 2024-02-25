import 'package:clean_architecture_example/features/list_example_clean_arch/data/models/character_response_model.dart';


abstract class CharacterRepository{
   Future<List<CharacterResponseModel>> getCharacters({int page = 0});
}