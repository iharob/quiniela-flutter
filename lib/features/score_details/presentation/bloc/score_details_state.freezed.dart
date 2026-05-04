// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'score_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScoreDetailsState {
  bool get fetching => throw _privateConstructorUsedError;
  PointsDetails? get data => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of ScoreDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScoreDetailsStateCopyWith<ScoreDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoreDetailsStateCopyWith<$Res> {
  factory $ScoreDetailsStateCopyWith(
          ScoreDetailsState value, $Res Function(ScoreDetailsState) then) =
      _$ScoreDetailsStateCopyWithImpl<$Res, ScoreDetailsState>;
  @useResult
  $Res call({bool fetching, PointsDetails? data, String? error});

  $PointsDetailsCopyWith<$Res>? get data;
}

/// @nodoc
class _$ScoreDetailsStateCopyWithImpl<$Res, $Val extends ScoreDetailsState>
    implements $ScoreDetailsStateCopyWith<$Res> {
  _$ScoreDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScoreDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetching = null,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      fetching: null == fetching
          ? _value.fetching
          : fetching // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PointsDetails?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of ScoreDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PointsDetailsCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $PointsDetailsCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScoreDetailsStateImplCopyWith<$Res>
    implements $ScoreDetailsStateCopyWith<$Res> {
  factory _$$ScoreDetailsStateImplCopyWith(_$ScoreDetailsStateImpl value,
          $Res Function(_$ScoreDetailsStateImpl) then) =
      __$$ScoreDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool fetching, PointsDetails? data, String? error});

  @override
  $PointsDetailsCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ScoreDetailsStateImplCopyWithImpl<$Res>
    extends _$ScoreDetailsStateCopyWithImpl<$Res, _$ScoreDetailsStateImpl>
    implements _$$ScoreDetailsStateImplCopyWith<$Res> {
  __$$ScoreDetailsStateImplCopyWithImpl(_$ScoreDetailsStateImpl _value,
      $Res Function(_$ScoreDetailsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScoreDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetching = null,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_$ScoreDetailsStateImpl(
      fetching: null == fetching
          ? _value.fetching
          : fetching // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PointsDetails?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ScoreDetailsStateImpl implements _ScoreDetailsState {
  const _$ScoreDetailsStateImpl({this.fetching = false, this.data, this.error});

  @override
  @JsonKey()
  final bool fetching;
  @override
  final PointsDetails? data;
  @override
  final String? error;

  @override
  String toString() {
    return 'ScoreDetailsState(fetching: $fetching, data: $data, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScoreDetailsStateImpl &&
            (identical(other.fetching, fetching) ||
                other.fetching == fetching) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fetching, data, error);

  /// Create a copy of ScoreDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScoreDetailsStateImplCopyWith<_$ScoreDetailsStateImpl> get copyWith =>
      __$$ScoreDetailsStateImplCopyWithImpl<_$ScoreDetailsStateImpl>(
          this, _$identity);
}

abstract class _ScoreDetailsState implements ScoreDetailsState {
  const factory _ScoreDetailsState(
      {final bool fetching,
      final PointsDetails? data,
      final String? error}) = _$ScoreDetailsStateImpl;

  @override
  bool get fetching;
  @override
  PointsDetails? get data;
  @override
  String? get error;

  /// Create a copy of ScoreDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScoreDetailsStateImplCopyWith<_$ScoreDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
