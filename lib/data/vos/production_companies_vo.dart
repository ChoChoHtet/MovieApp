import 'package:json_annotation/json_annotation.dart';

part 'production_companies_vo.g.dart';

@JsonSerializable()
class ProductionCompaniesVO{
  @JsonKey(name:"id")
  int? id;

  @JsonKey(name: "logo_path")
  String? logoPath;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "origin_country")
  String? originalCountries;


  ProductionCompaniesVO(
      this.id, this.logoPath, this.name, this.originalCountries);

  factory ProductionCompaniesVO.fromJson( Map<String,dynamic> json) => _$ProductionCompaniesVOFromJson(json);

  Map<String,dynamic> toJson() => _$ProductionCompaniesVOToJson(this);
}