// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actors_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActorsVOAdapter extends TypeAdapter<ActorsVO> {
  @override
  final int typeId = 1;

  @override
  ActorsVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActorsVO(
      fields[0] as bool?,
      fields[1] as int?,
      fields[2] as String?,
      fields[3] as int?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as double?,
      fields[7] as int?,
      fields[8] as String?,
      fields[9] as String?,
      fields[10] as String?,
      fields[11] as int?,
      (fields[12] as List?)?.cast<MovieVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, ActorsVO obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.gender)
      ..writeByte(2)
      ..write(obj.knownForDepartment)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.originalName)
      ..writeByte(6)
      ..write(obj.popularity)
      ..writeByte(7)
      ..write(obj.castId)
      ..writeByte(8)
      ..write(obj.profilePath)
      ..writeByte(9)
      ..write(obj.character)
      ..writeByte(10)
      ..write(obj.creditId)
      ..writeByte(11)
      ..write(obj.order)
      ..writeByte(12)
      ..write(obj.knownFor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActorsVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
