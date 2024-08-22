import 'package:flutter/material.dart';

import '../data/models.dart';
import 'messenger_email_detail.dart';
import 'messenger_emails_list.dart';
import 'messenger_search.dart';

class MessengerMainPage extends StatefulWidget {
  const MessengerMainPage({
    super.key,
    required this.currentUser,
    required this.emails,
    required this.replies,
  });

  final User currentUser;
  final List<Email> emails;
  final List<Email> replies;

  @override
  State<MessengerMainPage> createState() => _MessengerMainPageState();
}

class _MessengerMainPageState extends State<MessengerMainPage>
    with TickerProviderStateMixin {
  Email? _selectedEmail;
  late AnimationController _animator;
  late final _showAnimation = Tween<double>(begin: 0, end: 1)
      .animate(CurvedAnimation(parent: _animator, curve: Curves.linear));
  late final _hideAnimation = Tween<double>(begin: 1, end: 0.5)
      .animate(CurvedAnimation(parent: _animator, curve: Curves.linear));

  @override
  void initState() {
    super.initState();
    _animator = AnimationController(duration: Durations.medium1, vsync: this);
  }

  @override
  void dispose() {
    _animator.dispose();
    super.dispose();
  }

  void _select(Email? email) {
    setState(() {
      if (_selectedEmail != email) {
        _selectedEmail = email;
        _animator.forward();
      } else {
        _selectedEmail = null;
        _animator.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              MessengerSearch(
                avatarUrl: widget.currentUser.avatarUrl,
                padding: const EdgeInsets.all(8),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    var width = constraints.maxWidth;

                    return Row(
                      children: [
                        AnimatedBuilder(
                          animation: _hideAnimation,
                          builder: (context, child) => SizedBox(
                            width: _hideAnimation.value * width,
                            child: MessengerEmailsList(
                              emails: widget.emails,
                              selectedEmail: _selectedEmail,
                              onSelect: _select,
                            ),
                          ),
                        ),
                        SizeTransition(
                          sizeFactor: _showAnimation,
                          axis: Axis.horizontal,
                          child: SizedBox(
                            width: width / 2,
                            height: constraints.minHeight,
                            child: MessengerEmailDetail(
                              reply: _selectedEmail,
                              replies: widget.replies
                                  .where((p0) =>
                                      p0.subject == _selectedEmail?.subject)
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
