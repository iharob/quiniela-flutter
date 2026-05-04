// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rankings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RankingsEntry _$RankingsEntryFromJson(Map<String, dynamic> json) {
  return _RankingsEntry.fromJson(json);
}

/// @nodoc
mixin _$RankingsEntry {
  String get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'userID')
  int get userId => throw _privateConstructorUsedError;
  int get totalScore => throw _privateConstructorUsedError;
  int get totalScoreDifference => throw _privateConstructorUsedError;
  int get rankDifference => throw _privateConstructorUsedError;
  int get currentRank => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;

  /// Serializes this RankingsEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RankingsEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RankingsEntryCopyWith<RankingsEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RankingsEntryCopyWith<$Res> {
  factory $RankingsEntryCopyWith(
          RankingsEntry value, $Res Function(RankingsEntry) then) =
      _$RankingsEntryCopyWithImpl<$Res, RankingsEntry>;
  @useResult
  $Res call(
      {String userName,
      @JsonKey(name: 'userID') int userId,
      int totalScore,
      int totalScoreDifference,
      int rankDifference,
      int currentRank,
      String? bio,
      String? photoUrl});
}

/// @nodoc
class _$RankingsEntryCopyWithImpl<$Res, $Val extends RankingsEntry>
    implements $RankingsEntryCopyWith<$Res> {
  _$RankingsEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RankingsEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? userId = null,
    Object? totalScore = null,
    Object? totalScoreDifference = null,
    Object? rankDifference = null,
    Object? currentRank = null,
    Object? bio = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      totalScore: null == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int,
      totalScoreDifference: null == totalScoreDifference
          ? _value.totalScoreDifference
          : totalScoreDifference // ignore: cast_nullable_to_non_nullable
              as int,
      rankDifference: null == rankDifference
          ? _value.rankDifference
          : rankDifference // ignore: cast_nullable_to_non_nullable
              as int,
      currentRank: null == currentRank
          ? _value.currentRank
          : currentRank // ignore: cast_nullable_to_non_nullable
              as int,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RankingsEntryImplCopyWith<$Res>
    implements $RankingsEntryCopyWith<$Res> {
  factory _$$RankingsEntryImplCopyWith(
          _$RankingsEntryImpl value, $Res Function(_$RankingsEntryImpl) then) =
      __$$RankingsEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userName,
      @JsonKey(name: 'userID') int userId,
      int totalScore,
      int totalScoreDifference,
      int rankDifference,
      int currentRank,
      String? bio,
      String? photoUrl});
}

/// @nodoc
class __$$RankingsEntryImplCopyWithImpl<$Res>
    extends _$RankingsEntryCopyWithImpl<$Res, _$RankingsEntryImpl>
    implements _$$RankingsEntryImplCopyWith<$Res> {
  __$$RankingsEntryImplCopyWithImpl(
      _$RankingsEntryImpl _value, $Res Function(_$RankingsEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of RankingsEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? userId = null,
    Object? totalScore = null,
    Object? totalScoreDifference = null,
    Object? rankDifference = null,
    Object? currentRank = null,
    Object? bio = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_$RankingsEntryImpl(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      totalScore: null == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int,
      totalScoreDifference: null == totalScoreDifference
          ? _value.totalScoreDifference
          : totalScoreDifference // ignore: cast_nullable_to_non_nullable
              as int,
      rankDifference: null == rankDifference
          ? _value.rankDifference
          : rankDifference // ignore: cast_nullable_to_non_nullable
              as int,
      currentRank: null == currentRank
          ? _value.currentRank
          : currentRank // ignore: cast_nullable_to_non_nullable
              as int,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RankingsEntryImpl implements _RankingsEntry {
  const _$RankingsEntryImpl(
      {required this.userName,
      @JsonKey(name: 'userID') required this.userId,
      required this.totalScore,
      required this.totalScoreDifference,
      required this.rankDifference,
      required this.currentRank,
      this.bio,
      this.photoUrl});

  factory _$RankingsEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$RankingsEntryImplFromJson(json);

  @override
  final String userName;
  @override
  @JsonKey(name: 'userID')
  final int userId;
  @override
  final int totalScore;
  @override
  final int totalScoreDifference;
  @override
  final int rankDifference;
  @override
  final int currentRank;
  @override
  final String? bio;
  @override
  final String? photoUrl;

  @override
  String toString() {
    return 'RankingsEntry(userName: $userName, userId: $userId, totalScore: $totalScore, totalScoreDifference: $totalScoreDifference, rankDifference: $rankDifference, currentRank: $currentRank, bio: $bio, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RankingsEntryImpl &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.totalScore, totalScore) ||
                other.totalScore == totalScore) &&
            (identical(other.totalScoreDifference, totalScoreDifference) ||
                other.totalScoreDifference == totalScoreDifference) &&
            (identical(other.rankDifference, rankDifference) ||
                other.rankDifference == rankDifference) &&
            (identical(other.currentRank, currentRank) ||
                other.currentRank == currentRank) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userName, userId, totalScore,
      totalScoreDifference, rankDifference, currentRank, bio, photoUrl);

  /// Create a copy of RankingsEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RankingsEntryImplCopyWith<_$RankingsEntryImpl> get copyWith =>
      __$$RankingsEntryImplCopyWithImpl<_$RankingsEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RankingsEntryImplToJson(
      this,
    );
  }
}

abstract class _RankingsEntry implements RankingsEntry {
  const factory _RankingsEntry(
      {required final String userName,
      @JsonKey(name: 'userID') required final int userId,
      required final int totalScore,
      required final int totalScoreDifference,
      required final int rankDifference,
      required final int currentRank,
      final String? bio,
      final String? photoUrl}) = _$RankingsEntryImpl;

  factory _RankingsEntry.fromJson(Map<String, dynamic> json) =
      _$RankingsEntryImpl.fromJson;

  @override
  String get userName;
  @override
  @JsonKey(name: 'userID')
  int get userId;
  @override
  int get totalScore;
  @override
  int get totalScoreDifference;
  @override
  int get rankDifference;
  @override
  int get currentRank;
  @override
  String? get bio;
  @override
  String? get photoUrl;

  /// Create a copy of RankingsEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RankingsEntryImplCopyWith<_$RankingsEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
