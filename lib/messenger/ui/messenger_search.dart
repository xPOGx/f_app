import 'package:flutter/material.dart';

import '../ext/constants.dart';
import 'messenger_avatar.dart';

class MessengerSearch extends StatelessWidget {
  const MessengerSearch({
    super.key,
    required this.avatarUrl,
    this.padding = const EdgeInsets.all(0),
  });

  final String avatarUrl;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SearchBar(
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
        leading: const Icon(Icons.search),
        hintText: hintText,
        trailing: [
          MessengerAvatar(
            avatarUrl: avatarUrl,
          )
        ],
      ),
    );
  }
}
