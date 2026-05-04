// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'predicted_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PredictedResult _$PredictedResultFromJson(Map<String, dynamic> json) {
  return _PredictedResult.fromJson(json);
}

/// @nodoc
mixin _$PredictedResult {
  String get gameDate => throw _privateConstructorUsedError;
  Team get predictedTeam1 => throw _privateConstructorUsedError;
  Team get predictedTeam2 => throw _privateConstructorUsedError;
  int get predictedScoreTeam1 => throw _privateConstructorUsedError;
  int get predictedScoreTeam2 => throw _privateConstructorUsedError;
  String? get predictedWinner => throw _privateConstructorUsedError;
  Team? get actualTeam1 => throw _privateConstructorUsedError;
  Team? get actualTeam2 => throw _privateConstructorUsedError;
  int? get actualScoreTeam1 => throw _privateConstructorUsedError;
  int? get actualScoreTeam2 => throw _privateConstructorUsedError;
  String? get actualWinner => throw _privateConstructorUsedError;
  int get matchPoints => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get round => throw _privateConstructorUsedError;
  String? get classificationGroup => throw _privateConstructorUsedError;
  bool get played => throw _privateConstructorUsedError;

  /// Serializes this PredictedResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PredictedResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PredictedResultCopyWith<PredictedResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PredictedResultCopyWith<$Res> {
  factory $PredictedResultCopyWith(
          PredictedResult value, $Res Function(PredictedResult) then) =
      _$PredictedResultCopyWithImpl<$Res, PredictedResult>;
  @useResult
  $Res call(
      {String gameDate,
      Team predictedTeam1,
      Team predictedTeam2,
      int predictedScoreTeam1,
      int predictedScoreTeam2,
      String? predictedWinner,
      Team? actualTeam1,
      Team? actualTeam2,
      int? actualScoreTeam1,
      int? actualScoreTeam2,
      String? actualWinner,
      int matchPoints,
      int total,
      int round,
      String? classificationGroup,
      bool played});

  $TeamCopyWith<$Res> get predictedTeam1;
  $TeamCopyWith<$Res> get predictedTeam2;
  $TeamCopyWith<$Res>? get actualTeam1;
  $TeamCopyWith<$Res>? get actualTeam2;
}

/// @nodoc
class _$PredictedResultCopyWithImpl<$Res, $Val extends PredictedResult>
    implements $PredictedResultCopyWith<$Res> {
  _$PredictedResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PredictedResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameDate = null,
    Object? predictedTeam1 = null,
    Object? predictedTeam2 = null,
    Object? predictedScoreTeam1 = null,
    Object? predictedScoreTeam2 = null,
    Object? predictedWinner = freezed,
    Object? actualTeam1 = freezed,
    Object? actualTeam2 = freezed,
    Object? actualScoreTeam1 = freezed,
    Object? actualScoreTeam2 = freezed,
    Object? actualWinner = freezed,
    Object? matchPoints = null,
    Object? total = null,
    Object? round = null,
    Object? classificationGroup = freezed,
    Object? played = null,
  }) {
    return _then(_value.copyWith(
      gameDate: null == gameDate
          ? _value.gameDate
          : gameDate // ignore: cast_nullable_to_non_nullable
              as String,
      predictedTeam1: null == predictedTeam1
          ? _value.predictedTeam1
          : predictedTeam1 // ignore: cast_nullable_to_non_nullable
              as Team,
      predictedTeam2: null == predictedTeam2
          ? _value.predictedTeam2
          : predictedTeam2 // ignore: cast_nullable_to_non_nullable
              as Team,
      predictedScoreTeam1: null == predictedScoreTeam1
          ? _value.predictedScoreTeam1
          : predictedScoreTeam1 // ignore: cast_nullable_to_non_nullable
              as int,
      predictedScoreTeam2: null == predictedScoreTeam2
          ? _value.predictedScoreTeam2
          : predictedScoreTeam2 // ignore: cast_nullable_to_non_nullable
              as int,
      predictedWinner: freezed == predictedWinner
          ? _value.predictedWinner
          : predictedWinner // ignore: cast_nullable_to_non_nullable
              as String?,
      actualTeam1: freezed == actualTeam1
          ? _value.actualTeam1
          : actualTeam1 // ignore: cast_nullable_to_non_nullable
              as Team?,
      actualTeam2: freezed == actualTeam2
          ? _value.actualTeam2
          : actualTeam2 // ignore: cast_nullable_to_non_nullable
              as Team?,
      actualScoreTeam1: freezed == actualScoreTeam1
          ? _value.actualScoreTeam1
          : actualScoreTeam1 // ignore: cast_nullable_to_non_nullable
              as int?,
      actualScoreTeam2: freezed == actualScoreTeam2
          ? _value.actualScoreTeam2
          : actualScoreTeam2 // ignore: cast_nullable_to_non_nullable
              as int?,
      actualWinner: freezed == actualWinner
          ? _value.actualWinner
          : actualWinner // ignore: cast_nullable_to_non_nullable
              as String?,
      matchPoints: null == matchPoints
          ? _value.matchPoints
          : matchPoints // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      round: null == round
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as int,
      classificationGroup: freezed == classificationGroup
          ? _value.classificationGroup
          : classificationGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      played: null == played
          ? _value.played
          : played // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of PredictedResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get predictedTeam1 {
    return $TeamCopyWith<$Res>(_value.predictedTeam1, (value) {
      return _then(_value.copyWith(predictedTeam1: value) as $Val);
    });
  }

  /// Create a copy of PredictedResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get predictedTeam2 {
    return $TeamCopyWith<$Res>(_value.predictedTeam2, (value) {
      return _then(_value.copyWith(predictedTeam2: value) as $Val);
    });
  }

  /// Create a copy of PredictedResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res>? get actualTeam1 {
    if (_value.actualTeam1 == null) {
      return null;
    }

    return $TeamCopyWith<$Res>(_value.actualTeam1!, (value) {
      return _then(_value.copyWith(actualTeam1: value) as $Val);
    });
  }

  /// Create a copy of PredictedResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res>? get actualTeam2 {
    if (_value.actualTeam2 == null) {
      return null;
    }

    return $TeamCopyWith<$Res>(_value.actualTeam2!, (value) {
      return _then(_value.copyWith(actualTeam2: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PredictedResultImplCopyWith<$Res>
    implements $PredictedResultCopyWith<$Res> {
  factory _$$PredictedResultImplCopyWith(_$PredictedResultImpl value,
          $Res Function(_$PredictedResultImpl) then) =
      __$$PredictedResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String gameDate,
      Team predictedTeam1,
      Team predictedTeam2,
      int predictedScoreTeam1,
      int predictedScoreTeam2,
      String? predictedWinner,
      Team? actualTeam1,
      Team? actualTeam2,
      int? actualScoreTeam1,
      int? actualScoreTeam2,
      String? actualWinner,
      int matchPoints,
      int total,
      int round,
      String? classificationGroup,
      bool played});

  @override
  $TeamCopyWith<$Res> get predictedTeam1;
  @override
  $TeamCopyWith<$Res> get predictedTeam2;
  @override
  $TeamCopyWith<$Res>? get actualTeam1;
  @override
  $TeamCopyWith<$Res>? get actualTeam2;
}

/// @nodoc
class __$$PredictedResultImplCopyWithImpl<$Res>
    extends _$PredictedResultCopyWithImpl<$Res, _$PredictedResultImpl>
    implements _$$PredictedResultImplCopyWith<$Res> {
  __$$PredictedResultImplCopyWithImpl(
      _$PredictedResultImpl _value, $Res Function(_$PredictedResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of PredictedResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameDate = null,
    Object? predictedTeam1 = null,
    Object? predictedTeam2 = null,
    Object? predictedScoreTeam1 = null,
    Object? predictedScoreTeam2 = null,
    Object? predictedWinner = freezed,
    Object? actualTeam1 = freezed,
    Object? actualTeam2 = freezed,
    Object? actualScoreTeam1 = freezed,
    Object? actualScoreTeam2 = freezed,
    Object? actualWinner = freezed,
    Object? matchPoints = null,
    Object? total = null,
    Object? round = null,
    Object? classificationGroup = freezed,
    Object? played = null,
  }) {
    return _then(_$PredictedResultImpl(
      gameDate: null == gameDate
          ? _value.gameDate
          : gameDate // ignore: cast_nullable_to_non_nullable
              as String,
      predictedTeam1: null == predictedTeam1
          ? _value.predictedTeam1
          : predictedTeam1 // ignore: cast_nullable_to_non_nullable
              as Team,
      predictedTeam2: null == predictedTeam2
          ? _value.predictedTeam2
          : predictedTeam2 // ignore: cast_nullable_to_non_nullable
              as Team,
      predictedScoreTeam1: null == predictedScoreTeam1
          ? _value.predictedScoreTeam1
          : predictedScoreTeam1 // ignore: cast_nullable_to_non_nullable
              as int,
      predictedScoreTeam2: null == predictedScoreTeam2
          ? _value.predictedScoreTeam2
          : predictedScoreTeam2 // ignore: cast_nullable_to_non_nullable
              as int,
      predictedWinner: freezed == predictedWinner
          ? _value.predictedWinner
          : predictedWinner // ignore: cast_nullable_to_non_nullable
              as String?,
      actualTeam1: freezed == actualTeam1
          ? _value.actualTeam1
          : actualTeam1 // ignore: cast_nullable_to_non_nullable
              as Team?,
      actualTeam2: freezed == actualTeam2
          ? _value.actualTeam2
          : actualTeam2 // ignore: cast_nullable_to_non_nullable
              as Team?,
      actualScoreTeam1: freezed == actualScoreTeam1
          ? _value.actualScoreTeam1
          : actualScoreTeam1 // ignore: cast_nullable_to_non_nullable
              as int?,
      actualScoreTeam2: freezed == actualScoreTeam2
          ? _value.actualScoreTeam2
          : actualScoreTeam2 // ignore: cast_nullable_to_non_nullable
              as int?,
      actualWinner: freezed == actualWinner
          ? _value.actualWinner
          : actualWinner // ignore: cast_nullable_to_non_nullable
              as String?,
      matchPoints: null == matchPoints
          ? _value.matchPoints
          : matchPoints // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      round: null == round
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as int,
      classificationGroup: freezed == classificationGroup
          ? _value.classificationGroup
          : classificationGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      played: null == played
          ? _value.played
          : played // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PredictedResultImpl implements _PredictedResult {
  const _$PredictedResultImpl(
      {required this.gameDate,
      required this.predictedTeam1,
      required this.predictedTeam2,
      required this.predictedScoreTeam1,
      required this.predictedScoreTeam2,
      this.predictedWinner,
      this.actualTeam1,
      this.actualTeam2,
      this.actualScoreTeam1,
      this.actualScoreTeam2,
      this.actualWinner,
      required this.matchPoints,
      required this.total,
      required this.round,
      this.classificationGroup,
      required this.played});

  factory _$PredictedResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$PredictedResultImplFromJson(json);

  @override
  final String gameDate;
  @override
  final Team predictedTeam1;
  @override
  final Team predictedTeam2;
  @override
  final int predictedScoreTeam1;
  @override
  final int predictedScoreTeam2;
  @override
  final String? predictedWinner;
  @override
  final Team? actualTeam1;
  @override
  final Team? actualTeam2;
  @override
  final int? actualScoreTeam1;
  @override
  final int? actualScoreTeam2;
  @override
  final String? actualWinner;
  @override
  final int matchPoints;
  @override
  final int total;
  @override
  final int round;
  @override
  final String? classificationGroup;
  @override
  final bool played;

  @override
  String toString() {
    return 'PredictedResult(gameDate: $gameDate, predictedTeam1: $predictedTeam1, predictedTeam2: $predictedTeam2, predictedScoreTeam1: $predictedScoreTeam1, predictedScoreTeam2: $predictedScoreTeam2, predictedWinner: $predictedWinner, actualTeam1: $actualTeam1, actualTeam2: $actualTeam2, actualScoreTeam1: $actualScoreTeam1, actualScoreTeam2: $actualScoreTeam2, actualWinner: $actualWinner, matchPoints: $matchPoints, total: $total, round: $round, classificationGroup: $classificationGroup, played: $played)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PredictedResultImpl &&
            (identical(other.gameDate, gameDate) ||
                other.gameDate == gameDate) &&
            (identical(other.predictedTeam1, predictedTeam1) ||
                other.predictedTeam1 == predictedTeam1) &&
            (identical(other.predictedTeam2, predictedTeam2) ||
                other.predictedTeam2 == predictedTeam2) &&
            (identical(other.predictedScoreTeam1, predictedScoreTeam1) ||
                other.predictedScoreTeam1 == predictedScoreTeam1) &&
            (identical(other.predictedScoreTeam2, predictedScoreTeam2) ||
                other.predictedScoreTeam2 == predictedScoreTeam2) &&
            (identical(other.predictedWinner, predictedWinner) ||
                other.predictedWinner == predictedWinner) &&
            (identical(other.actualTeam1, actualTeam1) ||
                other.actualTeam1 == actualTeam1) &&
            (identical(other.actualTeam2, actualTeam2) ||
                other.actualTeam2 == actualTeam2) &&
            (identical(other.actualScoreTeam1, actualScoreTeam1) ||
                other.actualScoreTeam1 == actualScoreTeam1) &&
            (identical(other.actualScoreTeam2, actualScoreTeam2) ||
                other.actualScoreTeam2 == actualScoreTeam2) &&
            (identical(other.actualWinner, actualWinner) ||
                other.actualWinner == actualWinner) &&
            (identical(other.matchPoints, matchPoints) ||
                other.matchPoints == matchPoints) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.round, round) || other.round == round) &&
            (identical(other.classificationGroup, classificationGroup) ||
                other.classificationGroup == classificationGroup) &&
            (identical(other.played, played) || other.played == played));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      gameDate,
      predictedTeam1,
      predictedTeam2,
      predictedScoreTeam1,
      predictedScoreTeam2,
      predictedWinner,
      actualTeam1,
      actualTeam2,
      actualScoreTeam1,
      actualScoreTeam2,
      actualWinner,
      matchPoints,
      total,
      round,
      classificationGroup,
      played);

  /// Create a copy of PredictedResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PredictedResultImplCopyWith<_$PredictedResultImpl> get copyWith =>
      __$$PredictedResultImplCopyWithImpl<_$PredictedResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PredictedResultImplToJson(
      this,
    );
  }
}

abstract class _PredictedResult implements PredictedResult {
  const factory _PredictedResult(
      {required final String gameDate,
      required final Team predictedTeam1,
      required final Team predictedTeam2,
      required final int predictedScoreTeam1,
      required final int predictedScoreTeam2,
      final String? predictedWinner,
      final Team? actualTeam1,
      final Team? actualTeam2,
      final int? actualScoreTeam1,
      final int? actualScoreTeam2,
      final String? actualWinner,
      required final int matchPoints,
      required final int total,
      required final int round,
      final String? classificationGroup,
      required final bool played}) = _$PredictedResultImpl;

  factory _PredictedResult.fromJson(Map<String, dynamic> json) =
      _$PredictedResultImpl.fromJson;

  @override
  String get gameDate;
  @override
  Team get predictedTeam1;
  @override
  Team get predictedTeam2;
  @override
  int get predictedScoreTeam1;
  @override
  int get predictedScoreTeam2;
  @override
  String? get predictedWinner;
  @override
  Team? get actualTeam1;
  @override
  Team? get actualTeam2;
  @override
  int? get actualScoreTeam1;
  @override
  int? get actualScoreTeam2;
  @override
  String? get actualWinner;
  @override
  int get matchPoints;
  @override
  int get total;
  @override
  int get round;
  @override
  String? get classificationGroup;
  @override
  bool get played;

  /// Create a copy of PredictedResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PredictedResultImplCopyWith<_$PredictedResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PointsDetails {
  List<PredictedResult> get groups => throw _privateConstructorUsedError;
  List<PredictedResult> get knockout => throw _privateConstructorUsedError;
  PredictedResult? get finalMatch => throw _privateConstructorUsedError;

  /// Create a copy of PointsDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PointsDetailsCopyWith<PointsDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointsDetailsCopyWith<$Res> {
  factory $PointsDetailsCopyWith(
          PointsDetails value, $Res Function(PointsDetails) then) =
      _$PointsDetailsCopyWithImpl<$Res, PointsDetails>;
  @useResult
  $Res call(
      {List<PredictedResult> groups,
      List<PredictedResult> knockout,
      PredictedResult? finalMatch});

  $PredictedResultCopyWith<$Res>? get finalMatch;
}

/// @nodoc
class _$PointsDetailsCopyWithImpl<$Res, $Val extends PointsDetails>
    implements $PointsDetailsCopyWith<$Res> {
  _$PointsDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PointsDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groups = null,
    Object? knockout = null,
    Object? finalMatch = freezed,
  }) {
    return _then(_value.copyWith(
      groups: null == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<PredictedResult>,
      knockout: null == knockout
          ? _value.knockout
          : knockout // ignore: cast_nullable_to_non_nullable
              as List<PredictedResult>,
      finalMatch: freezed == finalMatch
          ? _value.finalMatch
          : finalMatch // ignore: cast_nullable_to_non_nullable
              as PredictedResult?,
    ) as $Val);
  }

  /// Create a copy of PointsDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictedResultCopyWith<$Res>? get finalMatch {
    if (_value.finalMatch == null) {
      return null;
    }

    return $PredictedResultCopyWith<$Res>(_value.finalMatch!, (value) {
      return _then(_value.copyWith(finalMatch: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PointsDetailsImplCopyWith<$Res>
    implements $PointsDetailsCopyWith<$Res> {
  factory _$$PointsDetailsImplCopyWith(
          _$PointsDetailsImpl value, $Res Function(_$PointsDetailsImpl) then) =
      __$$PointsDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PredictedResult> groups,
      List<PredictedResult> knockout,
      PredictedResult? finalMatch});

  @override
  $PredictedResultCopyWith<$Res>? get finalMatch;
}

/// @nodoc
class __$$PointsDetailsImplCopyWithImpl<$Res>
    extends _$PointsDetailsCopyWithImpl<$Res, _$PointsDetailsImpl>
    implements _$$PointsDetailsImplCopyWith<$Res> {
  __$$PointsDetailsImplCopyWithImpl(
      _$PointsDetailsImpl _value, $Res Function(_$PointsDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PointsDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groups = null,
    Object? knockout = null,
    Object? finalMatch = freezed,
  }) {
    return _then(_$PointsDetailsImpl(
      groups: null == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<PredictedResult>,
      knockout: null == knockout
          ? _value._knockout
          : knockout // ignore: cast_nullable_to_non_nullable
              as List<PredictedResult>,
      finalMatch: freezed == finalMatch
          ? _value.finalMatch
          : finalMatch // ignore: cast_nullable_to_non_nullable
              as PredictedResult?,
    ));
  }
}

/// @nodoc

class _$PointsDetailsImpl implements _PointsDetails {
  const _$PointsDetailsImpl(
      {final List<PredictedResult> groups = const <PredictedResult>[],
      final List<PredictedResult> knockout = const <PredictedResult>[],
      this.finalMatch})
      : _groups = groups,
        _knockout = knockout;

  final List<PredictedResult> _groups;
  @override
  @JsonKey()
  List<PredictedResult> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  final List<PredictedResult> _knockout;
  @override
  @JsonKey()
  List<PredictedResult> get knockout {
    if (_knockout is EqualUnmodifiableListView) return _knockout;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_knockout);
  }

  @override
  final PredictedResult? finalMatch;

  @override
  String toString() {
    return 'PointsDetails(groups: $groups, knockout: $knockout, finalMatch: $finalMatch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointsDetailsImpl &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            const DeepCollectionEquality().equals(other._knockout, _knockout) &&
            (identical(other.finalMatch, finalMatch) ||
                other.finalMatch == finalMatch));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_groups),
      const DeepCollectionEquality().hash(_knockout),
      finalMatch);

  /// Create a copy of PointsDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PointsDetailsImplCopyWith<_$PointsDetailsImpl> get copyWith =>
      __$$PointsDetailsImplCopyWithImpl<_$PointsDetailsImpl>(this, _$identity);
}

abstract class _PointsDetails implements PointsDetails {
  const factory _PointsDetails(
      {final List<PredictedResult> groups,
      final List<PredictedResult> knockout,
      final PredictedResult? finalMatch}) = _$PointsDetailsImpl;

  @override
  List<PredictedResult> get groups;
  @override
  List<PredictedResult> get knockout;
  @override
  PredictedResult? get finalMatch;

  /// Create a copy of PointsDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PointsDetailsImplCopyWith<_$PointsDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
