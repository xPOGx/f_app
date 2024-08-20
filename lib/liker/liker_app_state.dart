import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

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
      final index = favorites.indexOf(pair);
      favorites.remove(pair);
      (favoritesKey?.currentState as AnimatedGridState?)?.removeItem(index,
          (BuildContext context, Animation<double> animation) {
        return ScaleTransition(
          scale: animation,
          child: widget,
        );
      });
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
