part of 'movie_details_cubit.dart';

final class MovieDetailsCubitState {
  final bool isLoading;
  final MovieDetailsResponse? details;

  MovieDetailsCubitState(this.isLoading, this.details);

  MovieDetailsCubitState copyWith(
    MovieDetailsResponse? details,
    bool? isLoading,
  ) {
    return MovieDetailsCubitState(isLoading ?? this.isLoading, details);
  }
}
