import 'package:json_annotation/json_annotation.dart';
import 'package:module_3_movies_app/data/vos/movie_vo.dart';
part 'actors_vo.g.dart';

@JsonSerializable()
class ActorsVO {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "popularity")
  double? popularity;
  @JsonKey(name: "profile_path")
  String? profilePath;
  @JsonKey(name: "known_for")
  List<MovieVO>? knownFor;

  ActorsVO(
      this.id, this.name, this.popularity, this.profilePath, this.knownFor);

  factory ActorsVO.fromJson( Map<String,dynamic> json) => _$ActorsVOFromJson(json);

  Map<String,dynamic> toJson() => _$ActorsVOToJson(this);
}
