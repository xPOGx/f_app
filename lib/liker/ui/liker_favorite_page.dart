import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../liker_app_state.dart';
import 'liker_favorires_list.dart';

class LikerFavoritePage extends StatelessWidget {
  const LikerFavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<LikerAppState>();
    final favorites = appState.favorites;

    final body = favorites.isEmpty
        ? const Center(child: Text("No favorites"))
        : const LikerFavoritesList();

    return Scaffold(body: body);
  }
}
