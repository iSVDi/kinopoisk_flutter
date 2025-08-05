import 'package:bloc/bloc.dart';

part 'movie_list_state.dart';

class MovieListCubit extends Cubit<MovieListState> {
  MovieListCubit() : super(MovieListState.loadingMovies);
}
