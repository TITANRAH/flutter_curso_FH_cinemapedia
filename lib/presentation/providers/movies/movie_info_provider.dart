import 'package:cinemapedia/presentation/providers/movies/movies_repository_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/movie.dart';

final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider);

  // este provider pide el getMovie que se obtiene del repositorio de la implementacion
  // el archivo que se instancia de movieRepository contiene la implementacion
  // en donde a su vez contiene el datasource que a su vez contiene el metodo que a su vez
  // realiza la peticion http

  return MovieMapNotifier(getMovie: movieRepository.getMovieById);
});

// creo la definicion de un callback para traer una pelicula
// lo que realize este callback lo realizara con la pelicula que traiga la peticion http
//  ya que finalmente es pasada como parametro y arriba el el provider
// el parametro que se le pasa es la funcion http que trae la movie
typedef GetMovieCallback = Future<Movie> Function(String movieId);

// el state viene de la clase statenotifier

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  // aca le pongo el nombre al callback definido arriba que traera mi pelicula
  final GetMovieCallback getMovie;

  MovieMapNotifier({
    required this.getMovie,
  }) : super({});

  Future<void> loadMovie(String movieId) async {
    // si el estado ya tiene una pelicula con ese id no hagas nada
    // si la condicion no se cumple continua con la funcionalidad
    if (state[movieId] != null) return;

    // aca digo que la movie es igual a lo que retorne el callback
    // y como getMovie es el parametro de esta clase que se implementa arriba
    // en el provider y arriba se le da el valor de la peticion http
    // podriamos decir que aca se realiza la peticion http
    print('realizando peticion http');
    final movie = await getMovie(movieId);

    // ahora actualizo el state que es finalmente  el mapa
    // con los ids de movies

    state = {...state, movieId: movie};

    // luego viene crear el provider que este moviemapnotifier necesita
  }
}

// todo terminara guardando en cahce algo asi este es el Map<String, Movie>:

// {

//   '454567': Movie()
//   '454567': Movie()
//   '656754': Movie()
//   '451246': Movie()
// }
