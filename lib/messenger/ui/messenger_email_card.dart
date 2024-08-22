import 'package:flutter/material.dart';

import '../data/models.dart';
import '../ext/utils.dart';
import 'messenger_avatar.dart';

class MessengerEmailCard extends StatelessWidget {
  const MessengerEmailCard({
    super.key,
    required this.email,
    this.selected = false,
    this.favorite = false,
    this.onStarClick,
    this.onCardClick,
  });

  final Email email;
  final bool selected;
  final bool favorite;

  final Function()? onStarClick;
  final Function()? onCardClick;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final colors = theme.colorScheme;
    final cardBackground =
        selected ? colors.primaryContainer : colors.surfaceContainer;
    final mainColor =
        selected ? colors.onPrimaryContainer : colors.onSurfaceVariant;
    final starColor = mainColor.withAlpha(60);

    final texts = theme.textTheme;
    final userStyle = texts.bodySmall?.copyWith(color: mainColor);
    final timeStyle = texts.labelSmall?.copyWith(color: mainColor);
    final titleStyle = texts.headlineSmall?.copyWith(color: mainColor);
    final descriptionStyle = texts.bodyMedium?.copyWith(color: mainColor);

    return GestureDetector(
      onTap: onCardClick,
      child: AnimatedContainer(
        duration: Durations.medium1,
        decoration: ShapeDecoration(
          color: cardBackground,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
        ),
        margin: const EdgeInsets.only(bottom: 8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _cardHeader(
                email.sender,
                userStyle,
                timeStyle,
                starColor,
                onStarClick: onStarClick,
              ),
              ..._cardBody(titleStyle, descriptionStyle),
              const SizedBox(height: 16),
              _cardFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardHeader(User user, TextStyle? nameStyle, TextStyle? timeStyle,
      Color starBackground,
      {Function()? onStarClick}) {
    final starIcon = favorite ? Icons.star : Icons.star_border;

    return Row(
      children: [
        MessengerAvatar(
          avatarUrl: user.avatarUrl,
          size: 50,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedDefaultTextStyle(
                duration: Durations.medium1,
                style: nameStyle ?? const TextStyle(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                child: Text(user.name.fullName),
              ),
              AnimatedDefaultTextStyle(
                duration: Durations.medium1,
                style: timeStyle ?? const TextStyle(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                child: Text(formatDate(user.lastActive)),
              )
            ],
          ),
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

  List<Widget> _cardBody(TextStyle? titleStyle, TextStyle? descriptionStyle) {
    return [
      AnimatedDefaultTextStyle(
        duration: Durations.medium1,
        style: titleStyle ?? const TextStyle(),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        child: Text(email.subject),
      ),
      AnimatedDefaultTextStyle(
        duration: Durations.medium1,
        style: descriptionStyle ?? const TextStyle(),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        child: Text(email.content),
      ),
    ];
  }

  Widget _cardFooter() {
    final previewUrl = email.attachments.firstOrNull?.url;

    return previewUrl == null
        ? const SizedBox(height: 16)
        : Row(
            children: [
              Expanded(
                child: Image.asset(
                  previewUrl,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          );
  }
}
