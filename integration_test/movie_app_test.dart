import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:integration_test/integration_test.dart';
import 'package:module_3_movies_app/data/vos/actors_vo.dart';
import 'package:module_3_movies_app/data/vos/collection_vo.dart';
import 'package:module_3_movies_app/data/vos/date_vo.dart';
import 'package:module_3_movies_app/data/vos/genre_vo.dart';
import 'package:module_3_movies_app/data/vos/movie_vo.dart';
import 'package:module_3_movies_app/data/vos/production_companies_vo.dart';
import 'package:module_3_movies_app/data/vos/production_countries_vo.dart';
import 'package:module_3_movies_app/data/vos/spoken_languages_vo.dart';
import 'package:module_3_movies_app/main.dart';
import 'package:module_3_movies_app/pages/home_page.dart';
import 'package:module_3_movies_app/persistence/hive_constants.dart';

import 'test_data/test_data.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
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

  testWidgets("Tap Best Popular movie and navigate to details", (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await Future.delayed(Duration(seconds: 2));
    await tester.pumpAndSettle(Duration(seconds: 5));

    expect(find.byType(HomePage), findsOneWidget);
    expect(find.text(TEST_DATA_MOVIE_NAME), findsOneWidget);
    await tester.tap(find.text(TEST_DATA_MOVIE_NAME));
    await tester.pumpAndSettle(Duration(seconds: 5));
    expect(find.text(TEST_DATA_MOVIE_NAME), findsOneWidget);
    expect(find.text(TEST_DATA_RELEASED_YEAR),findsOneWidget);
    expect(find.text(TEST_DATA_RATING), findsOneWidget);
  });
}
