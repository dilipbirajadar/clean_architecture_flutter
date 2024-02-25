import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_architecture_example/features/list_example_clean_arch/data/models/character_response_model.dart';
import 'package:clean_architecture_example/features/list_example_clean_arch/presentation/bloc/list_detail_example_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListDetailsPage extends StatelessWidget {
  const ListDetailsPage({super.key});

   static Route<void> route({required CharacterResponseModel character}) {
    return MaterialPageRoute(
      builder: (context) {
        return BlocProvider(
          create: (_) => ListDetailExampleBloc(character: character),
          child: const ListDetailsPage(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
     return const ListDetailsView();
  }
}

class ListDetailsView extends StatelessWidget {
  const ListDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        title: const Text('Details'),
      ),
      body: const _LoadContent(),
    );
  }
}

class _LoadContent extends StatelessWidget {
  const _LoadContent({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      child: Builder(
        builder: (ctx) {
          final character = ctx.select(
            (ListDetailExampleBloc b) => b.state.character,
          );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: character.id!,
                child: CachedNetworkImage(
                  imageUrl: character.image!,
                  fit: BoxFit.cover,
                  height: 300,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        character.name ?? '',
                        style: textTheme.displaySmall!.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Status: ${character.isAlive ? 'ALIVE!' : 'DEAD!'}',
                        style: textTheme.titleMedium!.copyWith(
                          color: character.isAlive
                              ? Colors.lightGreen
                              : Colors.redAccent,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Divider(height: 1),
                      const SizedBox(height: 16),
                      Text(
                        'Origin: ${character.origin?.name ?? ''}',
                        style: textTheme.bodyMedium!.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Last location: ${character.location?.name ?? ''}',
                        style: textTheme.bodyMedium!.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Species: ${character.species ?? ''}',
                        style: textTheme.bodyMedium!.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Type: ${character.type ?? '?'}',
                        style: textTheme.bodyMedium!.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Gender: ${character.gender ?? ''}',
                        style: textTheme.bodyMedium!.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      // const SizedBox(height: 4),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Episodes:',
                  style: textTheme.bodyLarge!.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: character.episode?.length ?? 0,
                  itemBuilder: (context, index) {
                    final ep = character.episode![index];
                    return EpisodeItemWidget(ep: ep);
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}


class EpisodeItemWidget extends StatelessWidget {
  const EpisodeItemWidget({super.key, required this.ep});

  final String ep;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final name = ep.split('/').last;

    return Padding(
      padding: const EdgeInsets.only(left: 12.0, top: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: colorScheme.surfaceVariant,
        ),
        height: 80,
        width: 80,
        child: Center(
          child: Text(
            name,
            style: textTheme.bodyLarge!.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }
}