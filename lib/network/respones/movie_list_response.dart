import 'package:json_annotation/json_annotation.dart';
import 'package:module_3_movies_app/data/vos/date_vo.dart';
import 'package:module_3_movies_app/data/vos/movie_vo.dart';


part 'get_now_playing_response.g.dart';
@JsonSerializable()
class MovieListResponse {
  @JsonKey(name: "pages")
  int? pages;

  @JsonKey(name: "dates")
  DateVO? dates;

  @JsonKey(name: "results")
  List<MovieVO>? results;


  MovieListResponse(this.pages, this.dates, this.results);

  factory MovieListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetNowPlayingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetNowPlayingResponseToJson(this);
}
