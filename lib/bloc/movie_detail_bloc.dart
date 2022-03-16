import 'dart:async';

import 'package:module_3_movies_app/data/%20models/movie_model.dart';
import 'package:module_3_movies_app/data/%20models/movie_model_impl.dart';
import 'package:module_3_movies_app/data/vos/movie_vo.dart';

import '../data/vos/actors_vo.dart';

class MovieDetailBloc{
  
  StreamController<MovieVO?> mMovieStreamController = StreamController();
  StreamController<List<ActorsVO>?> mActorStreamController = StreamController();
  StreamController<List<ActorsVO>?> mCreatorStreamController = StreamController();
  
  MovieModel _model = MovieModelImpl();
  
  MovieDetailBloc(int movieId){
    // Movie Detail
    _model.getMovieDetailFromDatabase(movieId).then((movie) {
      mMovieStreamController.sink.add(movie);
    }).catchError((error){});

    // Movie Credit
    _model.getMovieCredit(movieId).then((creditList) {
      mActorStreamController.sink.add(creditList.first);
      mCreatorStreamController.sink.add(creditList.last);
     // mCrewStreamController.sink.add([]);

    }).catchError((error){});

  }
  
  void dispose(){
    mMovieStreamController.close();
    mActorStreamController.close();
    mCreatorStreamController.close();
  }
}