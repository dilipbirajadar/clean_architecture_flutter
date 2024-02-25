
import 'package:clean_architecture_example/features/list_example_clean_arch/domain/usecases/get_all_character.dart';
import 'package:clean_architecture_example/features/list_example_clean_arch/presentation/pages/clean_arch_main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CleanArchPage extends StatelessWidget {
  final GetAllCharacters getAllCharacters;
  const CleanArchPage({super.key,required this.getAllCharacters});

  @override
  Widget build(BuildContext context) {

    return MultiRepositoryProvider(providers: [
 RepositoryProvider.value(value: getAllCharacters),
    ], child: const CleanArchMainPage());
    // return BlocProvider(
    //   create: (context) => ListPageBloc(
    //     getAllCharacters: context.read<GetAllCharacters>(),
    //   )..add(const FetchNextPageEvent()),
    //   child:  const CleanArchMainPage(),
    // );
  
  }
}

// class CharacterView extends StatelessWidget {
//   const CharacterView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final status = context.select((ListPageBloc b) => b.state.status);
//     return status == CharacterPageStatus.initial
//         ? const Center(child: CircularProgressIndicator())
//         : const _Content();
//   }
// }

// class _Content extends StatefulWidget {
//   const _Content({super.key});

//   @override
//   State<_Content> createState() => __ContentState();
// }

// class __ContentState extends State<_Content> {
//   final _scrollController = ScrollController();

//   ListPageBloc get pageBloc => context.read<ListPageBloc>();

//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(_onScroll);
//   }

//   @override
//   Widget build(BuildContext ctx) {
//     final list = ctx.select((ListPageBloc b) => b.state.characters);
//     final hasEnded = ctx.select((ListPageBloc b) => b.state.hasReachedEnd);

//     return Padding(
//       padding: const EdgeInsets.only(left: 16, right: 16),
//       child: ListView.builder(
//         key: const ValueKey('character_page_list_key'),
//         controller: _scrollController,
//         itemCount: hasEnded ? list.length : list.length + 1,
//         itemBuilder: (context, index) {
//           if (index >= list.length) {
//             return !hasEnded
//                 ? const CharacterListItemLoading()
//                 : const SizedBox();
//           }
//           final item = list[index];
//           return index == 0
//               ? Column(
//                   children: [
//                     const CharacterListItemHeader(titleText: 'All Characters'),
//                     CharacterListItem(item: item, onTap: _goToDetails),
//                   ],
//                 )
//               : CharacterListItem(item: item, onTap: _goToDetails);
//         },
//       ),
//     );
//   }

//   void _goToDetails(CharacterResponseModel character) {
//     final route = ListDetailsPage.route(character: character);
//     Navigator.of(context).push(route);
//   }

//   @override
//   void dispose() {
//     _scrollController
//       ..removeListener(_onScroll)
//       ..dispose();
//     super.dispose();
//   }

//   void _onScroll() {
//     if (_isBottom) {
//       pageBloc.add(const FetchNextPageEvent());
//     }
//   }

//   bool get _isBottom {
//     if (!_scrollController.hasClients) return false;
//     final maxScroll = _scrollController.position.maxScrollExtent;
//     final currentScroll = _scrollController.offset;
//     return currentScroll >= (maxScroll * 0.9);
//   }
// }