import 'package:flutter/material.dart';

import 'liker_favorite_page.dart';
import 'liker_home_page.dart';

class LikerHost extends StatefulWidget {
  const LikerHost({super.key});

  @override
  State<LikerHost> createState() => _LikerHostState();
}

class _LikerHostState extends State<LikerHost> {
  int selectedIndex = 0;

  void _setIndex(int value) => setState(() {
        if (selectedIndex != value) {
          selectedIndex = value;
        }
      });

  @override
  Widget build(BuildContext context) {
    final body = switch (selectedIndex) {
      0 => const LikerHomePage(),
      1 => const LikerFavoritePage(),
      int() => const Placeholder()
    };

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('Favorites'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: _setIndex,
              ),
            ),
            Expanded(
              child: AnimatedSwitcher(
                duration: Durations.medium4,
                child: body,
              ),
            ),
          ],
        ),
      );
    });
  }
}
