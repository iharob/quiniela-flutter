// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_results.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApplicationUser _$ApplicationUserFromJson(Map<String, dynamic> json) {
  return _ApplicationUser.fromJson(json);
}

/// @nodoc
mixin _$ApplicationUser {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;

  /// Serializes this ApplicationUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApplicationUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApplicationUserCopyWith<ApplicationUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationUserCopyWith<$Res> {
  factory $ApplicationUserCopyWith(
          ApplicationUser value, $Res Function(ApplicationUser) then) =
      _$ApplicationUserCopyWithImpl<$Res, ApplicationUser>;
  @useResult
  $Res call({int id, String name, String? photoUrl});
}

/// @nodoc
class _$ApplicationUserCopyWithImpl<$Res, $Val extends ApplicationUser>
    implements $ApplicationUserCopyWith<$Res> {
  _$ApplicationUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApplicationUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? photoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApplicationUserImplCopyWith<$Res>
    implements $ApplicationUserCopyWith<$Res> {
  factory _$$ApplicationUserImplCopyWith(_$ApplicationUserImpl value,
          $Res Function(_$ApplicationUserImpl) then) =
      __$$ApplicationUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String? photoUrl});
}

/// @nodoc
class __$$ApplicationUserImplCopyWithImpl<$Res>
    extends _$ApplicationUserCopyWithImpl<$Res, _$ApplicationUserImpl>
    implements _$$ApplicationUserImplCopyWith<$Res> {
  __$$ApplicationUserImplCopyWithImpl(
      _$ApplicationUserImpl _value, $Res Function(_$ApplicationUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApplicationUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? photoUrl = freezed,
  }) {
    return _then(_$ApplicationUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApplicationUserImpl implements _ApplicationUser {
  const _$ApplicationUserImpl(
      {required this.id, required this.name, this.photoUrl});

  factory _$ApplicationUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApplicationUserImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? photoUrl;

  @override
  String toString() {
    return 'ApplicationUser(id: $id, name: $name, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, photoUrl);

  /// Create a copy of ApplicationUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationUserImplCopyWith<_$ApplicationUserImpl> get copyWith =>
      __$$ApplicationUserImplCopyWithImpl<_$ApplicationUserImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApplicationUserImplToJson(
      this,
    );
  }
}

abstract class _ApplicationUser implements ApplicationUser {
  const factory _ApplicationUser(
      {required final int id,
      required final String name,
      final String? photoUrl}) = _$ApplicationUserImpl;

  factory _ApplicationUser.fromJson(Map<String, dynamic> json) =
      _$ApplicationUserImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get photoUrl;

  /// Create a copy of ApplicationUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplicationUserImplCopyWith<_$ApplicationUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserResult _$UserResultFromJson(Map<String, dynamic> json) {
  return _UserResult.fromJson(json);
}

/// @nodoc
mixin _$UserResult {
  ApplicationUser get user => throw _privateConstructorUsedError;
  int get team1Score => throw _privateConstructorUsedError;
  int get team2Score => throw _privateConstructorUsedError;

  /// Serializes this UserResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserResultCopyWith<UserResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserResultCopyWith<$Res> {
  factory $UserResultCopyWith(
          UserResult value, $Res Function(UserResult) then) =
      _$UserResultCopyWithImpl<$Res, UserResult>;
  @useResult
  $Res call({ApplicationUser user, int team1Score, int team2Score});

  $ApplicationUserCopyWith<$Res> get user;
}

/// @nodoc
class _$UserResultCopyWithImpl<$Res, $Val extends UserResult>
    implements $UserResultCopyWith<$Res> {
  _$UserResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? team1Score = null,
    Object? team2Score = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ApplicationUser,
      team1Score: null == team1Score
          ? _value.team1Score
          : team1Score // ignore: cast_nullable_to_non_nullable
              as int,
      team2Score: null == team2Score
          ? _value.team2Score
          : team2Score // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of UserResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApplicationUserCopyWith<$Res> get user {
    return $ApplicationUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserResultImplCopyWith<$Res>
    implements $UserResultCopyWith<$Res> {
  factory _$$UserResultImplCopyWith(
          _$UserResultImpl value, $Res Function(_$UserResultImpl) then) =
      __$$UserResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ApplicationUser user, int team1Score, int team2Score});

  @override
  $ApplicationUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$UserResultImplCopyWithImpl<$Res>
    extends _$UserResultCopyWithImpl<$Res, _$UserResultImpl>
    implements _$$UserResultImplCopyWith<$Res> {
  __$$UserResultImplCopyWithImpl(
      _$UserResultImpl _value, $Res Function(_$UserResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? team1Score = null,
    Object? team2Score = null,
  }) {
    return _then(_$UserResultImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ApplicationUser,
      team1Score: null == team1Score
          ? _value.team1Score
          : team1Score // ignore: cast_nullable_to_non_nullable
              as int,
      team2Score: null == team2Score
          ? _value.team2Score
          : team2Score // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserResultImpl implements _UserResult {
  const _$UserResultImpl(
      {required this.user, required this.team1Score, required this.team2Score});

  factory _$UserResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserResultImplFromJson(json);

  @override
  final ApplicationUser user;
  @override
  final int team1Score;
  @override
  final int team2Score;

  @override
  String toString() {
    return 'UserResult(user: $user, team1Score: $team1Score, team2Score: $team2Score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserResultImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.team1Score, team1Score) ||
                other.team1Score == team1Score) &&
            (identical(other.team2Score, team2Score) ||
                other.team2Score == team2Score));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user, team1Score, team2Score);

  /// Create a copy of UserResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserResultImplCopyWith<_$UserResultImpl> get copyWith =>
      __$$UserResultImplCopyWithImpl<_$UserResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserResultImplToJson(
      this,
    );
  }
}

abstract class _UserResult implements UserResult {
  const factory _UserResult(
      {required final ApplicationUser user,
      required final int team1Score,
      required final int team2Score}) = _$UserResultImpl;

  factory _UserResult.fromJson(Map<String, dynamic> json) =
      _$UserResultImpl.fromJson;

  @override
  ApplicationUser get user;
  @override
  int get team1Score;
  @override
  int get team2Score;

  /// Create a copy of UserResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserResultImplCopyWith<_$UserResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LiveScore _$LiveScoreFromJson(Map<String, dynamic> json) {
  return _LiveScore.fromJson(json);
}

/// @nodoc
mixin _$LiveScore {
  int get team1Score => throw _privateConstructorUsedError;
  int get team2Score => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this LiveScore to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LiveScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LiveScoreCopyWith<LiveScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveScoreCopyWith<$Res> {
  factory $LiveScoreCopyWith(LiveScore value, $Res Function(LiveScore) then) =
      _$LiveScoreCopyWithImpl<$Res, LiveScore>;
  @useResult
  $Res call({int team1Score, int team2Score, String status});
}

/// @nodoc
class _$LiveScoreCopyWithImpl<$Res, $Val extends LiveScore>
    implements $LiveScoreCopyWith<$Res> {
  _$LiveScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LiveScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? team1Score = null,
    Object? team2Score = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      team1Score: null == team1Score
          ? _value.team1Score
          : team1Score // ignore: cast_nullable_to_non_nullable
              as int,
      team2Score: null == team2Score
          ? _value.team2Score
          : team2Score // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiveScoreImplCopyWith<$Res>
    implements $LiveScoreCopyWith<$Res> {
  factory _$$LiveScoreImplCopyWith(
          _$LiveScoreImpl value, $Res Function(_$LiveScoreImpl) then) =
      __$$LiveScoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int team1Score, int team2Score, String status});
}

/// @nodoc
class __$$LiveScoreImplCopyWithImpl<$Res>
    extends _$LiveScoreCopyWithImpl<$Res, _$LiveScoreImpl>
    implements _$$LiveScoreImplCopyWith<$Res> {
  __$$LiveScoreImplCopyWithImpl(
      _$LiveScoreImpl _value, $Res Function(_$LiveScoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of LiveScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? team1Score = null,
    Object? team2Score = null,
    Object? status = null,
  }) {
    return _then(_$LiveScoreImpl(
      team1Score: null == team1Score
          ? _value.team1Score
          : team1Score // ignore: cast_nullable_to_non_nullable
              as int,
      team2Score: null == team2Score
          ? _value.team2Score
          : team2Score // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveScoreImpl implements _LiveScore {
  const _$LiveScoreImpl(
      {required this.team1Score, required this.team2Score, this.status = ''});

  factory _$LiveScoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveScoreImplFromJson(json);

  @override
  final int team1Score;
  @override
  final int team2Score;
  @override
  @JsonKey()
  final String status;

  @override
  String toString() {
    return 'LiveScore(team1Score: $team1Score, team2Score: $team2Score, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveScoreImpl &&
            (identical(other.team1Score, team1Score) ||
                other.team1Score == team1Score) &&
            (identical(other.team2Score, team2Score) ||
                other.team2Score == team2Score) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, team1Score, team2Score, status);

  /// Create a copy of LiveScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveScoreImplCopyWith<_$LiveScoreImpl> get copyWith =>
      __$$LiveScoreImplCopyWithImpl<_$LiveScoreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveScoreImplToJson(
      this,
    );
  }
}

abstract class _LiveScore implements LiveScore {
  const factory _LiveScore(
      {required final int team1Score,
      required final int team2Score,
      final String status}) = _$LiveScoreImpl;

  factory _LiveScore.fromJson(Map<String, dynamic> json) =
      _$LiveScoreImpl.fromJson;

  @override
  int get team1Score;
  @override
  int get team2Score;
  @override
  String get status;

  /// Create a copy of LiveScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiveScoreImplCopyWith<_$LiveScoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GameResultGroup _$GameResultGroupFromJson(Map<String, dynamic> json) {
  return _GameResultGroup.fromJson(json);
}

/// @nodoc
mixin _$GameResultGroup {
  Team get team1 => throw _privateConstructorUsedError;
  Team get team2 => throw _privateConstructorUsedError;
  List<UserResult> get groupResults => throw _privateConstructorUsedError;
  LiveScore? get liveScore => throw _privateConstructorUsedError;

  /// Serializes this GameResultGroup to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameResultGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameResultGroupCopyWith<GameResultGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameResultGroupCopyWith<$Res> {
  factory $GameResultGroupCopyWith(
          GameResultGroup value, $Res Function(GameResultGroup) then) =
      _$GameResultGroupCopyWithImpl<$Res, GameResultGroup>;
  @useResult
  $Res call(
      {Team team1,
      Team team2,
      List<UserResult> groupResults,
      LiveScore? liveScore});

  $TeamCopyWith<$Res> get team1;
  $TeamCopyWith<$Res> get team2;
  $LiveScoreCopyWith<$Res>? get liveScore;
}

/// @nodoc
class _$GameResultGroupCopyWithImpl<$Res, $Val extends GameResultGroup>
    implements $GameResultGroupCopyWith<$Res> {
  _$GameResultGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameResultGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? team1 = null,
    Object? team2 = null,
    Object? groupResults = null,
    Object? liveScore = freezed,
  }) {
    return _then(_value.copyWith(
      team1: null == team1
          ? _value.team1
          : team1 // ignore: cast_nullable_to_non_nullable
              as Team,
      team2: null == team2
          ? _value.team2
          : team2 // ignore: cast_nullable_to_non_nullable
              as Team,
      groupResults: null == groupResults
          ? _value.groupResults
          : groupResults // ignore: cast_nullable_to_non_nullable
              as List<UserResult>,
      liveScore: freezed == liveScore
          ? _value.liveScore
          : liveScore // ignore: cast_nullable_to_non_nullable
              as LiveScore?,
    ) as $Val);
  }

  /// Create a copy of GameResultGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get team1 {
    return $TeamCopyWith<$Res>(_value.team1, (value) {
      return _then(_value.copyWith(team1: value) as $Val);
    });
  }

  /// Create a copy of GameResultGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get team2 {
    return $TeamCopyWith<$Res>(_value.team2, (value) {
      return _then(_value.copyWith(team2: value) as $Val);
    });
  }

  /// Create a copy of GameResultGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LiveScoreCopyWith<$Res>? get liveScore {
    if (_value.liveScore == null) {
      return null;
    }

    return $LiveScoreCopyWith<$Res>(_value.liveScore!, (value) {
      return _then(_value.copyWith(liveScore: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GameResultGroupImplCopyWith<$Res>
    implements $GameResultGroupCopyWith<$Res> {
  factory _$$GameResultGroupImplCopyWith(_$GameResultGroupImpl value,
          $Res Function(_$GameResultGroupImpl) then) =
      __$$GameResultGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Team team1,
      Team team2,
      List<UserResult> groupResults,
      LiveScore? liveScore});

  @override
  $TeamCopyWith<$Res> get team1;
  @override
  $TeamCopyWith<$Res> get team2;
  @override
  $LiveScoreCopyWith<$Res>? get liveScore;
}

/// @nodoc
class __$$GameResultGroupImplCopyWithImpl<$Res>
    extends _$GameResultGroupCopyWithImpl<$Res, _$GameResultGroupImpl>
    implements _$$GameResultGroupImplCopyWith<$Res> {
  __$$GameResultGroupImplCopyWithImpl(
      _$GameResultGroupImpl _value, $Res Function(_$GameResultGroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameResultGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? team1 = null,
    Object? team2 = null,
    Object? groupResults = null,
    Object? liveScore = freezed,
  }) {
    return _then(_$GameResultGroupImpl(
      team1: null == team1
          ? _value.team1
          : team1 // ignore: cast_nullable_to_non_nullable
              as Team,
      team2: null == team2
          ? _value.team2
          : team2 // ignore: cast_nullable_to_non_nullable
              as Team,
      groupResults: null == groupResults
          ? _value._groupResults
          : groupResults // ignore: cast_nullable_to_non_nullable
              as List<UserResult>,
      liveScore: freezed == liveScore
          ? _value.liveScore
          : liveScore // ignore: cast_nullable_to_non_nullable
              as LiveScore?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameResultGroupImpl implements _GameResultGroup {
  const _$GameResultGroupImpl(
      {required this.team1,
      required this.team2,
      required final List<UserResult> groupResults,
      this.liveScore})
      : _groupResults = groupResults;

  factory _$GameResultGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameResultGroupImplFromJson(json);

  @override
  final Team team1;
  @override
  final Team team2;
  final List<UserResult> _groupResults;
  @override
  List<UserResult> get groupResults {
    if (_groupResults is EqualUnmodifiableListView) return _groupResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groupResults);
  }

  @override
  final LiveScore? liveScore;

  @override
  String toString() {
    return 'GameResultGroup(team1: $team1, team2: $team2, groupResults: $groupResults, liveScore: $liveScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameResultGroupImpl &&
            (identical(other.team1, team1) || other.team1 == team1) &&
            (identical(other.team2, team2) || other.team2 == team2) &&
            const DeepCollectionEquality()
                .equals(other._groupResults, _groupResults) &&
            (identical(other.liveScore, liveScore) ||
                other.liveScore == liveScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, team1, team2,
      const DeepCollectionEquality().hash(_groupResults), liveScore);

  /// Create a copy of GameResultGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameResultGroupImplCopyWith<_$GameResultGroupImpl> get copyWith =>
      __$$GameResultGroupImplCopyWithImpl<_$GameResultGroupImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameResultGroupImplToJson(
      this,
    );
  }
}

abstract class _GameResultGroup implements GameResultGroup {
  const factory _GameResultGroup(
      {required final Team team1,
      required final Team team2,
      required final List<UserResult> groupResults,
      final LiveScore? liveScore}) = _$GameResultGroupImpl;

  factory _GameResultGroup.fromJson(Map<String, dynamic> json) =
      _$GameResultGroupImpl.fromJson;

  @override
  Team get team1;
  @override
  Team get team2;
  @override
  List<UserResult> get groupResults;
  @override
  LiveScore? get liveScore;

  /// Create a copy of GameResultGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameResultGroupImplCopyWith<_$GameResultGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
