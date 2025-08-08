import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kinopoisk/modules/movie_details/cubit/movie_details_cubit.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsCubitState>(
      builder: (context, state) {
        final cubit = context.read<MovieDetailsCubit>();
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(cubit.movieId.toString()),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("back"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
