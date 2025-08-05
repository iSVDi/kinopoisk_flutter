import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kinopoisk/modules/movie_list/cubit/movie_list_cubit.dart';
import 'package:kinopoisk/modules/movie_list/models/movie_list_response.dart';

class MoviesListScreen extends StatelessWidget {
  const MoviesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieListCubit, MovieListState>(
      builder: (context, state) {
        switch (state) {
          case MovieListState.presentingMovies:
            return movieList(context);
          case MovieListState.loadingMovies:
            return loadingMovies();
        }
      },
    );
  }

  Widget loadingMovies() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Movies is loading..."),
          SizedBox(height: 10),
          CircularProgressIndicator(),
        ],
      ),
    );
  }

  Widget movieList(BuildContext context) {
    var movies = context.read<MovieListCubit>().movies;

    return ListView.separated(
      itemBuilder: (context, id) {
        return movieCell(movies[id]);
      },
      separatorBuilder: (_, _) {
        return SizedBox(height: 20);
      },
      itemCount: movies.length,
    );
  }

  Widget movieCell(Movie movie) {
    var yearContries =
        [movie.year.toString()] +
        movie.countries.map((e) => e.country).toList();

    const subtitleTextStyle = TextStyle(
      color: Colors.grey,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    );
    return Row(
      children: [
        Image.network(movie.posterUrl, width: 200, height: 200),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 20,
            children: [
              Text(
                movie.nameRu ?? movie.nameOriginal ?? "Name not provided",
                maxLines: 2,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),

              Text(
                movie.genres.map((e) => e.genre).toList().join(", "),
                style: subtitleTextStyle,
              ),

              Text(yearContries.join(", "), style: subtitleTextStyle),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(flex: 2, child: SizedBox()),
                  Text(
                    movie.ratingKinopoisk.toString(),
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.tealAccent,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(padding: EdgeInsetsGeometry.only(left: 10)),
      ],
    );
    // return Row(
    //   children: [
    //     Image.network(movie.posterUrl, width: 200, height: 200),

    //     // Expanded(
    //     //   child:
    //     // ),

    //     // Expanded(
    //     //   child:
    //     // ),
    //   ],
    // );
  }
}
