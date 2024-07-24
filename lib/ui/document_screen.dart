import 'package:flutter/material.dart';

import '../data/document.dart';
import '../ui/block_widget.dart';
import '../ext/utils.dart';

class DocumentScreen extends StatelessWidget {
  final Document document;

  const DocumentScreen({
    required this.document,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final (title, :modified) = document.metadata;
    final blocks = document.blocks;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Text('Last time modified: ${formatDate(modified)}'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: blocks.length,
              itemBuilder: (context, index) =>
                  BlockWidget(block: blocks[index]),
            ),
          ),
        ],
      ),
    );
  }
}
