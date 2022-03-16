import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:module_3_movies_app/data/%20models/movie_model_impl.dart';
import 'package:module_3_movies_app/data/vos/actors_vo.dart';
import 'package:module_3_movies_app/data/vos/collection_vo.dart';
import 'package:module_3_movies_app/data/vos/date_vo.dart';
import 'package:module_3_movies_app/data/vos/genre_vo.dart';
import 'package:module_3_movies_app/data/vos/movie_vo.dart';
import 'package:module_3_movies_app/data/vos/production_companies_vo.dart';
import 'package:module_3_movies_app/data/vos/production_countries_vo.dart';
import 'package:module_3_movies_app/data/vos/spoken_languages_vo.dart';
import 'package:module_3_movies_app/pages/home_page.dart';
import 'package:module_3_movies_app/persistence/hive_constants.dart';
import 'package:scoped_model/scoped_model.dart';

void main() async {
  //HttpMovieDataAgentImpl().getNowPlayingMovies(1);
  //DioMovieDataAgentImpl().getNowPlayingMovies(1);
  //RetrofitDataAgentImpl().getNowPlayingMovies(1);

  await Hive.initFlutter();
  Hive.registerAdapter(ActorsVOAdapter());
  Hive.registerAdapter(CollectionVOAdapter());
  Hive.registerAdapter(GenreVOAdapter());
  Hive.registerAdapter(MovieVOAdapter());
  Hive.registerAdapter(ProductionCompaniesVOAdapter());
  Hive.registerAdapter(ProductionCountriesVOAdapter());
  Hive.registerAdapter(SpokenLanguagesVOAdapter());
  Hive.registerAdapter(DateVOAdapter());

  await Hive.openBox<ActorsVO>(BOX_NAMES_ACTOR_VO);
  await Hive.openBox<GenreVO>(BOX_NAMES_GENRE_VO);
  await Hive.openBox<MovieVO>(BOX_NAMES_MOVIE_VO);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: MovieModelImpl(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: HomePage(),
      ),
    );
  }
}
