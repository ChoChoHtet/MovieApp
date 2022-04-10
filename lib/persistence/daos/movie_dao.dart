import 'package:hive/hive.dart';
import 'package:module_3_movies_app/persistence/hive_constants.dart';

import '../../data/vos/movie_vo.dart';

abstract class MovieDao {
  void saveAllMovies(List<MovieVO> movieList);

  void saveSingleMovie(MovieVO movie);

  List<MovieVO> getAllMovies();

  MovieVO? getMoviesById(int movieId);

  Stream<void> getAllMovieEventStream();

  Stream<List<MovieVO>> getPopularMovieStream();

  Stream<List<MovieVO>> getNowPlayingMovieStream();

  Stream<List<MovieVO>> getTopRatedMovieStream();

  List<MovieVO> getPopularMovies();

  List<MovieVO> getTopRatedMovies();

  List<MovieVO> getNowPlayingMovies();
}
