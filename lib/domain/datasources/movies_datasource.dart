import '../entities/movie.dart';

abstract class MoviesDataSource {

  
  Future<List<Movie>> getNowPlaying({int page = 1});

  Future<List<Movie>> getPopular({int page = 1});
  Future<List<Movie>> getUpcoming({int page = 1});
  Future<List<Movie>> getTopRead({int page = 1});



}

// comenzamos creando un metodo y debe ir exactamente igual en 
// el directorio de movies repositories dentro de domain 

// luego en el directorio de infraestrucura donde extiende de esta clase 
// hay que arreglar el error del override este lugar es donde creo las llamadas http

// luego dara problemas el repositorio de infraestructura
// hay que arreglar el override por que esta clase de implementacion 
// extiende del repositorio de domain movies_repository

// luego voy a los provider a realizar lo mismo que para obtener peliculas 
// pero ahora para las populares

// luego en presentacion en el home screen instancio los nuevos
// provider y los uso

