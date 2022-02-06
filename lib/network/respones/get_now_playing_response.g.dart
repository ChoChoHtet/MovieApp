// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListResponse _$GetNowPlayingResponseFromJson(
        Map<String, dynamic> json) =>
    MovieListResponse(
      json['pages'] as int?,
      json['dates'] == null
          ? null
          : DateVO.fromJson(json['dates'] as Map<String, dynamic>),
      (json['results'] as List<dynamic>?)
          ?.map((e) => MovieVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetNowPlayingResponseToJson(
        MovieListResponse instance) =>
    <String, dynamic>{
      'pages': instance.pages,
      'dates': instance.dates,
      'results': instance.results,
    };
