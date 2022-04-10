import 'package:flutter_test/flutter_test.dart';
import 'package:module_3_movies_app/bloc/home_bloc.dart';

import '../data/model/movie_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main() {
  group("Home bloc test", () {
    HomeBloc? homeBloc;

    setUp(() {
      homeBloc = HomeBloc(MovieModelImplMock());
    });
    test("Fetch Now Playing movie test",(){
      expect(
          homeBloc?.mNowPlayingMovie?.contains(getMockMovieForTest().first),
          true);
    });

    test("Fetch Popular movie test",(){
      expect(
          homeBloc?.mPopularMovie?.contains(getMockMovieForTest()[1]),
          true);
    });

    test("Fetch Top Rated movie test",(){
      expect(
          homeBloc?.mTopRatedMovie?.contains(getMockMovieForTest().last),
          true);
    });

    test("Fetch Genre test",(){
      expect(
          homeBloc?.mGenreList?.contains(getMockGenre().first),
          true);
    });

    test("Fetch Initial Movies by Genre test",() async{
      await Future.delayed(Duration(milliseconds: 500));
      expect(
          homeBloc?.mMovieGenre?.contains(getMockMovieForTest().first),
          true);
    });

    test("Fetch Movies by Genre from users test",() async{
      homeBloc?.onTapGenre(3);
      await Future.delayed(Duration(milliseconds: 500));
      expect(
          homeBloc?.mMovieGenre?.contains(getMockMovieForTest().last),
          true);
    });


    test("Fetch Actors test",(){
      expect(
          homeBloc?.mActorList?.contains(getMockActor().first),
          true);
    });
  });
}