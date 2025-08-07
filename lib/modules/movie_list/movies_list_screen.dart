import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kinopoisk/components/app_text_field.dart';
import 'package:kinopoisk/components/custom_app_bar.dart';
import 'package:kinopoisk/modules/movie_list/cubit/movie_list_cubit.dart';
import 'package:kinopoisk/modules/movie_list/models/movie_list_response.dart';

class MoviesListScreen extends StatefulWidget {
  const MoviesListScreen({super.key});

  @override
  State<MoviesListScreen> createState() => _MoviesListScreenState();
}

class _MoviesListScreenState extends State<MoviesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: BlocBuilder<MovieListCubit, MovieListState>(
        builder: (context, state) {
          switch (state) {
            case MovieListState.presentingMovies:
              return movieList(context);
            case MovieListState.loadingMovies:
              return loadingMovies();
          }
        },
      ),
    );
  }

  PreferredSizeWidget appBar(BuildContext context) {
    return CustomAppBar(
      title: 'KinoPoisk',
      trailingActions: [
        TextButton(
          onPressed: () {
            print("trailing title");
          },
          child: Icon(Icons.logout, color: Colors.tealAccent, size: 30),
        ),
      ],
      bottomWidget: appBarBottomWidget(context),
    );
  }

  Column appBarBottomWidget(BuildContext context) {
    var cubit = context.read<MovieListCubit>();
    return Column(
      spacing: 10,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              child: const Icon(
                Icons.swap_vert,
                color: Colors.tealAccent,
                size: 30,
              ),
              onPressed: () {
                print("sort button tapped");
              },
            ),
            Expanded(
              child: AppTextField(
                placeholder: "keyword",
                suffixIcon: Icon(Icons.search),
                onChanged: (text) {},
              ),
            ),
          ],
        ),

        OutlinedButton(
          style: ButtonStyle(
            minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(5),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cubit.years[cubit.selectedYearIndex].toString(),
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                size: 25,
                color: Colors.tealAccent,
              ),
            ],
          ),
          onPressed: () {
            showCupertinoModalPopup(
              context: context,
              builder: (_) {
                return SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: CupertinoPicker(
                    backgroundColor: Colors.black87,
                    itemExtent: 50,
                    scrollController: FixedExtentScrollController(
                      initialItem: cubit.selectedYearIndex,
                    ),

                    children: cubit.years
                        .map(
                          (e) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text(e.toString())],
                          ),
                        )
                        .toList(),
                    onSelectedItemChanged: (int value) {
                      setState(() {
                        cubit.selectedYearIndex = value;
                      });
                    },
                  ),
                );
              },
            );
          },
        ),
      ],
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
  }
}
