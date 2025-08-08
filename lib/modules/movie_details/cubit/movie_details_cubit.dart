import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsCubitState> {
  final int movieId;
  MovieDetailsCubit(this.movieId) : super(MovieDetailsCubitInitial());
}
