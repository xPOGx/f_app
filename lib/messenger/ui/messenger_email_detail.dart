import 'package:f_app/messenger/data/models.dart';
import 'package:flutter/material.dart';

import 'messenger_reply_card.dart';

class MessengerEmailDetail extends StatefulWidget {
  const MessengerEmailDetail({
    super.key,
    this.reply,
    required this.replies,
  });

  final Email? reply;
  final List<Email> replies;

  @override
  State<MessengerEmailDetail> createState() => _MessengerEmailDetailState();
}

class _MessengerEmailDetailState extends State<MessengerEmailDetail> {
  Widget previosWidget = const SizedBox.shrink();

  @override
  Widget build(BuildContext context) {
    if (widget.reply != null) {
      final body = Padding(
        padding: const EdgeInsets.only(right: 8),
        child: _formBody(),
      );
      previosWidget = body;
      return body;
    } else {
      return previosWidget;
    }
  }

  Widget _formBody() {
    if (widget.replies.isNotEmpty) {
      return ListView(
        children: [
          for (final entry in widget.replies)
            if (entry == widget.replies.first)
              _buildHeader(entry)
            else
              MessengerReplyCard(reply: entry)
        ],
      );
    } else if (widget.reply != null) {
      return Column(
        children: [
          _buildHeader(widget.reply!),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  MessengerReplyCard _buildHeader(Email entry) =>
      MessengerReplyCard(reply: entry, headerVisible: true);
}
