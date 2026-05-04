// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rankings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RankingsEntryImpl _$$RankingsEntryImplFromJson(Map<String, dynamic> json) =>
    _$RankingsEntryImpl(
      userName: json['userName'] as String,
      userId: (json['userID'] as num).toInt(),
      totalScore: (json['totalScore'] as num).toInt(),
      totalScoreDifference: (json['totalScoreDifference'] as num).toInt(),
      rankDifference: (json['rankDifference'] as num).toInt(),
      currentRank: (json['currentRank'] as num).toInt(),
      bio: json['bio'] as String?,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$$RankingsEntryImplToJson(_$RankingsEntryImpl instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'userID': instance.userId,
      'totalScore': instance.totalScore,
      'totalScoreDifference': instance.totalScoreDifference,
      'rankDifference': instance.rankDifference,
      'currentRank': instance.currentRank,
      'bio': instance.bio,
      'photoUrl': instance.photoUrl,
    };
