import 'package:clean_architecture_example/features/list_example_clean_arch/data/models/character_response_model.dart';
import 'package:clean_architecture_example/features/list_example_clean_arch/domain/usecases/get_all_character.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'character_page_event.dart';

part 'character_page_state.dart';

class ListPageBloc extends Bloc<CharacterPageEvent, CharacterPageState> {
  ListPageBloc({
    required GetAllCharacters getAllCharacters,
  })  : _getAllCharacters = getAllCharacters,
        super(const CharacterPageState()) {
    on<FetchNextPageEvent>(
      _fetchNextPage,
      //transformer: throttleDroppable(const Duration(milliseconds: 100)),
    );
  }

  final GetAllCharacters _getAllCharacters;

  Future<void> _fetchNextPage(event, Emitter<CharacterPageState> emit) async {
    if (state.hasReachedEnd) return;

    emit(state.copyWith(status: CharacterPageStatus.loading));

    final list = await _getAllCharacters(page: state.currentPage);

    emit(
      state.copyWith(
        status: CharacterPageStatus.success,
        characters: List.of(state.characters)..addAll(list),
        hasReachedEnd: list.isEmpty,
        currentPage: state.currentPage + 1,
      ),
    );
  }
}