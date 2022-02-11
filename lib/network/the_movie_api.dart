import 'package:dio/dio.dart';
import 'package:module_3_movies_app/data/vos/movie_vo.dart';
import 'package:module_3_movies_app/network/api_constants.dart';
import 'package:module_3_movies_app/network/respones/get_actors_response.dart';
import 'package:module_3_movies_app/network/respones/get_credit_by_movie_response.dart';
import 'package:module_3_movies_app/network/respones/get_genre_response.dart';
import 'package:module_3_movies_app/network/respones/movie_list_response.dart';
import 'package:retrofit/http.dart';

part 'the_movie_api.g.dart';

@RestApi(baseUrl: BASE_URL_DIO)
abstract class TheMovieApi {
  factory TheMovieApi(Dio dio) = _TheMovieApi;

  @GET(END_POINTS_GET_NOW_PLAYING)
  Future<MovieListResponse> getNowPlayingMovies(
    @Query(PARAMS_API_KEY) String apiKey,
    @Query(PARAMS_LANGUAGE) String language,
    @Query(PARAMS_PAGE) String page,
  );

  @GET(END_POINTS_GET_POPULAR)
  Future<MovieListResponse> getPopularMovies(
      @Query(PARAMS_API_KEY) String apiKey,
      @Query(PARAMS_LANGUAGE) String language,
      @Query(PARAMS_PAGE) String page,
      );

  @GET(END_POINTS_GET_TOP_RATED)
  Future<MovieListResponse> getTopRatedMovies(
      @Query(PARAMS_API_KEY) String apiKey,
      @Query(PARAMS_LANGUAGE) String language,
      @Query(PARAMS_PAGE) String page,
      );

  @GET(END_POINTS_GET_MOVIES_BY_GENRE_ID)
  Future<MovieListResponse> getMoviesByGenreId(
      @Query(PARAMS_API_KEY) String apiKey,
      @Query(PARAMS_LANGUAGE) String language,
      @Query(PARAMS_PAGE) String genreId,
      );

  @GET(END_POINTS_GET_GENRES)
  Future<GetGenreResponse> getGenres(
      @Query(PARAMS_API_KEY) String apiKey,
      @Query(PARAMS_LANGUAGE) String language,);


  @GET(END_POINTS_GET_ACTORS)
  Future<GetActorsResponse> getActors(
      @Query(PARAMS_API_KEY) String apiKey,
      @Query(PARAMS_LANGUAGE) String language,
      @Query(PARAMS_PAGE) String page,
      );

  @GET("$END_POINTS_MOVIE_DETAIL/{movie_id}")
  Future<MovieVO?> getMoviesDetail(
      @Query(PARAMS_API_KEY) String apiKey,
      @Query(PARAMS_LANGUAGE) String language,
      @Path("movie_id")String movieId
      );

  @GET("/3/movie/{movie_id}/credits")
  Future<GetCreditByMovieResponse> getMovieCredit(
      @Query(PARAMS_API_KEY) String apiKey,
      @Query(PARAMS_LANGUAGE) String language,
      @Path("movie_id")String movieId
      );


}
