import 'dart:async';
import 'package:chopper/chopper.dart';

part 'network_service.chopper.dart';

@ChopperApi(baseUrl: "/api/v2.2/films")
abstract class NetworkService extends ChopperService {
  static NetworkService create() {
    final client = ChopperClient(
      // baseUrl: ,
      baseUrl: Uri.https('kinopoiskapiunofficial.tech'),
      services: [_$NetworkService()],
      converter: JsonConverter(),
    );

    return _$NetworkService(client);
  }

  static const Map<String, String> _headers = {
    "x-api-key": "ea499c08-37e5-4a7d-976d-916cf7cdde35",
    "Content-Type": "application/json",
  };

  @GET(headers: NetworkService._headers)
  Future<Response> getMovies(
    @Query("order") String order,
    @Query("yearFrom") int yearFrom,
    @Query("yearTo") int yearTo,
  );

  @GET(headers: NetworkService._headers, path: "/{id}")
  Future<Response> getMovieDetails(@Path() int id);
}
