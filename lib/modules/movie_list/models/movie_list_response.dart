import "package:json_annotation/json_annotation.dart";

part 'movie_list_response.g.dart';

@JsonSerializable()
class MovieListResponse {
  int total;
  int totalPages;
  List<Movie> items;

  MovieListResponse({
    required this.total,
    required this.totalPages,
    required this.items,
  });

  factory MovieListResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListResponseToJson(this);
}

@JsonSerializable()
class Movie {
  int kinopoiskId;
  String? imdbId;
  String? nameRu;
  String? nameEn;
  String? nameOriginal;
  List<Country> countries;
  List<Genre> genres;
  double? ratingKinopoisk;
  double? ratingImdb;
  int year;
  Type type;
  String posterUrl;
  String posterUrlPreview;

  Movie({
    required this.kinopoiskId,
    required this.imdbId,
    required this.nameRu,
    required this.nameEn,
    required this.nameOriginal,
    required this.countries,
    required this.genres,
    required this.ratingKinopoisk,
    required this.ratingImdb,
    required this.year,
    required this.type,
    required this.posterUrl,
    required this.posterUrlPreview,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

@JsonSerializable()
class Country {
  String country;

  Country({required this.country});

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

@JsonSerializable()
class Genre {
  String genre;

  Genre({required this.genre});

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

enum Type { FILM, MINI_SERIES, TV_SERIES, VIDEO, TV_SHOW }
