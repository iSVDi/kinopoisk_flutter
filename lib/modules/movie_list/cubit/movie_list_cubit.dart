import 'package:bloc/bloc.dart';
import 'package:kinopoisk/modules/movie_list/models/movie_list_response.dart';
import 'package:kinopoisk/services/network_service/network_service.dart';
import 'package:kinopoisk/services/shared_preferences_service.dart';

part 'movie_list_state.dart';

class MovieListCubit extends Cubit<MovieListState> {
  final NetworkService networkService = NetworkService.create();
  final SharedPreferencesService userPrefs = SharedPreferencesServiceImpl();

  List<Movie> movies = [];

  MovieListCubit() : super(MovieListState.loadingMovies) {
    _loadingMovies();
  }

  void _loadingMovies() async {
    var res = await networkService.getMovies();
    movies = MovieListResponse.fromJson(res.body).items;
    emit(MovieListState.presentingMovies);
  }
}
