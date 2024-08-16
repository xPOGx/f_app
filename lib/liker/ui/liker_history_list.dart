import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../liker_app_state.dart';

class LikerHistoryList extends StatefulWidget {
  const LikerHistoryList({super.key, required this.flex});

  final int flex;

  @override
  State<LikerHistoryList> createState() => _LikerHistoryListState();
}

class _LikerHistoryListState extends State<LikerHistoryList> {
  final _key = GlobalKey();

  static const Gradient _topHideGradient = LinearGradient(
    colors: [Colors.transparent, Colors.black],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0, 0.3],
  );

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<LikerAppState>();
    final history = appState.history;
    final theme = Theme.of(context);
    final listTextStyle =
        theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.primary);

    appState.historyListKey = _key;

    Center buildItem(WordPair pair, Icon? icon) {
      return Center(
        child: TextButton.icon(
          onPressed: () => appState.changeFavorite(pair),
          label: Text(
            pair.asLowerCase,
            style: listTextStyle,
          ),
          icon: icon,
        ),
      );
    }

    return Expanded(
      flex: widget.flex,
      child: ShaderMask(
        shaderCallback: (bounds) => _topHideGradient.createShader(bounds),
        blendMode: BlendMode.dstIn,
        child: AnimatedList(
          key: _key,
          reverse: true,
          padding: const EdgeInsets.only(top: 100),
          initialItemCount: history.length,
          itemBuilder: (context, index, animation) {
            final pair = history[index];
            final icon =
                appState.liked(pair) ? const Icon(Icons.favorite) : null;

            return SizeTransition(
              sizeFactor: animation,
              child: buildItem(pair, icon),
            );
          },
        ),
      ),
    );
  }
}
