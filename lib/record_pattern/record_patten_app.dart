import 'package:flutter/material.dart';

import 'data/document.dart';
import 'ui/document_screen.dart';

class DocumentApp extends StatelessWidget {
  const DocumentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: DocumentScreen(
        document: Document(),
      ),
    );
  }
}
