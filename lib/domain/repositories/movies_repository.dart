import '../entities/movie.dart';

abstract class MoviesRepository {

  
  Future<List<Movie>> getNowPlaying({int page = 1});
  Future<List<Movie>> getPopular({int page = 1});
  Future<List<Movie>> getUpcoming({int page = 1});
  Future<List<Movie>> getTopRead({int page = 1});
  Future<Movie> getMovieById(String id);

}

// los repositorios llamana al data source u originees de datos