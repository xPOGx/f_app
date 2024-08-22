import 'package:flutter/material.dart';

class MessengerDoubleText extends StatelessWidget {
  const MessengerDoubleText(
    this.firstText,
    this.secondText, {
    super.key,
    required this.nameStyle,
    required this.timeStyle,
  });

  final String firstText;
  final String secondText;

  final TextStyle? nameStyle;
  final TextStyle? timeStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedDefaultTextStyle(
          duration: Durations.medium1,
          style: nameStyle ?? const TextStyle(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          child: Text(firstText),
        ),
        AnimatedDefaultTextStyle(
          duration: Durations.medium1,
          style: timeStyle ?? const TextStyle(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          child: Text(secondText),
        )
      ],
    );
  }
}
