import 'package:flutter/material.dart';
import 'package:kinopoisk/authorization/authorization_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: AuthorizationScreen()),
      theme: ThemeData.dark(useMaterial3: true),
    );
  }
}
