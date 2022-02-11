import 'package:flutter/material.dart';
import 'package:module_3_movies_app/network/dataagents/dio_movie_data_agent_impl.dart';
import 'package:module_3_movies_app/network/dataagents/http_movie_data_agent_impl.dart';
import 'package:module_3_movies_app/network/dataagents/retrofit_data_agent_impl.dart';
import 'package:module_3_movies_app/pages/home_page.dart';
import 'package:module_3_movies_app/pages/movies_detail_page.dart';

void main() {
  //HttpMovieDataAgentImpl().getNowPlayingMovies(1);
  //DioMovieDataAgentImpl().getNowPlayingMovies(1);
  //RetrofitDataAgentImpl().getNowPlayingMovies(1);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}


