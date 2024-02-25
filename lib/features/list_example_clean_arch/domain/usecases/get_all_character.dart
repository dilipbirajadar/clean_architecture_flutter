

import 'package:clean_architecture_example/features/list_example_clean_arch/domain/entity/charactor.dart';
import 'package:clean_architecture_example/features/list_example_clean_arch/domain/repository/fetch_all_character_repository.dart';

class GetAllCharacters{
  final CharacterRepository _repository;
  GetAllCharacters({
required CharacterRepository repository,
  }):_repository = repository;

   Future<List<Character>> call({int page = 0}) async {
    final list = await _repository.getCharacters(page: page);
    return list;
  }

}