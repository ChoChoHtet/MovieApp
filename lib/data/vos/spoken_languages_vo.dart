import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:module_3_movies_app/persistence/hive_constants.dart';

part 'spoken_languages_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_SPOKEN_LANGUAGES_VO,adapterName: "SpokenLanguagesVOAdapter")
class SpokenLanguagesVO{
  @JsonKey(name: "english_name")
  @HiveField(0)
  String? englishName;

  @JsonKey(name: "iso_639_1")
  @HiveField(1)
  String? iso;

  @JsonKey(name: "name")
  @HiveField(2)
  String? name;

  SpokenLanguagesVO(this.englishName, this.iso, this.name);

  factory SpokenLanguagesVO.fromJson( Map<String,dynamic> json) => _$SpokenLanguagesVOFromJson(json);

  Map<String,dynamic> toJson() => _$SpokenLanguagesVOToJson(this);
}