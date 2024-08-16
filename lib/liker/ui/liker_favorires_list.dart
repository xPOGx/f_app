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
    final favorites = appState.favorites;

    appState.favoritesKey = _key;

    Widget buildItem(WordPair pair, {Function()? onPressed}) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton.icon(
          onPressed: onPressed ?? () => {},
          icon: const Icon(Icons.delete_forever_outlined),
          label: Text(pair.asLowerCase),
        ),
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
          child: AnimatedList(
            key: _key,
            initialItemCount: favorites.length,
            itemBuilder: (context, index, animation) {
              final pair = favorites[index];

              return SizeTransition(
                  sizeFactor: animation,
                  child: buildItem(pair,
                      onPressed: () =>
                          appState.removeFavorite(pair, buildItem(pair))));
            },
          ),
        ),
      ],
    );
  }

  st() => {};
}
