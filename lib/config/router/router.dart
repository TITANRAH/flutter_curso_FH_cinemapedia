import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
        path: '/',
        name: HomeScreen.name,
        builder: (context, state) => const HomeScreen(),
       
      //  estas seran las rutas hijas para que en web siempre de la flechita de volver
        routes: [
          GoRoute(
            path: 'movie/:id',
            name: MovieScreen.name,
            builder: (context, state) {
              final movieId = state.pathParameters['id'] ?? 'no-id';
              return MovieScreen(
                movieId: movieId,
              );
            },
          )
        ]),
  ],
);


// para obteber parametros de url asi se hace , en el widget defino un 
// parametro llamado movieId y aqui lo llamo y le digo que movieId sera 
// este movie id  final movieId = state.pathParameters['id'] ?? 'no-id';
// luego desde el home screen al clickear una imagen 
// me lleva al widget a traves de la ruta /movie/${movie.id} 
// y asi obtengo el id de la pelicula y la llevo a su widget individual
