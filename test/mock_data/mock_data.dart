
import 'package:module_3_movies_app/data/vos/actors_vo.dart';
import 'package:module_3_movies_app/data/vos/genre_vo.dart';
import 'package:module_3_movies_app/data/vos/movie_vo.dart';

List<MovieVO> getMockMovieForTest() {
  return [
    MovieVO(
        adult: false,
        backDropPath: "/fOy2Jurz9k6RnJnMUMRDAgBwru2.jpg",
        genreIds: [16, 10751, 35, 14],
        id: 508947,
        originalLanguage: "en",
        originalTitle: "TurningRed",
        overview: "Thirteen-year-old Mei is experiencing the awkwardness of being a teenager with a twist – when she gets too excited, she transforms into a giant red panda.",
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
    MovieVO(
        adult: false,
        backDropPath: "/x747ZvF0CcYYTTpPRCoUrxA2cYy.jpg",
        genreIds: [28, 12, 878],
        id: 406759,
        originalLanguage: "en",
        originalTitle: "Moonfall",
        overview: "A mysterious force knocks the moon from its orbit around Earth and sends it hurtling on a collision course with life as we know it.",
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
    MovieVO(
        adult: false,
        backDropPath: "/egoyMDLqCxzjnSrWOz50uLlJWmD.jpg",
        genreIds: [16, 10751, 35, 14],
        id: 675353,
        originalLanguage: "en",
        originalTitle: "Sonic the Hedgehog 2",
        overview: "After settling in Green Hills, Sonic is eager to prove he has what it takes to be a true hero. His test ",
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
  ];
}

List<ActorsVO> getMockActor() {
  return [
    ActorsVO(
        id: 169337,
        adult: false,
        popularity: 488.639,
        name: "Tom",
        profilePath: "/caX3KtMU42EP3VLRFFBwqIIrch5.jpg"),
    ActorsVO(
        id: 2564437,
        adult: false,
        popularity: 75.639,
        name: "Jared Leto",
        profilePath: "/caX3KtMU42EP3VLRFFBwqIIrch5.jpg"),
    ActorsVO(
        id: 2200531,
        adult: false,
        popularity: 488.639,
        name: "Will Smith",
        profilePath: "/caX3KtMU42EP3VLRFFBwqIIrch5.jpg")
  ];
}

List<GenreVO> getMockGenre() {
  return [
    GenreVO(1, "Action"),
    GenreVO(2, "Adventure"),
    GenreVO(3, "Comedy"),
  ];
}
