
import 'package:cinemapedia/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../infrastructure/datasources/moviedb_datasource.dart';

// este repositorio es inmutable Provider es inmutable
final movieRepositoryProvider = Provider((ref) {
  // le envio a la implementacion la obtencion de datos 
  return MovieRepositoryImpl(MoviedbDatasource());
});
