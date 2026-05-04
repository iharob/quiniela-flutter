// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApplicationUserImpl _$$ApplicationUserImplFromJson(
        Map<String, dynamic> json) =>
    _$ApplicationUserImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$$ApplicationUserImplToJson(
        _$ApplicationUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
    };

_$UserResultImpl _$$UserResultImplFromJson(Map<String, dynamic> json) =>
    _$UserResultImpl(
      user: ApplicationUser.fromJson(json['user'] as Map<String, dynamic>),
      team1Score: (json['team1Score'] as num).toInt(),
      team2Score: (json['team2Score'] as num).toInt(),
    );

Map<String, dynamic> _$$UserResultImplToJson(_$UserResultImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'team1Score': instance.team1Score,
      'team2Score': instance.team2Score,
    };

_$LiveScoreImpl _$$LiveScoreImplFromJson(Map<String, dynamic> json) =>
    _$LiveScoreImpl(
      team1Score: (json['team1Score'] as num).toInt(),
      team2Score: (json['team2Score'] as num).toInt(),
      status: json['status'] as String? ?? '',
    );

Map<String, dynamic> _$$LiveScoreImplToJson(_$LiveScoreImpl instance) =>
    <String, dynamic>{
      'team1Score': instance.team1Score,
      'team2Score': instance.team2Score,
      'status': instance.status,
    };

_$GameResultGroupImpl _$$GameResultGroupImplFromJson(
        Map<String, dynamic> json) =>
    _$GameResultGroupImpl(
      team1: Team.fromJson(json['team1'] as Map<String, dynamic>),
      team2: Team.fromJson(json['team2'] as Map<String, dynamic>),
      groupResults: (json['groupResults'] as List<dynamic>)
          .map((e) => UserResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      liveScore: json['liveScore'] == null
          ? null
          : LiveScore.fromJson(json['liveScore'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GameResultGroupImplToJson(
        _$GameResultGroupImpl instance) =>
    <String, dynamic>{
      'team1': instance.team1,
      'team2': instance.team2,
      'groupResults': instance.groupResults,
      'liveScore': instance.liveScore,
    };
