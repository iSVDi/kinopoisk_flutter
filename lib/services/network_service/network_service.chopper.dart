// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$NetworkService extends NetworkService {
  _$NetworkService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = NetworkService;

  @override
  Future<Response<dynamic>> getMovies(String order, int yearFrom, int yearTo) {
    final Uri $url = Uri.parse('/api/v2.2/films');
    final Map<String, dynamic> $params = <String, dynamic>{
      'order': order,
      'yearFrom': yearFrom,
      'yearTo': yearTo,
    };
    final Map<String, String> $headers = {
      'x-api-key': 'ea499c08-37e5-4a7d-976d-916cf7cdde35',
      'Content-Type': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
