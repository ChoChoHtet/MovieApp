import 'package:module_3_movies_app/data/vos/movie_vo.dart';
import 'package:module_3_movies_app/persistence/daos/movie_dao.dart';

import '../mock_data/mock_data.dart';

class MovieDaoImplMock extends MovieDao{
  Map<int,MovieVO> movieListFromDBMock = {};
  @override
  Stream<void> getAllMovieEventStream() {
    return Stream<void>.value(null);
  }

  @override
  List<MovieVO> getAllMovies() {
   return getMockMovieForTest();
  }

  @override
  MovieVO? getMoviesById(int movieId) {
  // return movieListFromDBMock[movieId];
   return movieListFromDBMock.values.toList()
       .firstWhere((element) => element.id == movieId) ;
  }

  @override
  Stream<List<MovieVO>> getNowPlayingMovieStream() {
    return Stream.value(getAllMovies()
          .where((element) => element.isNowPlaying ?? false).toList()
    );
  }

  @override
  List<MovieVO> getNowPlayingMovies() {
    if(getAllMovies().isNotEmpty){
      return getAllMovies()
          .where((element) => element.isNowPlaying ?? false)
          .toList();
    } else return [];
  }

  @override
  Stream<List<MovieVO>> getPopularMovieStream() {
    return Stream.value(getAllMovies()
        .where((element) => element.isPopular ?? false).toList()
    );
  }

  @override
  List<MovieVO> getPopularMovies() {
    if(getAllMovies().isNotEmpty){
      return getAllMovies()
          .where((element) => element.isPopular ?? false)
          .toList();
    } else return [];
  }

  @override
  Stream<List<MovieVO>> getTopRatedMovieStream() {
    return Stream.value(getAllMovies()
        .where((element) => element.isTopRated ?? false).toList()
    );
  }

  @override
  List<MovieVO> getTopRatedMovies() {
    if(getAllMovies().isNotEmpty){
      return getAllMovies()
          .where((element) => element.isTopRated ?? false)
          .toList();
    } else return [];
  }

  @override
  void saveAllMovies(List<MovieVO> movieList) {
    movieList.forEach((movie) {
      movieListFromDBMock[movie.id ?? 0] = movie ;
    });
  }

  @override
  void saveSingleMovie(MovieVO movie) {
    movieListFromDBMock[movie.id ?? 0] = movie ;
  }
  
}