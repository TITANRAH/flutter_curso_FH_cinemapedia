import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:dio/dio.dart';

import '../../config/constants/environment.dart';
import '../../domain/datasources/actor_datasource.dart';
import '../models/moviedb/credits_response.dart';

class ActorMovieDbDatasource extends ActorsDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX'
      },
    ),
  );

  List<Actor> _jsonToActors(Map<String, dynamic> json) {
    final castResponse = CreditsResponse.fromJson(json);

    final List<Actor> actors = castResponse.cast
        .map((actorDb) => ActorMapper.castToEntity(actorDb))
        .toList();

    return actors;
  }

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    // if (response.statusCode == 200) {
    //   print('status 200');
    // } else {

    //   print(response.statusCode);
    // }

    return _jsonToActors(response.data);
  }
}
