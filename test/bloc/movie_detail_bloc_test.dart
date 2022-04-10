import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:module_3_movies_app/bloc/movie_detail_bloc.dart';

import '../data/model/movie_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main() {
  group("Movie Detail bloc test", () {
    MovieDetailBloc? movieBloc;
    setUp((){
      movieBloc = MovieDetailBloc(1,MovieModelImplMock());
    });

    test("Fetch Movie Detail Test",(){
      expect(movieBloc?.mMovie, getMockMovieForTest().first);
    });

    test("Fetch Creator  Test",(){
      expect(movieBloc?.mCrew?.contains(getMockActor().last), true);
    });
    
    test("Fetch Actors Test",(){
      expect(movieBloc?.mCast?.contains(getMockActor().first), true);
    });

/*    test("Get Related Movie Test",(){
      expect(movieBloc?.mCast?.contains(getMockActor().first), true);
    });*/
  });
}
