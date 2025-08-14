import 'package:bloc/bloc.dart';
import 'package:kinopoisk/modules/movie_list/cubit/state/movie_list_filters.dart';
import 'package:kinopoisk/modules/movie_list/cubit/state/movie_list_state.dart';
import 'package:kinopoisk/modules/movie_list/cubit/state/sort_order.dart';
import 'package:kinopoisk/modules/movie_list/models/movie_list_response.dart';
import 'package:kinopoisk/services/network_service/network_service.dart';
import 'package:kinopoisk/services/shared_preferences_service.dart';

class MovieListCubit extends Cubit<MovieListState> {
  final NetworkService networkService = NetworkService.create();
  final SharedPreferencesService userPrefs = SharedPreferencesServiceImpl();

  final List<int> years = List.generate(
    75,
    (id) => id + 1951,
  ).reversed.toList();
  int selectedYearIndex = 0;

  MovieListCubit() : super(MovieListState()) {
    _loadingMovies(state.filters);
  }

  @override
  void onChange(Change<MovieListState> change) {
    super.onChange(change);
    if (change.nextState.isLoading) {
      _loadingMovies(change.nextState.filters);
    }
  }

  void logout() {
    userPrefs.clear();
  }

  void updateOrder() {
    var newFilters = state.filters.copyWith(order: SortOrder.rating);
    var newState = state.copyWith(filters: newFilters, isLoading: true);
    emit(newState);
  }

  void handleSearch(String text) {
    var filteredMovies = state.movies;
    if (text.isNotEmpty) {
      filteredMovies = filteredMovies.where((element) {
        final nameEn = (element.nameEn ?? "").toLowerCase().contains(text);
        final nameRu = (element.nameOriginal ?? "").toLowerCase().contains(
          text,
        );
        final nameOr = (element.nameRu ?? "").toLowerCase().contains(text);

        return nameEn || nameRu || nameOr;
      }).toList();
    }
    var newState = state.copyWith(filteredMovies: filteredMovies);
    emit(newState);
  }

  void updateYear(int index) {
    selectedYearIndex = index;
    var year = years[selectedYearIndex];
    final newFilters = state.filters.copyWith(
      year: year,
      order: SortOrder.year,
    );
    final newState = state.copyWith(filters: newFilters, isLoading: true);
    emit(newState);
  }

  void _loadingMovies(MovieListFilters filters) async {
    var res = await networkService.getMovies(
      filters.order.value,
      filters.year,
      filters.year,
    );

    if (res.body != null) {
      var movies = MovieListResponse.fromJson(res.body).items;
      var newState = state.copyWith(
        movies: movies,
        filteredMovies: movies,
        isLoading: false,
      );
      emit(newState);
    }
  }
}
