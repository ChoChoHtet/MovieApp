import 'package:module_3_movies_app/data/vos/actors_vo.dart';
import 'package:module_3_movies_app/data/vos/genre_vo.dart';
import 'package:module_3_movies_app/data/vos/movie_vo.dart';
import 'package:scoped_model/scoped_model.dart';

abstract class MovieModel extends Model {
  // Remote
  void getNowPlayingMovies();

  void getPopularMovies();

  void getTopRatedMovies();

  void getMoviesByGenreId(int genreId);

  void getGenres();

  void getActors();

  void getMovieDetails(int movieId);

  void getMovieCredit(int movieId);

  // Database
  void getNowPlayingFromDatabase();

  void getPopularFromDatabase();

  void getTopRatedFromDatabase();

  void getGenresFromDatabase();

  void getActorsFromDatabase();

 void getMovieDetailFromDatabase(int movieId);
}
