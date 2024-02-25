
import 'package:clean_architecture_example/features/list_example_clean_arch/domain/entity/charactor.dart';


abstract class CharacterRepository{
   Future<List<Character>> getCharacters({int page = 0});
}