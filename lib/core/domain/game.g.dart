// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameImpl _$$GameImplFromJson(Map<String, dynamic> json) => _$GameImpl(
      gameId: (json['gameId'] as num).toInt(),
      team1: Team.fromJson(json['team1'] as Map<String, dynamic>),
      team2: Team.fromJson(json['team2'] as Map<String, dynamic>),
      date: json['date'] as String?,
    );

Map<String, dynamic> _$$GameImplToJson(_$GameImpl instance) =>
    <String, dynamic>{
      'gameId': instance.gameId,
      'team1': instance.team1,
      'team2': instance.team2,
      'date': instance.date,
    };

_$GameWithResultImpl _$$GameWithResultImplFromJson(Map<String, dynamic> json) =>
    _$GameWithResultImpl(
      gameId: (json['gameId'] as num).toInt(),
      team1: Team.fromJson(json['team1'] as Map<String, dynamic>),
      team2: Team.fromJson(json['team2'] as Map<String, dynamic>),
      date: json['date'] as String?,
      team1Score: (json['team1Score'] as num?)?.toInt(),
      team2Score: (json['team2Score'] as num?)?.toInt(),
      winner: json['winner'] == null
          ? null
          : Team.fromJson(json['winner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GameWithResultImplToJson(
        _$GameWithResultImpl instance) =>
    <String, dynamic>{
      'gameId': instance.gameId,
      'team1': instance.team1,
      'team2': instance.team2,
      'date': instance.date,
      'team1Score': instance.team1Score,
      'team2Score': instance.team2Score,
      'winner': instance.winner,
    };

_$BracketMatchImpl _$$BracketMatchImplFromJson(Map<String, dynamic> json) =>
    _$BracketMatchImpl(
      gameId: (json['gameId'] as num).toInt(),
      team1: json['team1'] == null
          ? null
          : Team.fromJson(json['team1'] as Map<String, dynamic>),
      team2: json['team2'] == null
          ? null
          : Team.fromJson(json['team2'] as Map<String, dynamic>),
      team1Score: (json['team1Score'] as num?)?.toInt(),
      team2Score: (json['team2Score'] as num?)?.toInt(),
      winner: json['winner'] == null
          ? null
          : Team.fromJson(json['winner'] as Map<String, dynamic>),
      date: json['date'] as String?,
      team1FromGame: (json['team1FromGame'] as num?)?.toInt(),
      team2FromGame: (json['team2FromGame'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$BracketMatchImplToJson(_$BracketMatchImpl instance) =>
    <String, dynamic>{
      'gameId': instance.gameId,
      'team1': instance.team1,
      'team2': instance.team2,
      'team1Score': instance.team1Score,
      'team2Score': instance.team2Score,
      'winner': instance.winner,
      'date': instance.date,
      'team1FromGame': instance.team1FromGame,
      'team2FromGame': instance.team2FromGame,
    };

_$BracketRoundImpl _$$BracketRoundImplFromJson(Map<String, dynamic> json) =>
    _$BracketRoundImpl(
      round: (json['round'] as num).toInt(),
      matches: (json['matches'] as List<dynamic>)
          .map((e) => BracketMatch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BracketRoundImplToJson(_$BracketRoundImpl instance) =>
    <String, dynamic>{
      'round': instance.round,
      'matches': instance.matches,
    };
