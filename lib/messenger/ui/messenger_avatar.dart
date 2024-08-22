import 'package:flutter/material.dart';

class MessengerAvatar extends StatelessWidget {
  const MessengerAvatar({
    super.key,
    required this.avatarUrl,
    this.size = 40,
    this.padding = const EdgeInsets.all(0),
  });

  final String avatarUrl;
  final double size;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Image.asset(
        avatarUrl,
        width: size,
        height: size,
      ),
    );
  }
}
