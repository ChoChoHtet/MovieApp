// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actors_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorsVO _$ActorsVOFromJson(Map<String, dynamic> json) => ActorsVO(
      json['adult'] as bool?,
      json['gender'] as int?,
      json['known_for_department'] as String?,
      json['id'] as int?,
      json['name'] as String?,
      json['original_name'] as String?,
      (json['popularity'] as num?)?.toDouble(),
      json['cast_id'] as int?,
      json['profile_path'] as String?,
      json['character'] as String?,
      json['credit_id'] as String?,
      json['order'] as int?,
      (json['known_for'] as List<dynamic>?)
          ?.map((e) => MovieVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ActorsVOToJson(ActorsVO instance) => <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'known_for_department': instance.knownForDepartment,
      'id': instance.id,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'cast_id': instance.castId,
      'profile_path': instance.profilePath,
      'character': instance.character,
      'credit_id': instance.creditId,
      'order': instance.order,
      'known_for': instance.knownFor,
    };
