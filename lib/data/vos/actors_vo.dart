import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:module_3_movies_app/data/vos/movie_vo.dart';
import 'package:module_3_movies_app/persistence/hive_constants.dart';
part 'actors_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_ACTOR_VO,adapterName: "ActorsVOAdapter")
class
ActorsVO {
  @JsonKey(name: "adult")
  @HiveField(0)
  bool? adult;

  @JsonKey(name: "gender")
  @HiveField(1)
  int? gender;

  @JsonKey(name: "known_for_department")
  @HiveField(2)
  String? knownForDepartment;

  @JsonKey(name: "id")
  @HiveField(3)
  int? id;

  @JsonKey(name: "name")
  @HiveField(4)
  String? name;

  @JsonKey(name: "original_name")
  @HiveField(5)
  String? originalName;

  @JsonKey(name: "popularity")
  @HiveField(6)
  double? popularity;

  @JsonKey(name: "cast_id")
  @HiveField(7)
  int? castId;

  @JsonKey(name: "profile_path")
  @HiveField(8)
  String? profilePath;

  @JsonKey(name: "character")
  @HiveField(9)
  String? character;

  @JsonKey(name: "credit_id")
  @HiveField(10)
  String? creditId;

  @JsonKey(name: "order")
  @HiveField(11)
  int? order;

  @JsonKey(name: "known_for")
  @HiveField(12)
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
