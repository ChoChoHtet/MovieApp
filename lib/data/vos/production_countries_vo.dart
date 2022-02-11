import 'package:json_annotation/json_annotation.dart';

part 'production_countries_vo.g.dart';
@JsonSerializable()
class ProductionCountriesVO{
  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "iso_3166_1")
  String? iso;

  ProductionCountriesVO(this.name, this.iso);

  factory ProductionCountriesVO.fromJson( Map<String,dynamic> json) => _$ProductionCountriesVOFromJson(json);

  Map<String,dynamic> toJson() => _$ProductionCountriesVOToJson(this);
}