part of 'list_detail_example_bloc.dart';

 class ListExampleState with EquatableMixin{
    final CharacterResponseModel character;

    ListExampleState({required this.character});


  @override
  List<Object?> get props => [character];
}