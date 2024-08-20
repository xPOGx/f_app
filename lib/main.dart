import 'package:flutter/material.dart';

import 'liker/liker_app.dart';
import 'record_pattern/record_patten_app.dart';
import 'sign_up/sign_up_app.dart';

void main() {
  const appToShow = 3;
  final myApp = switch (appToShow) {
    1 => const DocumentApp(),
    2 => const SignUpApp(),
    3 => const LikerApp(),
    int() => const Placeholder(),
  };

  runApp(myApp);
}
