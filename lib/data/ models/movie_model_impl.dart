import 'package:module_3_movies_app/data/%20models/movie_model.dart';
import 'package:module_3_movies_app/data/vos/actors_vo.dart';
import 'package:module_3_movies_app/data/vos/genre_vo.dart';
import 'package:module_3_movies_app/data/vos/movie_vo.dart';
import 'package:module_3_movies_app/network/dataagents/movie_data_agent.dart';
import 'package:module_3_movies_app/network/dataagents/retrofit_data_agent_impl.dart';

class MovieModelImpl extends MovieModel {
  MovieDataAgent _dataAgent = RetrofitDataAgentImpl();

  MovieModelImpl._internal();

  static MovieModelImpl _singleton = MovieModelImpl._internal();

  factory MovieModelImpl() {
    return _singleton;
  }

  @override
  Future<List<MovieVO>?> getNowPlayingMovies() {
    return _dataAgent.getNowPlayingMovies(1) ;
  }

  @override
  Future<List<ActorsVO>?> getActors() {
    return _dataAgent.getActors(1);
  }

  @override
  Future<List<GenreVO>?> getGenres() {
   return _dataAgent.getGenres();
  }

  @override
  Future<List<MovieVO>?> getMoviesByGenreId(int genreId) {
    return _dataAgent.getMoviesByGenreId(genreId);
  }

  @override
  Future<List<MovieVO>?> getPopularMovies() {
  return _dataAgent.getPopularMovies(1);
  }

  @override
  Future<List<MovieVO>?> getTopRatedMovies() {
    return _dataAgent.getTopRatedMovies(1);
  }
}
