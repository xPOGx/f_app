import 'package:flutter/material.dart';

import '../data/models.dart';
import '../ext/utils.dart';
import 'messenger_avatar.dart';
import 'messenger_double_text.dart';

class MessengerUserInfo extends StatelessWidget {
  const MessengerUserInfo({
    super.key,
    required this.user,
    required this.favorite,
    this.nameStyle,
    this.timeStyle,
    this.starBackground,
    this.onStarClick,
  });

  final User user;
  final bool favorite;
  final Function()? onStarClick;
  final TextStyle? nameStyle;
  final TextStyle? timeStyle;
  final Color? starBackground;

  @override
  Widget build(BuildContext context) {
    final starIcon = favorite ? Icons.star : Icons.star_border;

    return Row(
      children: [
        MessengerAvatar(
          avatarUrl: user.avatarUrl,
          size: 50,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: MessengerDoubleText(
              user.name.fullName, formatDate(user.lastActive),
              nameStyle: nameStyle, timeStyle: timeStyle),
        ),
        IconButton(
          onPressed: onStarClick ?? () => {},
          icon: CircleAvatar(
            backgroundColor: starBackground,
            radius: 30,
            child: Icon(starIcon),
          ),
        )
      ],
    );
  }
}
