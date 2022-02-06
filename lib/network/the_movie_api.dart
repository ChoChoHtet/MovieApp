import 'package:dio/dio.dart';
import 'package:module_3_movies_app/network/api_constants.dart';
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
}
