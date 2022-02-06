
import 'package:json_annotation/json_annotation.dart';
import 'package:module_3_movies_app/data/vos/actors_vo.dart';

@JsonSerializable()
class GetActorsResponse{
  @JsonKey(name: "results")
  List<ActorsVO>? results;

}