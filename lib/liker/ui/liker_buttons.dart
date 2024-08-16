import 'package:flutter/material.dart';

class LikerButtons extends StatelessWidget {
  const LikerButtons({
    super.key,
    required this.favoriteIcon,
    this.onFavoritePress,
    this.onNextPress,
  });

  final Function()? onFavoritePress;
  final Function()? onNextPress;
  final IconData favoriteIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton.icon(
              onPressed: onFavoritePress,
              label: const Text('Favorite'),
              icon: Icon(favoriteIcon),
            ),
          ),
          ElevatedButton(
            onPressed: onNextPress,
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}
