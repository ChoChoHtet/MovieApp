import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:module_3_movies_app/data/vos/actors_vo.dart';
import 'package:module_3_movies_app/data/vos/genre_vo.dart';
import 'package:module_3_movies_app/data/vos/movie_vo.dart';
import 'package:module_3_movies_app/network/api_constants.dart';
import 'package:module_3_movies_app/network/dataagents/movie_data_agent.dart';
import 'package:module_3_movies_app/network/the_movie_api.dart';

class RetrofitDataAgentImpl extends MovieDataAgent {
  late TheMovieApi movieApi;

  static RetrofitDataAgentImpl _singleton = RetrofitDataAgentImpl._internal();

  factory RetrofitDataAgentImpl() {
    return _singleton;
  }

  //create privat constructor
  RetrofitDataAgentImpl._internal() {
    final dio = Dio();
    movieApi = TheMovieApi(dio);
  }

  @override
  Future<List<MovieVO>?> getNowPlayingMovies(int page) {
    return movieApi
        .getNowPlayingMovies(API_KEY, LANGUAGE_EN_US, page.toString())
        .asStream()
        .map((response) {
      return response.results;
    }).first;
  }

  @override
  Future<List<MovieVO>?> getPopularMovies(int page) {
    return movieApi
        .getPopularMovies(API_KEY, LANGUAGE_EN_US, page.toString())
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<ActorsVO>?> getActors(int page) {
    return movieApi
        .getActors(API_KEY, LANGUAGE_EN_US, page.toString())
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<GenreVO>?> getGenres() {
    return movieApi
        .getGenres(API_KEY, LANGUAGE_EN_US)
        .asStream()
        .map((response) => response.genres)
        .first;
  }

  @override
  Future<List<MovieVO>?> getMoviesByGenreId(int genreId) {
    return movieApi
        .getMoviesByGenreId(API_KEY, LANGUAGE_EN_US, genreId.toString())
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<MovieVO>?> getTopRatedMovies(int page) {
    return movieApi
        .getTopRatedMovies(API_KEY, LANGUAGE_EN_US, page.toString())
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<List<ActorsVO>?>> getMovieCredit(int movieId) {
    return movieApi
        .getMovieCredit(API_KEY, LANGUAGE_EN_US, movieId.toString())
        .asStream()
        .map((creditMovie) => [creditMovie.cast, creditMovie.crew])
        .first;
  }

  @override
  Future<MovieVO?> getMovieDetails(int movieId) {
    return movieApi.getMoviesDetail(
        API_KEY, LANGUAGE_EN_US, movieId.toString());
  }
}
