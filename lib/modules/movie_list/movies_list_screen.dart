import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kinopoisk/modules/movie_list/cubit/movie_list_cubit.dart';
import 'package:kinopoisk/modules/movie_list/models/movie_list_response.dart';
import 'package:kinopoisk/services/network_service.dart';

class MoviesListScreen extends StatelessWidget {
  final NetworkService service = NetworkService.create();

  MoviesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieListCubit, MovieListState>(
      builder: (context, state) {
        return Center(
          child: ElevatedButton(
            onPressed: () async {
              var res = await service.getMovies();
              var castedRes = MovieListResponse.fromJson(res.body);
              print(castedRes);
            },
            child: Text("start request"),
          ),
        );
      },
    );
  }
}
