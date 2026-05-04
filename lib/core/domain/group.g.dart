// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupImpl _$$GroupImplFromJson(Map<String, dynamic> json) => _$GroupImpl(
      name: json['name'] as String,
      games: (json['games'] as List<dynamic>)
          .map((e) => Game.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GroupImplToJson(_$GroupImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'games': instance.games,
    };

_$GroupWithResultsImpl _$$GroupWithResultsImplFromJson(
        Map<String, dynamic> json) =>
    _$GroupWithResultsImpl(
      name: json['name'] as String,
      games: (json['games'] as List<dynamic>)
          .map((e) => GameWithResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GroupWithResultsImplToJson(
        _$GroupWithResultsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'games': instance.games,
    };
