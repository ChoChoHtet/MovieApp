import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:module_3_movies_app/data/vos/movie_vo.dart';
import 'package:module_3_movies_app/network/dataagents/movie_data_agent.dart';

import '../api_constants.dart';

class DioMovieDataAgentImpl extends MovieDataAgent{
  @override
  Future<List<MovieVO>?> getNowPlayingMovies(int page) {
    Map<String, String> queryParams = {
      PARAMS_API_KEY: API_KEY,
      PARAMS_LANGUAGE: LANGUAGE_EN_US,
      PARAMS_PAGE: page.toString()
    };
   return Dio().get("$BASE_URL_DIO$END_POINTS_GET_NOW_PLAYING",
        queryParameters: queryParams).then((value){
      debugPrint("Dio Now Playing response=> $value");
    }).catchError((error){
      debugPrint("Dio Now Playing Error=> $error");
    });
  }

}