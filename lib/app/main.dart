
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kinopoisk/app/cubit/main_app_cubit_cubit.dart';
import 'package:kinopoisk/modules/authorization/authorization_screen.dart';
import 'package:kinopoisk/modules/authorization/cubit/authorization_cubit.dart';
import 'package:kinopoisk/modules/movie_list/cubit/movie_list_cubit.dart';
import 'package:kinopoisk/modules/movie_list/movies_list_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final _mainAppCubit = MainAppCubit();

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _mainAppCubit.isAuthorized(),
      builder: (context, snapshot) {
        if (snapshot.data == true) {
          return movieListFlow();
        } else {
          return loginFlow();
        }
      },
    );
  }

  Widget loginFlow() {
    return BlocProvider(
      create: (context) => AuthorizationCubit(),
      child: MaterialApp(
        home: Scaffold(body: AuthorizationScreen()),
        theme: ThemeData.dark(useMaterial3: true),
      ),
    );
  }

  Widget movieListFlow() {
    return BlocProvider(
      create: (context) => MovieListCubit(),
      child: MaterialApp(
        home: Scaffold(body: MoviesListScreen()),
        theme: ThemeData.dark(useMaterial3: true),
      ),
    );
  }
}
