import 'package:module_3_movies_app/data/%20models/movie_model.dart';
import 'package:module_3_movies_app/data/vos/actors_vo.dart';
import 'package:module_3_movies_app/data/vos/genre_vo.dart';
import 'package:module_3_movies_app/data/vos/movie_vo.dart';
import 'package:module_3_movies_app/network/dataagents/movie_data_agent.dart';
import 'package:module_3_movies_app/network/dataagents/retrofit_data_agent_impl.dart';
import 'package:module_3_movies_app/persistence/daos/actor_dao.dart';
import 'package:module_3_movies_app/persistence/daos/genre_dao.dart';
import 'package:module_3_movies_app/persistence/daos/movie_dao.dart';
import 'package:stream_transform/stream_transform.dart';

class MovieModelImpl extends MovieModel {
  MovieDataAgent _dataAgent = RetrofitDataAgentImpl();

  MovieModelImpl._internal() {
    getNowPlayingFromDatabase();
    getTopRatedFromDatabase();
    getPopularFromDatabase();
    getActors();
    getActorsFromDatabase();
    getGenres();
    getGenresFromDatabase();
  }

  static MovieModelImpl _singleton = MovieModelImpl._internal();

  // Database
  MovieDao movieDao = MovieDao();
  GenreDao genreDao = GenreDao();
  ActorDao actorDao = ActorDao();

  //Home Page State
  List<MovieVO>? mNowPlayingMovies;
  List<MovieVO>? mPopularMovies;
  List<GenreVO>? mGenresList;
  List<MovieVO>? mMoviesByGenre;
  List<ActorsVO>? mActors;
  List<MovieVO>? mTopRatedMovies;

  // Movie Detail State
  MovieVO? mMovie;
  List<ActorsVO>? mCastList;
  List<ActorsVO>? mCrewList;

  factory MovieModelImpl() {
    return _singleton;
  }

  @override
  void getNowPlayingMovies() {
    _dataAgent.getNowPlayingMovies(1).then((movieList) async {
      List<MovieVO> nowPlayingMovies = movieList?.map((movie) {
            movie.isNowPlaying = true;
            movie.isPopular = false;
            movie.isTopRated = false;
            return movie;
          }).toList() ??
          [];
      movieDao.saveAllMovies(nowPlayingMovies);
      mNowPlayingMovies = nowPlayingMovies;
      notifyListeners();
      // return Future.value(movieList);
    });
  }

  @override
  void getPopularMovies() {
    _dataAgent.getPopularMovies(1).then((movieList) async {
      List<MovieVO> popularMovies = movieList?.map((movie) {
            movie.isNowPlaying = false;
            movie.isPopular = true;
            movie.isTopRated = false;
            return movie;
          }).toList() ??
          [];
      movieDao.saveAllMovies(popularMovies);
      mPopularMovies = popularMovies;
      notifyListeners();
      //return Future.value(movieList);
    });
  }

  @override
  void getTopRatedMovies() {
    _dataAgent.getTopRatedMovies(1).then((movieList) async {
      List<MovieVO> topRatedMovies = movieList?.map((movie) {
            movie.isNowPlaying = false;
            movie.isPopular = false;
            movie.isTopRated = true;
            return movie;
          }).toList() ??
          [];
      movieDao.saveAllMovies(topRatedMovies);
      mTopRatedMovies = topRatedMovies;
      notifyListeners();
      // return Future.value(movieList);
    });
  }

  @override
  void getActors() {
    _dataAgent.getActors(1).then((actorList) async {
      actorDao.saveAllActors(actorList ?? []);
      mActors = actorList;
      notifyListeners();
    });
  }

  @override
  Future<List<GenreVO>?> getGenres() {
    return _dataAgent.getGenres().then((genreList) async {
      genreDao.saveAllGenres(genreList ?? []);
      mGenresList = genreList;
      getMoviesByGenreId(genreList?.first.id ?? 0);
      notifyListeners();
      return Future.value(genreList);
    });
  }

  @override
  void getMoviesByGenreId(int genreId) {
    _dataAgent.getMoviesByGenreId(genreId).then((movieList) {
      mMoviesByGenre = movieList;
      notifyListeners();
    });
  }

  @override
  void getMovieCredit(int movieId) {
    _dataAgent.getMovieCredit(movieId).then((creditList) {
      mCastList = creditList.first;
      mCrewList = creditList.last;
      notifyListeners();
    });
  }

  @override
  void getMovieDetails(int movieId) {
    _dataAgent.getMovieDetails(movieId).then((movie) async {
      if (movie != null) {
        movieDao.saveSingleMovie(movie);
      }
      mMovie = movie;
      notifyListeners();
    });
  }

  //Database
  @override
  void getActorsFromDatabase() {
    mActors = actorDao.getAllActors();
    notifyListeners();
  }

  @override
  void getGenresFromDatabase() {
    mGenresList = genreDao.getAllGenres();
    notifyListeners();
  }

  @override
  void getNowPlayingFromDatabase() {
    getNowPlayingMovies();
    movieDao
        .getAllMovieEventStream()
        .startWith(movieDao.getNowPlayingMovieStream())
        .map((event) => movieDao.getNowPlayingMovies())
        .listen((movieList) {
      mNowPlayingMovies = movieList;
      notifyListeners();
    });
  }

  @override
  void getPopularFromDatabase() {
    getPopularMovies();
    movieDao
        .getAllMovieEventStream()
        .startWith(movieDao.getPopularMovieStream())
        .map((event) => movieDao.getPopularMovies())
        .listen((popularMovies) {
      mPopularMovies = popularMovies;
      notifyListeners();
    });
  }

  @override
  void getTopRatedFromDatabase() {
    getTopRatedMovies();
    movieDao
        .getAllMovieEventStream()
        .startWith(movieDao.getTopRatedMovieStream())
        .map((event) => movieDao.getTopRatedMovies())
        .listen((event) {
      mTopRatedMovies = event;
      notifyListeners();
    });
  }

  @override
  void getMovieDetailFromDatabase(int movieId) {
    mMovie = movieDao.getMoviesById(movieId);
    notifyListeners();
  }
}
