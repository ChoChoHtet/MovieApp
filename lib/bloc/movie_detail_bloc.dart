import 'package:flutter/foundation.dart';

import '../data/ models/movie_model.dart';
import '../data/ models/movie_model_impl.dart';
import '../data/vos/actors_vo.dart';
import '../data/vos/movie_vo.dart';

class MovieDetailBloc extends ChangeNotifier {
  //State
  MovieVO? mMovie;
  List<ActorsVO>? mCast;
  List<ActorsVO>? mCrew;
  List<MovieVO>? movieList;

  // model
  MovieModel model = MovieModelImpl();

  MovieDetailBloc(int movieId, [MovieModel? movieModel]) {
    if (movieModel != null) {
      model = movieModel;
    }
    // Movie Detail
    model.getMovieDetails(movieId).then((movie) {
      mMovie = movie;
      getRelatedMovie(movie?.genres?.first.id ?? 0);
      notifyListeners();
    }).catchError((error) {});

    model.getMovieDetailFromDatabase(movieId).then((movie) {
      mMovie = movie;
      notifyListeners();
    }).catchError((error) {});

    // movie credit
    model.getMovieCredit(movieId).then((creditList) {
      mCast = creditList.first;
      mCrew = creditList.last;
      notifyListeners();
    }).catchError((error) {});
  }

  void getRelatedMovie(int genreId) {
    model.getMoviesByGenreId(genreId).then((value) {
      movieList = value;
      notifyListeners();
    });
  }
}
