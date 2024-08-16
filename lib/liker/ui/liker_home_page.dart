import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../liker_app_state.dart';
import 'liker_big_card.dart';
import 'liker_buttons.dart';
import 'liker_history_list.dart';

class LikerHomePage extends StatelessWidget {
  const LikerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<LikerAppState>();
    final pair = appState.current;
    final icon = appState.liked(pair) ? Icons.favorite : Icons.favorite_border;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LikerHistoryList(flex: 3),
          BigCard(pair: pair),
          LikerButtons(
            favoriteIcon: icon,
            onFavoritePress: () => appState.changeFavorite(pair),
            onNextPress: appState.getNext,
          ),
          const Spacer(flex: 2)
        ],
      ),
    );
  }
}
