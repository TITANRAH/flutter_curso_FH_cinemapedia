import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends MoviesDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX'
      }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    // realizo la peticion
    final response = await dio.get('/movie/now_playing');

    // paso a json la respuesta la data y la igualo a MovieDbResponse
    // modelo que fue hecho para recibir la data
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    // declaro una lista llamada movies de tipo Movie entidad para la app
    // y digo que es igual al results que es una propiedad de MovieDBResponse
    // que trae una lista de movies asi igualo mi entidad de la app con la lista de peliculas tipada
    // con el modelo que recibe la respuesta http
    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBtoEntity(moviedb))
        .toList();

    print('movies $movies');

    // como dije en el modelo de results (MovieMovieDb) que si no viene el poster path poster
    // path sera igual a no-poster primero verifico que no sea no poster
    // si no es no poster realizo el mapeo pasando como paramtro la movie que viene en
    // movieDBresponse.results tomo esa moviedb en movieDBtoEntity y realizo el mapeo hacia
    // Movie que es la entidad a usarse en la app

    return movies;
  }
}
