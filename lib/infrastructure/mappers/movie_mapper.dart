import 'package:cinemapedia/domain/entities/movie.dart';

import '../models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBtoEntity(MovieMovieDB moviedb) => Movie(
        adult: moviedb.adult,
        backdropPath: moviedb.backdropPath != '' ? 'https://image.tmdb.org/t/p/w500/${moviedb.backdropPath}': 'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg',
        // esta propiedad es de enteros y no puede ser pasado a string
        genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
        id: moviedb.id,
        originalLanguage: moviedb.originalLanguage,
        originalTitle: moviedb.originalTitle,
        overview: moviedb.overview,
        popularity: moviedb.popularity,
        posterPath: (moviedb.posterPath != '') ? 'https://image.tmdb.org/t/p/w500/${moviedb.backdropPath}' :'no-poster',
        releaseDate: moviedb.releaseDate,
        title: moviedb.title,
        video: moviedb.video,
        voteAverage: moviedb.voteAverage, 
        voteCount: moviedb.voteCount,
      );
}
