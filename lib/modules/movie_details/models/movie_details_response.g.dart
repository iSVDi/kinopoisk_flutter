// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsResponse _$MovieDetailsResponseFromJson(
  Map<String, dynamic> json,
) => MovieDetailsResponse(
  json['images'] == null
      ? null
      : MovieImageResponse.fromJson(json['images'] as Map<String, dynamic>),
  kinopoiskId: (json['kinopoiskId'] as num).toInt(),
  kinopoiskHdId: (json['kinopoiskHdId'] as num?)?.toInt(),
  imdbId: json['imdbId'] as String?,
  nameRu: json['nameRu'] as String?,
  nameEn: json['nameEn'] as String?,
  nameOriginal: json['nameOriginal'] as String?,
  posterUrl: json['posterUrl'] as String,
  posterUrlPreview: json['posterUrlPreview'] as String,
  coverUrl: json['coverUrl'] as String?,
  logoUrl: json['logoUrl'] as String?,
  reviewsCount: (json['reviewsCount'] as num).toInt(),
  ratingGoodReview: (json['ratingGoodReview'] as num?)?.toInt(),
  ratingGoodReviewVoteCount: (json['ratingGoodReviewVoteCount'] as num).toInt(),
  ratingKinopoisk: (json['ratingKinopoisk'] as num?)?.toDouble(),
  ratingKinopoiskVoteCount: (json['ratingKinopoiskVoteCount'] as num).toInt(),
  ratingImdb: (json['ratingImdb'] as num?)?.toDouble(),
  ratingImdbVoteCount: (json['ratingImdbVoteCount'] as num).toInt(),
  ratingFilmCritics: (json['ratingFilmCritics'] as num?)?.toDouble(),
  ratingFilmCriticsVoteCount: (json['ratingFilmCriticsVoteCount'] as num)
      .toInt(),
  ratingAwait: (json['ratingAwait'] as num?)?.toDouble(),
  ratingAwaitCount: (json['ratingAwaitCount'] as num).toInt(),
  ratingRfCritics: (json['ratingRfCritics'] as num?)?.toDouble(),
  ratingRfCriticsVoteCount: (json['ratingRfCriticsVoteCount'] as num?)?.toInt(),
  webUrl: json['webUrl'] as String,
  year: (json['year'] as num).toInt(),
  filmLength: (json['filmLength'] as num?)?.toInt(),
  slogan: json['slogan'] as String?,
  description: json['description'] as String,
  shortDescription: json['shortDescription'] as String?,
  editorAnnotation: json['editorAnnotation'] as String?,
  isTicketsAvailable: json['isTicketsAvailable'] as bool,
  productionStatus: json['productionStatus'] as String?,
  type: json['type'] as String,
  ratingMpaa: json['ratingMpaa'] as String?,
  ratingAgeLimits: json['ratingAgeLimits'] as String?,
  countries: (json['countries'] as List<dynamic>)
      .map((e) => Country.fromJson(e as Map<String, dynamic>))
      .toList(),
  genres: (json['genres'] as List<dynamic>)
      .map((e) => Genre.fromJson(e as Map<String, dynamic>))
      .toList(),
  startYear: (json['startYear'] as num?)?.toInt(),
  endYear: (json['endYear'] as num?)?.toInt(),
  serial: json['serial'] as bool,
  shortFilm: json['shortFilm'] as bool,
  completed: json['completed'] as bool,
  hasImax: json['hasImax'] as bool,
  has3D: json['has3D'] as bool,
  lastSync: DateTime.parse(json['lastSync'] as String),
);

Map<String, dynamic> _$MovieDetailsResponseToJson(
  MovieDetailsResponse instance,
) => <String, dynamic>{
  'kinopoiskId': instance.kinopoiskId,
  'kinopoiskHdId': instance.kinopoiskHdId,
  'imdbId': instance.imdbId,
  'nameRu': instance.nameRu,
  'nameEn': instance.nameEn,
  'nameOriginal': instance.nameOriginal,
  'posterUrl': instance.posterUrl,
  'posterUrlPreview': instance.posterUrlPreview,
  'coverUrl': instance.coverUrl,
  'logoUrl': instance.logoUrl,
  'reviewsCount': instance.reviewsCount,
  'ratingGoodReview': instance.ratingGoodReview,
  'ratingGoodReviewVoteCount': instance.ratingGoodReviewVoteCount,
  'ratingKinopoisk': instance.ratingKinopoisk,
  'ratingKinopoiskVoteCount': instance.ratingKinopoiskVoteCount,
  'ratingImdb': instance.ratingImdb,
  'ratingImdbVoteCount': instance.ratingImdbVoteCount,
  'ratingFilmCritics': instance.ratingFilmCritics,
  'ratingFilmCriticsVoteCount': instance.ratingFilmCriticsVoteCount,
  'ratingAwait': instance.ratingAwait,
  'ratingAwaitCount': instance.ratingAwaitCount,
  'ratingRfCritics': instance.ratingRfCritics,
  'ratingRfCriticsVoteCount': instance.ratingRfCriticsVoteCount,
  'webUrl': instance.webUrl,
  'year': instance.year,
  'filmLength': instance.filmLength,
  'slogan': instance.slogan,
  'description': instance.description,
  'shortDescription': instance.shortDescription,
  'editorAnnotation': instance.editorAnnotation,
  'isTicketsAvailable': instance.isTicketsAvailable,
  'productionStatus': instance.productionStatus,
  'type': instance.type,
  'ratingMpaa': instance.ratingMpaa,
  'ratingAgeLimits': instance.ratingAgeLimits,
  'countries': instance.countries,
  'genres': instance.genres,
  'startYear': instance.startYear,
  'endYear': instance.endYear,
  'serial': instance.serial,
  'shortFilm': instance.shortFilm,
  'completed': instance.completed,
  'hasImax': instance.hasImax,
  'has3D': instance.has3D,
  'lastSync': instance.lastSync.toIso8601String(),
  'images': instance.images,
};

MovieImageResponse _$MovieImageResponseFromJson(Map<String, dynamic> json) =>
    MovieImageResponse(
      items: (json['items'] as List<dynamic>)
          .map((e) => MovieImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieImageResponseToJson(MovieImageResponse instance) =>
    <String, dynamic>{'items': instance.items};

MovieImage _$MovieImageFromJson(Map<String, dynamic> json) =>
    MovieImage(json['imageUrl'] as String, json['previewUrl'] as String);

Map<String, dynamic> _$MovieImageToJson(MovieImage instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'previewUrl': instance.previewUrl,
    };
