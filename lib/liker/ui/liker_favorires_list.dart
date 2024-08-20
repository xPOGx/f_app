import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../liker_app_state.dart';

class LikerFavoritesList extends StatefulWidget {
  const LikerFavoritesList({super.key});

  @override
  State<LikerFavoritesList> createState() => _LikerFavoritesListState();
}

class _LikerFavoritesListState extends State<LikerFavoritesList> {
  final _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<LikerAppState>();
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final favorites = appState.favorites;

    Widget buildItem(WordPair pair, {Function()? onPressed}) {
      return ListTile(
        leading: IconButton(
            onPressed: onPressed ?? () => {},
            color: colorScheme.primary,
            icon: const Icon(Icons.delete_forever_outlined)),
        title: Text(pair.asCamelCase),
      );
    }

    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text('You have ${favorites.length} favorites:'),
          ),
        ),
        Expanded(
          child: AnimatedGrid(
            key: _key,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4,
            ),
            initialItemCount: favorites.length,
            itemBuilder: (context, index, animation) {
              final pair = favorites[index];

              return buildItem(
                pair,
                onPressed: () => appState.removeFavorite(pair, buildItem(pair)),
              );
            },
          ),
        ),
      ],
    );
  }
}
