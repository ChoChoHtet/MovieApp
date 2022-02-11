import 'package:json_annotation/json_annotation.dart';
import 'package:module_3_movies_app/data/vos/movie_vo.dart';
part 'actors_vo.g.dart';

@JsonSerializable()
class
ActorsVO {
  @JsonKey(name: "adult")
  bool? adult;

  @JsonKey(name: "gender")
  int? gender;

  @JsonKey(name: "known_for_department")
  String? knownForDepartment;

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "original_name")
  String? originalName;

  @JsonKey(name: "popularity")
  double? popularity;

  @JsonKey(name: "cast_id")
  int? castId;

  @JsonKey(name: "profile_path")
  String? profilePath;

  @JsonKey(name: "character")
  String? character;

  @JsonKey(name: "credit_id")
  String? creditId;

  @JsonKey(name: "order")
  int? order;

  @JsonKey(name: "known_for")
  List<MovieVO>? knownFor;


  ActorsVO(
      this.adult,
      this.gender,
      this.knownForDepartment,
      this.id,
      this.name,
      this.originalName,
      this.popularity,
      this.castId,
      this.profilePath,
      this.character,
      this.creditId,
      this.order,
      this.knownFor);

  factory ActorsVO.fromJson( Map<String,dynamic> json) => _$ActorsVOFromJson(json);

  Map<String,dynamic> toJson() => _$ActorsVOToJson(this);
}
