import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kinopoisk/modules/movie_list/cubit/movie_list_cubit.dart';
import 'package:kinopoisk/modules/movie_list/movies_list_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return BlocProvider(
  //     create: (context) => AuthorizationCubit(),
  //     child: MaterialApp(
  //       home: Scaffold(body: AuthorizationScreen()),
  //       theme: ThemeData.dark(useMaterial3: true),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieListCubit(),
      child: MaterialApp(
        home: Scaffold(body: MoviesListScreen()),
        theme: ThemeData.dark(useMaterial3: true),
      ),
    );
  }
}
