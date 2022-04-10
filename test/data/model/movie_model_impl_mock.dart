import 'package:module_3_movies_app/data/%20models/movie_model.dart';
import 'package:module_3_movies_app/data/vos/actors_vo.dart';
import 'package:module_3_movies_app/data/vos/genre_vo.dart';
import 'package:module_3_movies_app/data/vos/movie_vo.dart';

import '../../mock_data/mock_data.dart';

class MovieModelImplMock extends MovieModel {
  @override
  Future<List<ActorsVO>?> getActors() {
    return Future.value(getMockActor());
  }

  @override
  Future<List<ActorsVO>?> getActorsFromDatabase() {
    return Future.value(getMockActor());
  }

  @override
  Future<List<GenreVO>?> getGenres() {
    return Future.value(getMockGenre());
  }

  @override
  Future<List<GenreVO>?> getGenresFromDatabase() {
    return Future.value(getMockGenre());
  }

  @override
  Future<List<List<ActorsVO>?>> getMovieCredit(int movieId) {
    return Future.value([getMockActor()]);
  }

  @override
  Future<MovieVO?> getMovieDetailFromDatabase(int movieId) {
    return Future.value(getMockMovieForTest().first);
  }

  @override
  Future<MovieVO?> getMovieDetails(int movieId) {
    return Future.value(getMockMovieForTest().first);
  }

  @override
  Future<List<MovieVO>?> getMoviesByGenreId(int genreId) {
    if (genreId == 3) {
      return Future.value([getMockMovieForTest().last]);
    } else {
      return Future.value([getMockMovieForTest().first]);
    }
  }

  @override
  Stream<List<MovieVO>?> getNowPlayingFromDatabase(int page) {
    return Stream.value(getMockMovieForTest()
        .where((element) => element.isNowPlaying ?? false)
        .toList());
  }

  @override
  void getNowPlayingMovies(int page) {
  }

  @override
  Stream<List<MovieVO>?> getPopularFromDatabase() {
    return Stream.value(getMockMovieForTest()
        .where((element) => element.isPopular ?? false)
        .toList());
  }

  @override
  void getPopularMovies() {
  }

  @override
  Stream<List<MovieVO>?> getTopRatedFromDatabase() {
    return Stream.value(getMockMovieForTest()
        .where((element) => element.isTopRated ?? false)
        .toList());
  }

  @override
  void getTopRatedMovies() {
  }
}
