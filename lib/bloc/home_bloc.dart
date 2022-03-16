import 'dart:async';

import 'package:module_3_movies_app/data/%20models/movie_model.dart';
import 'package:module_3_movies_app/data/%20models/movie_model_impl.dart';

import '../data/vos/actors_vo.dart';
import '../data/vos/genre_vo.dart';
import '../data/vos/movie_vo.dart';

class HomeBloc {
  // Reactive Stream

  StreamController<List<MovieVO>?> mNowPlayingStreamController = StreamController();
  StreamController<List<MovieVO>?> mPopularStreamController = StreamController();
  StreamController<List<GenreVO>?> mGenreListStreamController = StreamController();
  StreamController<List<MovieVO>?> mMoviesGenreStreamController = StreamController();
  StreamController<List<ActorsVO>?> mActorsStreamController = StreamController();
  StreamController<List<MovieVO>?> mTopRatedStreamController = StreamController();

  //Model
  MovieModel model = MovieModelImpl();

  HomeBloc() {
    // Now playing from DB
    model.getNowPlayingFromDatabase().listen((nowPlayingMovies) {
      mNowPlayingStreamController.sink.add(nowPlayingMovies);
    }).onError((error){});

    //Popular movies from DB
    model.getPopularFromDatabase().listen((popularMovies) {
      mPopularStreamController.sink.add(popularMovies);
    }).onError((error){});

    // Top Rated movies from DB
    model.getTopRatedFromDatabase().listen((topRatedMovies) {
      mTopRatedStreamController.sink.add(topRatedMovies);
    }).onError((error){});

    // Genres
    model.getGenres().then((genres) {
      mGenreListStreamController.sink.add(genres);
      //movies by genre
     getMovieByGenreAndRefresh(genres?.first.id ?? 0);
    }).catchError((error){});
    
    // Genre from DB
    model.getGenresFromDatabase().then((genres){
      mGenreListStreamController.sink.add(genres);
    }).catchError((error){});
    
    // Actors
    model.getActors().then((actorList){
      mActorsStreamController.sink.add(actorList);
    }).catchError((error){});
    
    //Actors from DB
    model.getActorsFromDatabase().then((actorList) {
      mActorsStreamController.sink.add(actorList);
    }).catchError((error){});

  }

  void getMovieByGenreAndRefresh(int genreId){
    model.getMoviesByGenreId(genreId).then((movieList){
      mMoviesGenreStreamController.sink.add(movieList);
    }).catchError((error){

    });
  }

  void dispose() {
    mNowPlayingStreamController.close();
    mPopularStreamController.close();
    mTopRatedStreamController.close();
    mGenreListStreamController.close();
    mMoviesGenreStreamController.close();
    mActorsStreamController.close();
  }
}
