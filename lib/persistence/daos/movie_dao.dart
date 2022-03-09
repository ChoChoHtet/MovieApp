import 'package:hive/hive.dart';
import 'package:module_3_movies_app/persistence/hive_constants.dart';

import '../../data/vos/movie_vo.dart';

class MovieDao {
  static final MovieDao _singleton = MovieDao._internal();

  MovieDao._internal();

  factory MovieDao() {
    return _singleton;
  }

  void saveAllMovies(List<MovieVO> movieList) async {
    Map<int, MovieVO> movieMap = Map.fromIterable(movieList,
        key: (movie) => movie.id, value: (movie) => movie);
    await getMovieBox().putAll(movieMap);
  }

  void saveSingleMovie(MovieVO movie) {
    getMovieBox().put(movie.id, movie);
  }

  List<MovieVO> getAllMovies() {
    return getMovieBox().values.toList();
  }

  MovieVO? getMoviesById(int movieId) {
    return getMovieBox().get(movieId);
  }

  Box<MovieVO> getMovieBox() {
    return Hive.box(BOX_NAMES_MOVIE_VO);
  }

  /// Reactive Programming

  Stream<void> getAllMovieEventStream(){
    return getMovieBox().watch();
  }
  Stream<List<MovieVO>> getPopularMovieStream() {
    return Stream.value(getAllMovies()
       // .where((element) => element.isPopular ?? false)
        .toList());
  }

  Stream<List<MovieVO>> getNowPlayingMovieStream() {
    return Stream.value(getAllMovies()
        //.where((element) => element.isNowPlaying ?? false)
        .toList());
  }
  Stream<List<MovieVO>> getTopRatedMovieStream() {
    return Stream.value(getAllMovies()
       // .where((element) => element.isTopRated ?? false)
        .toList());
  }
}
