// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'predicted_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PredictedResultImpl _$$PredictedResultImplFromJson(
        Map<String, dynamic> json) =>
    _$PredictedResultImpl(
      gameDate: json['gameDate'] as String,
      predictedTeam1:
          Team.fromJson(json['predictedTeam1'] as Map<String, dynamic>),
      predictedTeam2:
          Team.fromJson(json['predictedTeam2'] as Map<String, dynamic>),
      predictedScoreTeam1: (json['predictedScoreTeam1'] as num).toInt(),
      predictedScoreTeam2: (json['predictedScoreTeam2'] as num).toInt(),
      predictedWinner: json['predictedWinner'] as String?,
      actualTeam1: json['actualTeam1'] == null
          ? null
          : Team.fromJson(json['actualTeam1'] as Map<String, dynamic>),
      actualTeam2: json['actualTeam2'] == null
          ? null
          : Team.fromJson(json['actualTeam2'] as Map<String, dynamic>),
      actualScoreTeam1: (json['actualScoreTeam1'] as num?)?.toInt(),
      actualScoreTeam2: (json['actualScoreTeam2'] as num?)?.toInt(),
      actualWinner: json['actualWinner'] as String?,
      matchPoints: (json['matchPoints'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      round: (json['round'] as num).toInt(),
      classificationGroup: json['classificationGroup'] as String?,
      played: json['played'] as bool,
    );

Map<String, dynamic> _$$PredictedResultImplToJson(
        _$PredictedResultImpl instance) =>
    <String, dynamic>{
      'gameDate': instance.gameDate,
      'predictedTeam1': instance.predictedTeam1,
      'predictedTeam2': instance.predictedTeam2,
      'predictedScoreTeam1': instance.predictedScoreTeam1,
      'predictedScoreTeam2': instance.predictedScoreTeam2,
      'predictedWinner': instance.predictedWinner,
      'actualTeam1': instance.actualTeam1,
      'actualTeam2': instance.actualTeam2,
      'actualScoreTeam1': instance.actualScoreTeam1,
      'actualScoreTeam2': instance.actualScoreTeam2,
      'actualWinner': instance.actualWinner,
      'matchPoints': instance.matchPoints,
      'total': instance.total,
      'round': instance.round,
      'classificationGroup': instance.classificationGroup,
      'played': instance.played,
    };
