
import 'package:clean_architecture_example/features/list_example_clean_arch/data/models/character_response_model.dart';
import 'package:clean_architecture_example/features/list_example_clean_arch/domain/repository/fetch_all_character_repository.dart';

class GetAllCharacters{
  final CharacterRepository _repository;
  GetAllCharacters({
required CharacterRepository repository,
  }):_repository = repository;

   Future<List<CharacterResponseModel>> call({int page = 0}) async {
    final list = await _repository.getCharacters(page: page);
    return list;
  }

}