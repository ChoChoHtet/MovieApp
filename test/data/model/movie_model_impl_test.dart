import 'package:flutter_test/flutter_test.dart';
import 'package:module_3_movies_app/data/%20models/movie_model_impl.dart';
import 'package:module_3_movies_app/data/vos/movie_vo.dart';

import '../../mock_data/mock_data.dart';
import '../../network/movie_data_agent_impl_mock.dart';
import '../../persistence/actor_dao_impl_mock.dart';
import '../../persistence/genre_dao_impl_mock.dart';
import '../../persistence/movie_dao_impl_mock.dart';

void main() {
  var movieModel = MovieModelImpl();
  group(
    "movie_model_impl",
    () {
      setUp(() {
        movieModel.setDaoAndAgentTest(MovieDaoImplMock(), GenreDaoImplMock(),
            ActorDaoImplMock(), MovieDataAgentImplMock());
      });

      test(("Save and Retrieve Now Playing Movie from DB"), () {
        expect(
          movieModel.getNowPlayingFromDatabase(1),
          emits(
            [
              MovieVO(
                  adult: false,
                  backDropPath: "/fOy2Jurz9k6RnJnMUMRDAgBwru2.jpg",
                  genreIds: [16, 10751, 35, 14],
                  id: 508947,
                  originalLanguage: "en",
                  originalTitle: "TurningRed",
                  overview:
                      "Thirteen-year-old Mei is experiencing the awkwardness of being a teenager with a twist – when she gets too excited, she transforms into a giant red panda.",
                  popularity: 5329.202,
                  posterPath: " /qsdjk9oAKSQMWs0Vt5Pyfh6O4GZ.jpg",
                  releaseDate: "2022-03-01",
                  title: "TurningRed",
                  video: false,
                  voteAverage: 7.5,
                  voteCount: 1433.0,
                  isNowPlaying: true,
                  isPopular: false,
                  isTopRated: false),
            ],
          ),
        );
      });
      test(("Save and Retrieve Popular Movie from DB"), () {
        expect(
          movieModel.getPopularFromDatabase(),
          emits(
            [
              MovieVO(
                  adult: false,
                  backDropPath: "/x747ZvF0CcYYTTpPRCoUrxA2cYy.jpg",
                  genreIds: [28, 12, 878],
                  id: 406759,
                  originalLanguage: "en",
                  originalTitle: "Moonfall",
                  overview:
                      "A mysterious force knocks the moon from its orbit around Earth and sends it hurtling on a collision course with life as we know it.",
                  popularity: 5329.202,
                  posterPath: "/odVv1sqVs0KxBXiA8bhIBlPgalx.jpg",
                  releaseDate: "2022-03-01",
                  title: "Moonfall",
                  video: false,
                  voteAverage: 7.5,
                  voteCount: 1433.0,
                  isNowPlaying: false,
                  isPopular: true,
                  isTopRated: false),
            ],
          ),
        );
      });
      test(("Save and Retrieve Top Rated Movie from DB"), () {
        expect(
          movieModel.getTopRatedFromDatabase(),
          emits(
            [
              MovieVO(
                  adult: false,
                  backDropPath: "/egoyMDLqCxzjnSrWOz50uLlJWmD.jpg",
                  genreIds: [16, 10751, 35, 14],
                  id: 675353,
                  originalLanguage: "en",
                  originalTitle: "Sonic the Hedgehog 2",
                  overview:
                      "After settling in Green Hills, Sonic is eager to prove he has what it takes to be a true hero. His test ",
                  popularity: 5329.202,
                  posterPath: "/6DrHO1jr3qVrViUO6s6kFiAGM7.jpg",
                  releaseDate: "2022-03-01",
                  title: "Sonic the Hedgehog 2",
                  video: false,
                  voteAverage: 7.5,
                  voteCount: 1433.0,
                  isNowPlaying: false,
                  isPopular: false,
                  isTopRated: true),
            ],
          ),
        );
      });
      test(("Get Genre"), () {
        expect(
          movieModel.getGenres(),
          completion(equals(getMockGenre())),
        );
      });
      test(("Get Actor List"), () {
        expect(movieModel.getActors(), completion(equals(getMockActor())));
      });
      test(("Get Movie Credit List"), () {
        expect(
            movieModel.getMovieCredit(1), completion(equals([getMockActor()])));
      });
      test(("Get Movie Detail"), () {
        expect(movieModel.getMovieDetails(1),
            completion(equals(getMockMovieForTest().first)));
      });
      test(("Get Actor From DB Test"), () async {
        await movieModel.getActors();
        expect(movieModel.getActorsFromDatabase(),
            completion(equals(getMockActor())));
      });
      test(("Get Genre From DB Test"), () async {
        await movieModel.getGenres();
        expect(movieModel.getGenresFromDatabase(),
            completion(equals(getMockGenre())));
      });
      test(("Get Movie Detail From DB Test"), () async {
        await movieModel.getMovieDetails(1);
        expect(movieModel.getMovieDetails(1),
            completion(equals(getMockMovieForTest().first)));
      });
    },
  );
}
