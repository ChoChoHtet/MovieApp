
import 'package:json_annotation/json_annotation.dart';
import 'package:module_3_movies_app/data/vos/actors_vo.dart';

part 'get_credit_by_movie_response.g.dart';

@JsonSerializable()
class GetCreditByMovieResponse{

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "cast")
  List<ActorsVO>? cast;

  @JsonKey(name: "crew")
  List<ActorsVO>? crew;


  GetCreditByMovieResponse(this.id, this.cast, this.crew);

  factory GetCreditByMovieResponse.fromJson( Map<String,dynamic> json) => _$GetCreditByMovieResponseFromJson(json);

  Map<String,dynamic> toJson() => _$GetCreditByMovieResponseToJson(this);


}