import 'package:module_3_movies_app/data/vos/actors_vo.dart';
import 'package:module_3_movies_app/data/vos/genre_vo.dart';
import 'package:module_3_movies_app/data/vos/movie_vo.dart';

abstract class MovieModel {
  // Remote
  void getNowPlayingMovies(int page);

  void getPopularMovies();

  void getTopRatedMovies();

  Future<List<MovieVO>?> getMoviesByGenreId(int genreId);

  Future<List<GenreVO>?> getGenres();

  Future<List<ActorsVO>?> getActors();

  Future<MovieVO?> getMovieDetails(int movieId);

  Future<List<List<ActorsVO>?>> getMovieCredit(int movieId);

  // Database
  Stream<List<MovieVO>?> getNowPlayingFromDatabase(int page);

  Stream<List<MovieVO>?> getPopularFromDatabase();

  Stream<List<MovieVO>?> getTopRatedFromDatabase();

  Future<List<GenreVO>?> getGenresFromDatabase();

  Future<List<ActorsVO>?> getActorsFromDatabase();

  Future<MovieVO?> getMovieDetailFromDatabase(int movieId);
}
