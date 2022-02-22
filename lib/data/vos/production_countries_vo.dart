import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:module_3_movies_app/persistence/hive_constants.dart';

part 'production_countries_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_PRODUCTION_COUNTRIES_VO,adapterName: "ProductionCountriesVOAdapter")
class ProductionCountriesVO{
  @JsonKey(name: "name")
  @HiveField(0)
  String? name;

  @JsonKey(name: "iso_3166_1")
  @HiveField(1)
  String? iso;

  ProductionCountriesVO(this.name, this.iso);

  factory ProductionCountriesVO.fromJson( Map<String,dynamic> json) => _$ProductionCountriesVOFromJson(json);

  Map<String,dynamic> toJson() => _$ProductionCountriesVOToJson(this);
}