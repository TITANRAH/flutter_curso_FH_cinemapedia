// este repositorio es inmutable Provider es inmutable
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../infrastructure/datasources/actor_moviedb_datasource.dart';
import '../../../infrastructure/repositories/actor_repositoy_impl.dart';

final actorsRepositoryProvider = Provider((ref) {
  // le envio a la implementacion la obtencion de datos 
  return ActorsRepositoryImpl(ActorMovieDbDatasource());
});
