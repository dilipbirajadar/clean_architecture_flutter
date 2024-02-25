import 'package:clean_architecture_example/core/api/app_api.dart';
import 'package:clean_architecture_example/features/list_example_clean_arch/data/models/character_response_model.dart';

import 'package:clean_architecture_example/features/list_example_clean_arch/domain/repository/fetch_all_character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository{
  final AppApi appApi;

  CharacterRepositoryImpl({
    required this.appApi
  });

  @override
  Future<List<CharacterResponseModel>> getCharacters({int page = 0}) async{
   final fetchedList = await appApi.loadCharacters(page: page);
    return fetchedList;
  }
  
}