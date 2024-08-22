import 'package:flutter/material.dart';

import '../data/models.dart';
import 'messenger_double_text.dart';
import 'messenger_user_info.dart';

class MessengerReplyCard extends StatelessWidget {
  const MessengerReplyCard({
    super.key,
    required this.reply,
    this.favorite = false,
    this.headerVisible = false,
    this.onStarClick,
    this.onCardClick,
  });

  final Email reply;
  final bool favorite;
  final bool headerVisible;

  final Function()? onStarClick;
  final Function()? onCardClick;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final colors = theme.colorScheme;
    final cardBackground = colors.surfaceContainer;
    final mainColor = colors.onSurfaceVariant;
    final starColor = mainColor.withAlpha(60);

    final texts = theme.textTheme;
    final userStyle = texts.bodySmall?.copyWith(color: mainColor);
    final timeStyle = texts.labelSmall?.copyWith(color: mainColor);
    final titleStyle = texts.headlineSmall?.copyWith(color: mainColor);
    final descriptionStyle = texts.bodyMedium?.copyWith(color: mainColor);

    final buttonStyle = IconButton.styleFrom(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))));

    return Container(
      decoration: ShapeDecoration(
        color: cardBackground,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
      ),
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          if (headerVisible)
            _cardHeader(
              titleStyle,
              timeStyle,
              buttonStyle,
            ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MessengerUserInfo(
                  user: reply.sender,
                  favorite: favorite,
                  nameStyle: userStyle,
                  timeStyle: timeStyle,
                  starBackground: starColor,
                  onStarClick: onStarClick,
                ),
                ..._cardBody(descriptionStyle),
                const SizedBox(height: 16),
                _cardFooter()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardHeader(
    TextStyle? titleStyle,
    TextStyle? timeStyle,
    ButtonStyle? buttonStyle,
  ) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.grey.withAlpha(60),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: MessengerDoubleText(
                reply.subject,
                '${reply.replies.toInt()} Messages',
                nameStyle: titleStyle,
                timeStyle: timeStyle,
              ),
            ),
            IconButton.filled(
              style: buttonStyle,
              onPressed: () => {/**TODO action */},
              icon: const Icon(Icons.delete),
            ),
            const SizedBox(width: 8),
            IconButton.filled(
              style: buttonStyle,
              onPressed: () => {/**TODO action */},
              icon: const Icon(Icons.more_vert_rounded),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _cardBody(TextStyle? descriptionStyle) {
    return [
      Text('For everyone, ${reply.sender.name.first}', style: descriptionStyle),
      const SizedBox(height: 16),
      Text(reply.content, style: descriptionStyle),
    ];
  }

  Widget _cardFooter() {
    final previewUrl = reply.attachments.firstOrNull?.url;

    return Column(
      children: [
        if (previewUrl != null)
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Image.asset(
                      previewUrl,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        Row(
          children: [
            Expanded(
              child: FilledButton(
                onPressed: () => {/**TODO action */},
                child: const Text('Reply'),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: FilledButton(
                onPressed: () => {/**TODO action */},
                child: const Text('Reply All'),
              ),
            )
          ],
        )
      ],
    );
  }
}
