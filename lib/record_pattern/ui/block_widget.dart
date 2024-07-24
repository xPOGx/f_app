import 'package:flutter/material.dart';

import '../data/block.dart';

class BlockWidget extends StatelessWidget {
  final Block block;

  const BlockWidget({
    required this.block,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: switch (block) {
        HeaderBlock(:final text) => Text(
            text,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ParagraphBlock(:final text) => Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        CheckboxBlock(:final text, :final isChecked) => Row(
            children: [
              Checkbox(value: isChecked, onChanged: (_) {}),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
      },
    );
  }
}
