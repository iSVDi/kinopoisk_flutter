import 'package:kinopoisk/modules/movie_list/cubit/state/sort_order.dart';

class MovieListFilters {
  final SortOrder order;
  final int year;

  const MovieListFilters({required this.order, required this.year});

  MovieListFilters copyWith({SortOrder? order, int? year}) {
    return MovieListFilters(
      order: order ?? this.order,
      year: year ?? this.year,
    );
  }

  // Convert to API query parameters
  Map<String, dynamic> toApiParams() {
    final params = <String, dynamic>{};
    params['order'] = order;
    params['year'] = year;
    return params;
  }

  @override
  List<Object?> get props => [order, year];
}
