

import 'package:clean_architecture_example/features/list_example_clean_arch/domain/entity/charactor.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'list_example_event.dart';

part 'list_example_state.dart';

class ListDetailExampleBloc
    extends Bloc<ListExampleEvent, ListExampleState> {
  ListDetailExampleBloc({required Character character})
      : super(ListExampleState(character: character));
}