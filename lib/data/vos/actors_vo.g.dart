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
      adult: fields[0] as bool?,
      gender: fields[1] as int?,
      knownForDepartment: fields[2] as String?,
      id: fields[3] as int?,
      name: fields[4] as String?,
      originalName: fields[5] as String?,
      popularity: fields[6] as double?,
      castId: fields[7] as int?,
      profilePath: fields[8] as String?,
      character: fields[9] as String?,
      creditId: fields[10] as String?,
      order: fields[11] as int?,
      knownFor: (fields[12] as List?)?.cast<MovieVO>(),
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
      adult: json['adult'] as bool?,
      gender: json['gender'] as int?,
      knownForDepartment: json['known_for_department'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      originalName: json['original_name'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      castId: json['cast_id'] as int?,
      profilePath: json['profile_path'] as String?,
      character: json['character'] as String?,
      creditId: json['credit_id'] as String?,
      order: json['order'] as int?,
      knownFor: (json['known_for'] as List<dynamic>?)
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
