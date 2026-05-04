// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserSessionImpl _$$UserSessionImplFromJson(Map<String, dynamic> json) =>
    _$UserSessionImpl(
      userId: (json['userId'] as num).toInt(),
      token: json['token'] as String,
      predicted: json['predicted'] as bool,
      payed: json['payed'] as bool,
    );

Map<String, dynamic> _$$UserSessionImplToJson(_$UserSessionImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'token': instance.token,
      'predicted': instance.predicted,
      'payed': instance.payed,
    };

_$AuthResponseImpl _$$AuthResponseImplFromJson(Map<String, dynamic> json) =>
    _$AuthResponseImpl(
      token: json['token'] as String,
      predicted: json['predicted'] as bool,
      payed: json['payed'] as bool,
    );

Map<String, dynamic> _$$AuthResponseImplToJson(_$AuthResponseImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'predicted': instance.predicted,
      'payed': instance.payed,
    };

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      userId: (json['userID'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      bio: json['bio'] as String?,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'userID': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'bio': instance.bio,
      'photoUrl': instance.photoUrl,
    };

_$PublicUserProfileImpl _$$PublicUserProfileImplFromJson(
        Map<String, dynamic> json) =>
    _$PublicUserProfileImpl(
      userId: (json['userID'] as num).toInt(),
      name: json['name'] as String,
      bio: json['bio'] as String?,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$$PublicUserProfileImplToJson(
        _$PublicUserProfileImpl instance) =>
    <String, dynamic>{
      'userID': instance.userId,
      'name': instance.name,
      'bio': instance.bio,
      'photoUrl': instance.photoUrl,
    };
