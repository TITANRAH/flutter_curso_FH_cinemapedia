import '../entities/movie.dart';

abstract class MoviesDataSource {
  Future<List<Movie>> getNowPlaying({int page = 1});

  Future<List<Movie>> getPopular({int page = 1});
  Future<List<Movie>> getUpcoming({int page = 1});
  Future<List<Movie>> getTopRead({int page = 1});

  Future<Movie> getMovieById(String id);
}

// AQUI DEFINO SOLO COMO LUCIIRA EL METODO 


///* para crear una nueva respuesta 

// 1. creo el metodo en domain datasource solo como lucira el metodo 

// 2. lo replico en el domain-repositori solo replicarlo 

// 3. voy a la carpeta infraestrucutura-datasource y sobre escribo el metodo por que 
// la clase que contiene los llamados http extiende de esta en donde estoy escribiendo 


// 4. luego realizo el llamado http en postman para obtener el objeto 



// 5. creo mi modelo que serivira para la respuesta http (ESTE MODELO ES 
// DISTINTO DE LA ENTIDAD PARA LA APP ) este modelo me permitira mapear mi respuesta 
// hacia mi objeto personalizado , una vez tenga el modelo basado en la respuesta 
// pegarlo en donde corresponda y revisar campo por campo para ver futguros inconvenientes 
// dar una segunda opcion a propiedades que quizas puedan venir vacias (ASI propiedad ?? '')

// 6. una vez creado el modelo para recibir la respuesta vuelvo al directorio infrastrucutre
// en la carpeta datasource donde estan los llamados http ,a realizar el mapeo hacia mi objeto para respuesta 
// en este caso MovieDetails 

// 7. luego en la misma peticion http hacer el mapeo con la entidad que se usa para la app 
// para ello primero creamos el mapper en infrastucture-mapper podemos usar la misma clase Movie 
// creada para lo que ya estaba realizado de las peliculas o bien crear otra entidad , esto dentro 
// de la clase MovieMappers  

//    7.1 lo que se realiza aca es :   
   
//    static Movie movieDetailsEntity(MovieDetails moviedb) => Movie( 
//         adult: moviedb.adult,
//         backdropPath: moviedb.backdropPath != '' ? 'https://image.tmdb.org/t/p/w500/${moviedb.backdropPath}': 'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg',
//         // esta propiedad es de enteros y no puede ser pasado a string
//         genreIds: moviedb.genres.map((e) => e.toString()).toList(),
//         id: moviedb.id,
//         originalLanguage: moviedb.originalLanguage,
//         originalTitle: moviedb.originalTitle,
//         overview: moviedb.overview,
//         popularity: moviedb.popularity,
//         posterPath: moviedb.posterPath != '' ? 'https://image.tmdb.org/t/p/w500/${moviedb.posterPath}' : 'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg',
//         releaseDate: moviedb.releaseDate,
//         title: moviedb.title,
//         video: moviedb.video,
//         voteAverage: moviedb.voteAverage, 
//         voteCount: moviedb.voteCount,
//   )

//   Basicamente es crear un metodo estatico tipado con la entidad donde por 
//   parametro se le pasa el modelo , entonces todas las propiedades de la entidad 
//   seran rellenadas con las propiedades del modelo, eso es mapear
  
//   Por eso se dice que cuando el modelo cambia desde mi bd basta con cambiar el mapeo por ejem 
//   s originalLanguage sirve en mi app pero ahora se llama LenguajeOriginal , voy al modelo lo cambio 
//   y cambio valor en el mapper, pero mi entidad seguira llamandose originalLanguage


// 8. Ahora vuelvo a infrasctuture-datasource donde estan mis llamadas http y utilizo el mapper 

// 9. Una vez tenga la llamada http lista voy al repositories de infrastructure 
// y sobre escribo el metodo que le falta en la implementacion 


// 10. luego llamo la movie a traves de provider de riverpod en presentation provider 

// 11. luego debo pasar el widget a consumerstatefulwidget en movie_screen 



// para sumar una nueva respuesta


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

