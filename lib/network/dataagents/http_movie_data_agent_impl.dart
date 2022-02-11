import 'package:flutter/cupertino.dart';
import 'package:module_3_movies_app/data/vos/actors_vo.dart';
import 'package:module_3_movies_app/data/vos/genre_vo.dart';
import 'package:module_3_movies_app/data/vos/movie_vo.dart';
import 'package:module_3_movies_app/network/api_constants.dart';
import 'package:module_3_movies_app/network/dataagents/movie_data_agent.dart';
import 'package:http/http.dart' as http;

class HttpMovieDataAgentImpl extends MovieDataAgent {
  @override
  Future<List<MovieVO>?> getNowPlayingMovies(int page) {
    Map<String, String> queryParams = {
      PARAMS_API_KEY: API_KEY,
      PARAMS_LANGUAGE: LANGUAGE_EN_US,
      PARAMS_PAGE: page.toString()
    };
    var url = Uri.https(BASE_URL, END_POINTS_GET_NOW_PLAYING, queryParams);
   return http.get(url).then((value) {
      debugPrint("Now Playing response=> ${value.body}");
    }).catchError((error){
      debugPrint("Now Playing response:$error");
    });
  }

  @override
  Future<List<ActorsVO>> getActors(int page) {
    // TODO: implement getActors
    throw UnimplementedError();
  }

  @override
  Future<List<GenreVO>?> getGenres() {
    // TODO: implement getGenres
    throw UnimplementedError();
  }

  @override
  Future<List<MovieVO>?> getMoviesByGenreId(int genreId) {
    // TODO: implement getMoviesByGenreId
    throw UnimplementedError();
  }

  @override
  Future<List<MovieVO>?> getPopularMovies(int page) {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<List<MovieVO>?> getTopRatedMovies(int page) {
    // TODO: implement getTopRatedMovies
    throw UnimplementedError();
  }

  @override
  Future<List<List<ActorsVO>?>> getMovieCredit(int movieId) {
    // TODO: implement getMovieCredit
    throw UnimplementedError();
  }

  @override
  Future<MovieVO?> getMovieDetails(int movieId) {
    // TODO: implement getMovieDetails
    throw UnimplementedError();
  }

}