import 'package:json_annotation/json_annotation.dart';
import 'package:module_3_movies_app/data/vos/date_vo.dart';
import 'package:module_3_movies_app/data/vos/movie_vo.dart';


part 'movie_list_response.g.dart';
@JsonSerializable()
class MovieListResponse {
  @JsonKey(name: "pages")
  int? pages;

  @JsonKey(name: "dates")
  DateVO? dates;

  @JsonKey(name: "results")
  List<MovieVO>? results;


  MovieListResponse(this.pages, this.dates, this.results);

  factory MovieListResponse.fromJson(Map<String, dynamic> json) => _$MovieListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListResponseToJson(this);
}
