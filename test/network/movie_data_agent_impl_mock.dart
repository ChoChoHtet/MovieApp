import 'package:module_3_movies_app/data/vos/actors_vo.dart';
import 'package:module_3_movies_app/data/vos/genre_vo.dart';
import 'package:module_3_movies_app/data/vos/movie_vo.dart';
import 'package:module_3_movies_app/network/dataagents/movie_data_agent.dart';

import '../mock_data/mock_data.dart';

class MovieDataAgentImplMock extends MovieDataAgent{
  @override
  Future<List<ActorsVO>?> getActors(int page) {
    return Future.value(getMockActor());
  }

  @override
  Future<List<GenreVO>?> getGenres() {
    return Future.value(getMockGenre());
  }

  @override
  Future<List<List<ActorsVO>?>> getMovieCredit(int movieId) {
    return Future.value([getMockActor()]);
  }

  @override
  Future<MovieVO?> getMovieDetails(int movieId) {
   return Future.value(getMockMovieForTest().first);
  }

  @override
  Future<List<MovieVO>?> getMoviesByGenreId(int genreId) {
   return Future.value(getMockMovieForTest());
  }

  @override
  Future<List<MovieVO>?> getNowPlayingMovies(int page) {
    return Future.value(getMockMovieForTest()
        .where((element) => element.isNowPlaying ?? false)
        .toList()
    );
  }

  @override
  Future<List<MovieVO>?> getPopularMovies(int page) {
    return Future.value(getMockMovieForTest()
        .where((element) => element.isPopular ?? false)
        .toList()
    );
  }

  @override
  Future<List<MovieVO>?> getTopRatedMovies(int page) {
    return Future.value(getMockMovieForTest()
        .where((element) => element.isTopRated ?? false)
        .toList()
    );
  }
  
}