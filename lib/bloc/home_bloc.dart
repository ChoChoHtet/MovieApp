import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:module_3_movies_app/data/%20models/movie_model.dart';
import 'package:module_3_movies_app/data/%20models/movie_model_impl.dart';

import '../data/vos/actors_vo.dart';
import '../data/vos/genre_vo.dart';
import '../data/vos/movie_vo.dart';

class HomeBloc extends ChangeNotifier {
  // State
  List<MovieVO>? mNowPlayingMovie;
  List<MovieVO>? mPopularMovie;
  List<MovieVO>? mTopRatedMovie;
  List<MovieVO>? mMovieGenre;
  List<GenreVO>? mGenreList;
  List<ActorsVO>? mActorList;

  //Model
  MovieModel model = MovieModelImpl();

  HomeBloc() {
    // Now playing from DB
    model.getNowPlayingFromDatabase().listen((nowPlayingMovies) {
      mNowPlayingMovie = nowPlayingMovies;
      notifyListeners();
    }).onError((error) {});

    //Popular movies from DB
    model.getPopularFromDatabase().listen((popularMovies) {
      mPopularMovie = popularMovies;
      notifyListeners();
    }).onError((error) {});

    // Top Rated movies from DB
    model.getTopRatedFromDatabase().listen((topRatedMovies) {
      mTopRatedMovie = topRatedMovies;
      notifyListeners();
    }).onError((error) {});

    // Genres
    model.getGenres().then((genres) {
      mGenreList = genres;
      //movies by genre
      getMovieByGenreAndRefresh(genres?.first.id ?? 0);
    }).catchError((error) {});

    // Genre from DB
    model.getGenresFromDatabase().then((genres) {
      mGenreList = genres;
      notifyListeners();
    }).catchError((error) {});

    // Actors
    model.getActors().then((actorList) {
      mActorList = actorList;
      notifyListeners();
    }).catchError((error) {});

    //Actors from DB
    model.getActorsFromDatabase().then((actorList) {
      mActorList = actorList;
      notifyListeners();
    }).catchError((error) {});
  }

  void getMovieByGenreAndRefresh(int genreId) {
    model.getMoviesByGenreId(genreId).then((movieList) {
      mMovieGenre = movieList;
      notifyListeners();
    }).catchError((error) {});
  }
  void onTapGenre(int genreId){
    getMovieByGenreAndRefresh(genreId);
  }
}
