import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../liker_app_state.dart';
import 'liker_host.dart';

class LikerApp extends StatelessWidget {
  const LikerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LikerAppState(),
      child: MaterialApp(
        title: 'Liker App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: const LikerHost(),
      ),
    );
  }
}
