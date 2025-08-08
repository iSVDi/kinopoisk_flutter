import 'package:kinopoisk/modules/movie_list/cubit/state/movie_list_filters.dart';
import 'package:kinopoisk/modules/movie_list/cubit/state/sort_order.dart';
import 'package:kinopoisk/modules/movie_list/models/movie_list_response.dart';

class MovieListState {
  final List<Movie> movies;
  final List<Movie> filteredMovies; // For local search filtering
  final bool isLoading;
  final bool isLoadingMore; // For pagination loading
  final bool hasReachedMax; // No more pages available
  final String? errorMessage;
  final MovieListFilters filters;
  final int currentPage;
  final String searchText; // Local search text

  const MovieListState({
    this.movies = const [],
    this.filteredMovies = const [],
    this.isLoading = true,
    this.isLoadingMore = false,
    this.hasReachedMax = false,
    this.errorMessage,
    this.filters = const MovieListFilters(year: 2025, order: SortOrder.rating),
    this.currentPage = 1,
    this.searchText = '',
  });

  // Convenience getters
  bool get isEmpty => movies.isEmpty && !isLoading;
  bool get hasError => errorMessage != null;
  List<Movie> get displayMovies => searchText.isEmpty ? movies : filteredMovies;

  MovieListState copyWith({
    List<Movie>? movies,
    List<Movie>? filteredMovies,
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasReachedMax,
    String? errorMessage,
    MovieListFilters? filters,
    int? currentPage,
    String? searchText,
  }) {
    return MovieListState(
      movies: movies ?? this.movies,
      filteredMovies: filteredMovies ?? this.filteredMovies,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage,
      filters: filters ?? this.filters,
      currentPage: currentPage ?? this.currentPage,
      searchText: searchText ?? this.searchText,
    );
  }

  // Clear error state
  MovieListState clearError() {
    return copyWith(errorMessage: null);
  }

  @override
  List<Object?> get props => [
    movies,
    filteredMovies,
    isLoading,
    isLoadingMore,
    hasReachedMax,
    errorMessage,
    filters,
    currentPage,
    searchText,
  ];
}
