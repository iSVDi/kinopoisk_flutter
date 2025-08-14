import 'package:bloc/bloc.dart';
import 'package:kinopoisk/modules/movie_details/models/movie_details_response.dart';
import 'package:kinopoisk/services/network_service/network_service.dart';
import 'package:url_launcher/url_launcher.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsCubitState> {
  final int movieId;
  final NetworkService networkService = NetworkService.create();

  MovieDetailsCubit(this.movieId) : super(MovieDetailsCubitState(false, null)) {
    loadDetails();
  }

  void loadDetails() async {
    final detailsData = await networkService.getMovieDetails(movieId);
    final details = MovieDetailsResponse.fromJson(detailsData.body);
    final imageUrlsData = await networkService.getImagesForMovie(movieId);
    final images = MovieImageResponse.fromJson(imageUrlsData.body);
    details.images = images;

    emit(state.copyWith(details, false));
  }

  Future<void> launchInBrowserView(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
