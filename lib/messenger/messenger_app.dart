import 'package:flutter/material.dart';

import 'data/data.dart';
import 'ui/messenger_home.dart';

class MessengerApp extends StatelessWidget {
  const MessengerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final data = MessengerDb();

    return MaterialApp(
      title: 'Messenger App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),
      home: MessengerHome(data: data),
    );
  }
}
