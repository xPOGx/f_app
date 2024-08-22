import 'package:flutter/material.dart';

const hintText = 'Search replies';

const _navItems = [
  (Icons.inbox_outlined, 'Inbox', Icons.inbox),
  (Icons.article_outlined, 'Articles', Icons.article),
  (Icons.messenger_outline, 'Messages', Icons.messenger),
  (Icons.group_outlined, 'Groups', Icons.group),
];

final bottomNavigationBarList = _navItems
    .map((pair) => BottomNavigationBarItem(
        icon: Icon(pair.$1), label: pair.$2, activeIcon: Icon(pair.$3)))
    .toList();

final navigationRailList = _navItems
    .map((pair) => NavigationRailDestination(
        icon: Icon(pair.$1), label: Text(pair.$2), selectedIcon: Icon(pair.$3)))
    .toList();
