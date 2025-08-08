import 'package:bloc/bloc.dart';
import 'package:kinopoisk/modules/movie_details/models/movie_details_response.dart';
import 'package:kinopoisk/services/network_service/network_service.dart';
import 'package:meta/meta.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsCubitState> {
  final int movieId;
  final NetworkService networkService = NetworkService.create();

  MovieDetailsCubit(this.movieId) : super(MovieDetailsCubitInitial()) {
    loadDetails();
  }

  void loadDetails() async {
    final data = await networkService.getMovieDetails(movieId);
    final details = MovieDetailsResponse.fromJson(data.body);
    print(details.nameOriginal);
  }
}
