import 'package:module_3_movies_app/data/vos/movie_vo.dart';

abstract class MovieDataAgent{
 Future<List<MovieVO>?> getNowPlayingMovies(int page);
}