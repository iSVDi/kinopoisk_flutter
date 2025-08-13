import 'package:json_annotation/json_annotation.dart';
import 'package:kinopoisk/modules/movie_list/models/movie_list_response.dart';

part 'movie_details_response.g.dart';

@JsonSerializable()
final class MovieDetailsResponse {
  final int kinopoiskId;
  final int? kinopoiskHdId;
  final String? imdbId;
  final String? nameRu;
  final String? nameEn;
  final String? nameOriginal;
  final String posterUrl;
  final String posterUrlPreview;
  final String? coverUrl;
  final String? logoUrl;
  final int reviewsCount;
  final int? ratingGoodReview;
  final int ratingGoodReviewVoteCount;
  final double? ratingKinopoisk;
  final int ratingKinopoiskVoteCount;
  final double? ratingImdb;
  final int ratingImdbVoteCount;
  final double? ratingFilmCritics;
  final int ratingFilmCriticsVoteCount;
  final double? ratingAwait;
  final int ratingAwaitCount;
  final double? ratingRfCritics;
  final int? ratingRfCriticsVoteCount;
  final String webUrl;
  final int year;
  final int? filmLength;
  final String? slogan;
  final String description;
  final String? shortDescription;
  final String? editorAnnotation;
  final bool isTicketsAvailable;
  final String? productionStatus;
  final String type;
  final String? ratingMpaa;
  final String? ratingAgeLimits;
  final List<Country> countries;
  final List<Genre> genres;
  final int? startYear;
  final int? endYear;
  final bool serial;
  final bool shortFilm;
  final bool completed;
  final bool hasImax;
  final bool has3D;
  final DateTime lastSync;
  MovieImageResponse? images;

  MovieDetailsResponse(
    this.images, {
    required this.kinopoiskId,
    required this.kinopoiskHdId,
    required this.imdbId,
    required this.nameRu,
    required this.nameEn,
    required this.nameOriginal,
    required this.posterUrl,
    required this.posterUrlPreview,
    required this.coverUrl,
    required this.logoUrl,
    required this.reviewsCount,
    required this.ratingGoodReview,
    required this.ratingGoodReviewVoteCount,
    required this.ratingKinopoisk,
    required this.ratingKinopoiskVoteCount,
    required this.ratingImdb,
    required this.ratingImdbVoteCount,
    required this.ratingFilmCritics,
    required this.ratingFilmCriticsVoteCount,
    required this.ratingAwait,
    required this.ratingAwaitCount,
    required this.ratingRfCritics,
    required this.ratingRfCriticsVoteCount,
    required this.webUrl,
    required this.year,
    required this.filmLength,
    required this.slogan,
    required this.description,
    required this.shortDescription,
    required this.editorAnnotation,
    required this.isTicketsAvailable,
    required this.productionStatus,
    required this.type,
    required this.ratingMpaa,
    required this.ratingAgeLimits,
    required this.countries,
    required this.genres,
    required this.startYear,
    required this.endYear,
    required this.serial,
    required this.shortFilm,
    required this.completed,
    required this.hasImax,
    required this.has3D,
    required this.lastSync,
  });

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsResponseToJson(this);
}

@JsonSerializable()
final class MovieImageResponse {
  final List<MovieImage> items;

  MovieImageResponse({required this.items});

    factory MovieImageResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieImageResponseToJson(this);
}

@JsonSerializable()
final class MovieImage {
  final String imageUrl;
  final String previewUrl;

  MovieImage(this.imageUrl, this.previewUrl);

  factory MovieImage.fromJson(Map<String, dynamic> json) =>
      _$MovieImageFromJson(json);

  Map<String, dynamic> toJson() => _$MovieImageToJson(this);
}
