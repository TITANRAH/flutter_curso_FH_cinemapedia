import '../entities/movie.dart';

abstract class MoviesRepository {

  
  Future<List<Movie>> getNowPlaying({int page = 1});

}

// los repositorios llamana al data source u originees de datos