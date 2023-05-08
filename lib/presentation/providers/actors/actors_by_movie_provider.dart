import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/actor.dart';
import '../../../domain/entities/movie.dart';

final actorsByMovieProvider = StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>((ref) {
  final actorsRepository = ref.watch(actorsRepositoryProvider);

  return ActorsByMovieNotifier( getActors: actorsRepository.getActorsByMovie);
});


typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);


class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
 
  final GetActorsCallback getActors;

  ActorsByMovieNotifier({
    required this.getActors,
    // inicia con un mapa vacio
  }) : super({});

  Future<void> loadActors(String movieId) async {
  
    if (state[movieId] != null) return;

   
    print('realizando peticion http');
    final actors = await getActors(movieId);


    state = {...state, movieId: actors};

   
  }
}

// todo terminara guardando en cahce algo asi este es el Map<String, Movie>:

// {

//   '454567': Actor()
//   '454567': Actor()
//   '656754': Actor()
//   '451246': Actor()
// }
