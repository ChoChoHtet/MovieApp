import 'package:module_3_movies_app/data/vos/actors_vo.dart';
import 'package:module_3_movies_app/data/vos/genre_vo.dart';
import 'package:module_3_movies_app/data/vos/movie_vo.dart';
import 'package:retrofit/http.dart';

abstract class MovieDataAgent{
 Future<List<MovieVO>?> getNowPlayingMovies(int page);
 Future<List<MovieVO>?> getPopularMovies(int page);
 Future<List<MovieVO>?> getTopRatedMovies(int page);
 Future<List<MovieVO>?> getMoviesByGenreId(int genreId);
 Future<List<ActorsVO>?> getActors(int page);
 Future<List<GenreVO>?> getGenres();
 Future<MovieVO?> getMovieDetails(int movieId);
 Future<List<List<ActorsVO>?>> getMovieCredit(int movieId);

}