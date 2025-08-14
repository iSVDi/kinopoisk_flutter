import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kinopoisk/components/custom_app_bar.dart';
import 'package:kinopoisk/components/loading_widget.dart';
import 'package:kinopoisk/modules/movie_details/cubit/movie_details_cubit.dart';
import 'package:kinopoisk/modules/movie_details/models/movie_details_response.dart';
import 'package:kinopoisk/modules/movie_list/models/movie_list_response.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsCubitState>(
      builder: (context, state) {
        return Scaffold(body: getBody(context));
      },
    );
  }

  Widget getBody(BuildContext context) {
    final cubit = context.read<MovieDetailsCubit>();
    cubit.loadDetails;

    Widget widget = Spacer();
    if (cubit.state.isLoading) {
      widget = LoadingWidget();
    } else if (cubit.state.details != null) {
      widget = getMovieDetails(context, cubit.state.details!);
    }

    return Center(child: widget);
  }

  Widget getMovieDetails(BuildContext context, MovieDetailsResponse details) {
    return ListView(
      padding: EdgeInsets.only(),
      children: [
        getPosterWidget(
          context,
          details.posterUrl,
          details.nameRu ?? details.nameOriginal ?? details.nameEn ?? "",
          details.ratingKinopoisk,
        ),
        descriptionWidget(context, details),
        getImagesWidget(details.images),
      ],
    );
  }

  Widget getPosterWidget(
    BuildContext context,
    String posterUrl,
    String title,
    double? rating,
  ) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Image.network(posterUrl, fit: BoxFit.cover),
        ),
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getBar(context),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(
                      rating.toString(),
                      style: TextStyle(
                        color: Colors.tealAccent,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  CustomAppBar getBar(BuildContext context) {
    return CustomAppBar(
      title: "",
      leadingActions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_new_sharp,
            size: 30,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget descriptionWidget(BuildContext context, MovieDetailsResponse details) {
    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Описание",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextButton(
          style: ButtonStyle(
            // alignment: Alignment(30, 0),
            padding: WidgetStatePropertyAll(EdgeInsetsGeometry.zero),
          ),
          onPressed: () {
            context.read<MovieDetailsCubit>().launchInBrowserView(
              details.webUrl,
            );
          },
          child: Icon(Icons.link, color: Colors.teal, size: 20),
        ),
      ],
    );
    var description = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          details.description ?? "",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          details.genres.map((e) => e.genre).toList().join(", "),
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          _getYearCountryTitle(
            details.startYear,
            details.endYear,
            details.countries,
          ),
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(children: [header, description]),
    );
  }

  String _getYearCountryTitle(
    int? startYear,
    int? endYear,
    List<Country> countries,
  ) {
    String res = "";

    if (startYear != null) {
      res = startYear.toString();
      if (endYear != null) {
        res += "-${endYear.toString()}";
      }
      res += ",";
    }

    res += countries.map((e) => e.country).toList().join(", ");

    return res;
  }

  Widget getImagesWidget(MovieImageResponse? imageDetails) {
    Widget imagesWidget = SizedBox();

    if (imageDetails != null) {
      imagesWidget = SizedBox(
        height: 150,
        child: ListView.separated(
          padding: EdgeInsetsGeometry.zero,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, i) {
            return Image.network(
              imageDetails.items[i].imageUrl,
              width: 250,
              height: 250,
              fit: BoxFit.fitHeight,
            );
          },
          separatorBuilder: (_, id) => SizedBox(width: 15),
          itemCount: imageDetails.items.length,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Кадры",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          imagesWidget,
        ],
      ),
    );
  }
}
