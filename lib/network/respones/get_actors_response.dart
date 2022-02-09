
import 'package:json_annotation/json_annotation.dart';
import 'package:module_3_movies_app/data/vos/actors_vo.dart';

part 'get_actors_response.g.dart';

@JsonSerializable()
class GetActorsResponse{
  @JsonKey(name: "results")
  List<ActorsVO>? results;

  GetActorsResponse(this.results);
  factory GetActorsResponse.fromJson(Map<String, dynamic> json) => _$GetActorsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetActorsResponseToJson(this);
}