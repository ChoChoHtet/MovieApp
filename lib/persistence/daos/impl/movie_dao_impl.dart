import 'package:hive/hive.dart';
import 'package:module_3_movies_app/persistence/daos/movie_dao.dart';
import 'package:module_3_movies_app/persistence/hive_constants.dart';

import '../../../data/vos/movie_vo.dart';


class MovieDaoImpl  extends MovieDao{
  static final MovieDaoImpl _singleton = MovieDaoImpl._internal();

  MovieDaoImpl._internal();

  factory MovieDaoImpl() {
    return _singleton;
  }

  @override
  void saveAllMovies(List<MovieVO> movieList) async {
    Map<int, MovieVO> movieMap = Map.fromIterable(movieList,
        key: (movie) => movie.id, value: (movie) => movie);
    await getMovieBox().putAll(movieMap);
  }

  @override
  void saveSingleMovie(MovieVO movie) {
    getMovieBox().put(movie.id, movie);
  }

  @override
  List<MovieVO> getAllMovies() {
    return getMovieBox().values.toList();
  }

  @override
  MovieVO? getMoviesById(int movieId) {
    return getMovieBox().get(movieId);
  }

  Box<MovieVO> getMovieBox() {
    return Hive.box(BOX_NAMES_MOVIE_VO);
  }

  /// Reactive Programming

  @override
  Stream<void> getAllMovieEventStream(){
    return getMovieBox().watch();
  }

  @override
  Stream<List<MovieVO>> getPopularMovieStream() {
    return Stream.value(getAllMovies()
        .where((element) => element.isPopular ?? false)
        .toList());
  }

  @override
  Stream<List<MovieVO>> getNowPlayingMovieStream() {
    return Stream.value(getAllMovies()
        .where((element) => element.isNowPlaying ?? false)
        .toList());
  }

  @override
  Stream<List<MovieVO>> getTopRatedMovieStream() {
    return Stream.value(getAllMovies()
        .where((element) => element.isTopRated ?? false)
        .toList());
  }

  @override
  List<MovieVO> getPopularMovies() {
    if( getAllMovies().isNotEmpty){
      return getAllMovies()
          .where((element) => element.isPopular ?? false).toList();
    }else{
      return [];
    }
  }

  @override
  List<MovieVO> getTopRatedMovies() {
    if( getAllMovies().isNotEmpty){
      return getAllMovies()
          .where((element) => element.isTopRated ?? false).toList();
    }else{
      return [];
    }
  }

  @override
  List<MovieVO> getNowPlayingMovies() {
    if( getAllMovies().isNotEmpty){
      return getAllMovies()
          .where((element) => element.isNowPlaying ?? false).toList();
    }else{
      return [];
    }
  }
}
