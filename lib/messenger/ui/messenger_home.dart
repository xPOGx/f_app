import 'package:flutter/material.dart';

import '../data/data.dart';
import '../ext/constants.dart';
import 'messenger_main_page.dart';

class MessengerHome extends StatefulWidget {
  const MessengerHome({super.key, required this.data});

  final MessengerDb data;

  @override
  State<MessengerHome> createState() => _MessengerHomeState();
}

class _MessengerHomeState extends State<MessengerHome>
    with SingleTickerProviderStateMixin {
  int _navIndex = 1;
  bool _controllerInitialized = false;
  late final _animator =
      AnimationController(duration: Durations.medium1, value: 0, vsync: this);
  late final _showWideAnimation = Tween<double>(begin: 0, end: 1)
      .animate(CurvedAnimation(parent: _animator, curve: Curves.linear));
  late final _hideWideAnimation = ReverseAnimation(_showWideAnimation);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final wideScreen = MediaQuery.of(context).size.width > 600;

    final AnimationStatus status = _animator.status;
    if (!_controllerInitialized) {
      _controllerInitialized = true;
      _animator.value = wideScreen ? 1 : 0;
    } else {
      if (wideScreen) {
        if (status != AnimationStatus.forward &&
            status != AnimationStatus.completed) {
          _animator.forward();
        }
      } else {
        if (status != AnimationStatus.reverse &&
            status != AnimationStatus.dismissed) {
          _animator.reverse();
        }
      }
    }
  }

  void _setIndex(int index) => setState(() => _navIndex = index);

  bool rotated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            SizeTransition(
              sizeFactor: _showWideAnimation,
              axis: Axis.horizontal,
              child: NavigationRail(
                leading: Column(
                  children: [
                    AnimatedRotation(
                      turns: rotated ? 0.25 : 0.0,
                      duration: Durations.medium1,
                      child: IconButton(
                        onPressed: () => setState(() => rotated = !rotated),
                        icon: const Icon(Icons.menu),
                      ),
                    ),
                    const SizedBox(height: 16),
                    FloatingActionButton(
                      onPressed: () => {/**TODO something */},
                      elevation: 0,
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
                groupAlignment: -0.95,
                selectedIndex: _navIndex,
                onDestinationSelected: _setIndex,
                destinations: navigationRailList,
              ),
            ),
            Expanded(
              child: MessengerMainPage(
                currentUser: widget.data.currentUser,
                emails: widget.data.emails,
                replies: widget.data.replies,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ScaleTransition(
        scale: _hideWideAnimation,
        child: FloatingActionButton(
          onPressed: () => {/**TODO something */},
          child: const Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: SizeTransition(
        sizeFactor: _hideWideAnimation,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: _navIndex,
          onTap: _setIndex,
          items: bottomNavigationBarList,
        ),
      ),
    );
  }
}
