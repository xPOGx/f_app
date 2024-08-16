import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'liker_host.dart';

class LikerApp extends StatelessWidget {
  const LikerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LikerAppState(),
      child: MaterialApp(
        title: 'Liker App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: const LikerHost(),
      ),
    );
  }
}

class LikerAppState extends ChangeNotifier {
  var current = WordPair.random();
  final favorites = <WordPair>[];
  final history = <WordPair>[];

  GlobalKey? historyListKey;
  GlobalKey? favoritesKey;

  void getNext() {
    _addKey(historyListKey, current, history);
    current = WordPair.random();
  }

  void changeFavorite(WordPair pair) {
    if (favorites.contains(pair)) {
      _removeKey(favoritesKey, pair, favorites, Container());
    } else {
      _addKey(favoritesKey, pair, favorites);
    }
  }

  void removeFavorite(WordPair pair, Widget widget) {
    if (favorites.contains(pair)) {
      _removeKey(favoritesKey, pair, favorites, widget);
    }
  }

  void _removeKey(
    GlobalKey? key,
    WordPair item,
    List<WordPair> list,
    Widget widget,
  ) {
    final index = list.indexOf(item);
    list.remove(item);
    (key?.currentState as AnimatedListState?)?.removeItem(index,
        (BuildContext context, Animation<double> animation) {
      return SizeTransition(sizeFactor: animation, child: widget);
    });
    notifyListeners();
  }

  void _addKey(GlobalKey? key, WordPair item, List<WordPair> list) {
    list.insert(0, item);
    (key?.currentState as AnimatedListState?)?.insertItem(0);
    notifyListeners();
  }

  bool liked(WordPair pair) => favorites.contains(pair);
}
