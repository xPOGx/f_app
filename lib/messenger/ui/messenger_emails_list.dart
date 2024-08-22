import 'package:f_app/messenger/data/models.dart';
import 'package:flutter/material.dart';

import 'messenger_email_card.dart';

class MessengerEmailsList extends StatefulWidget {
  const MessengerEmailsList({
    super.key,
    required this.emails,
    this.selectedEmail,
    this.onSelect,
  });

  final List<Email> emails;
  final Email? selectedEmail;
  final Function(Email)? onSelect;

  @override
  State<MessengerEmailsList> createState() => _MessengerEmailsListState();
}

class _MessengerEmailsListState extends State<MessengerEmailsList> {
  var favorite = false;

  _favorite(Email email) {
    setState(() {
      // TODO favorite IMPL
      favorite = !favorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        itemCount: widget.emails.length,
        itemBuilder: (context, index) {
          final email = widget.emails[index];

          return MessengerEmailCard(
            email: email,
            selected: widget.selectedEmail == email,
            favorite: favorite,
            onCardClick: () => widget.onSelect?.call(email),
            onStarClick: () => _favorite(email),
          );
        },
      ),
    );
  }
}
