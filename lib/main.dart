import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kinopoisk/authorization/authorization_screen.dart';
import 'package:kinopoisk/authorization/cubit/authorization_cubit.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthorizationCubit(),
      child: MaterialApp(
        home: Scaffold(body: AuthorizationScreen()),
        theme: ThemeData.dark(useMaterial3: true),
      ),
    );
  }
}
