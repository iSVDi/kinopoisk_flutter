// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListResponse _$MovieListResponseFromJson(Map<String, dynamic> json) =>
    MovieListResponse(
      total: (json['total'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieListResponseToJson(MovieListResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'totalPages': instance.totalPages,
      'items': instance.items,
    };

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
  kinopoiskId: (json['kinopoiskId'] as num).toInt(),
  imdbId: json['imdbId'] as String?,
  nameRu: json['nameRu'] as String?,
  nameEn: json['nameEn'],
  nameOriginal: json['nameOriginal'] as String?,
  countries: (json['countries'] as List<dynamic>)
      .map((e) => Country.fromJson(e as Map<String, dynamic>))
      .toList(),
  genres: (json['genres'] as List<dynamic>)
      .map((e) => Genre.fromJson(e as Map<String, dynamic>))
      .toList(),
  ratingKinopoisk: (json['ratingKinopoisk'] as num?)?.toDouble(),
  ratingImdb: (json['ratingImdb'] as num?)?.toDouble(),
  year: (json['year'] as num).toInt(),
  type: $enumDecode(_$TypeEnumMap, json['type']),
  posterUrl: json['posterUrl'] as String,
  posterUrlPreview: json['posterUrlPreview'] as String,
);

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
  'kinopoiskId': instance.kinopoiskId,
  'imdbId': instance.imdbId,
  'nameRu': instance.nameRu,
  'nameEn': instance.nameEn,
  'nameOriginal': instance.nameOriginal,
  'countries': instance.countries,
  'genres': instance.genres,
  'ratingKinopoisk': instance.ratingKinopoisk,
  'ratingImdb': instance.ratingImdb,
  'year': instance.year,
  'type': _$TypeEnumMap[instance.type]!,
  'posterUrl': instance.posterUrl,
  'posterUrlPreview': instance.posterUrlPreview,
};

const _$TypeEnumMap = {
  Type.FILM: 'FILM',
  Type.MINI_SERIES: 'MINI_SERIES',
  Type.TV_SERIES: 'TV_SERIES',
  Type.VIDEO: 'VIDEO',
  Type.TV_SHOW: 'TV_SHOW',
};

Country _$CountryFromJson(Map<String, dynamic> json) =>
    Country(country: json['country'] as String);

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
  'country': instance.country,
};

Genre _$GenreFromJson(Map<String, dynamic> json) =>
    Genre(genre: json['genre'] as String);

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
  'genre': instance.genre,
};
