// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LiveState {
  bool get fetching => throw _privateConstructorUsedError;
  List<GameResultGroup> get groups => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of LiveState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LiveStateCopyWith<LiveState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveStateCopyWith<$Res> {
  factory $LiveStateCopyWith(LiveState value, $Res Function(LiveState) then) =
      _$LiveStateCopyWithImpl<$Res, LiveState>;
  @useResult
  $Res call({bool fetching, List<GameResultGroup> groups, String? error});
}

/// @nodoc
class _$LiveStateCopyWithImpl<$Res, $Val extends LiveState>
    implements $LiveStateCopyWith<$Res> {
  _$LiveStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LiveState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetching = null,
    Object? groups = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      fetching: null == fetching
          ? _value.fetching
          : fetching // ignore: cast_nullable_to_non_nullable
              as bool,
      groups: null == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<GameResultGroup>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiveStateImplCopyWith<$Res>
    implements $LiveStateCopyWith<$Res> {
  factory _$$LiveStateImplCopyWith(
          _$LiveStateImpl value, $Res Function(_$LiveStateImpl) then) =
      __$$LiveStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool fetching, List<GameResultGroup> groups, String? error});
}

/// @nodoc
class __$$LiveStateImplCopyWithImpl<$Res>
    extends _$LiveStateCopyWithImpl<$Res, _$LiveStateImpl>
    implements _$$LiveStateImplCopyWith<$Res> {
  __$$LiveStateImplCopyWithImpl(
      _$LiveStateImpl _value, $Res Function(_$LiveStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LiveState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetching = null,
    Object? groups = null,
    Object? error = freezed,
  }) {
    return _then(_$LiveStateImpl(
      fetching: null == fetching
          ? _value.fetching
          : fetching // ignore: cast_nullable_to_non_nullable
              as bool,
      groups: null == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<GameResultGroup>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LiveStateImpl implements _LiveState {
  const _$LiveStateImpl(
      {this.fetching = false,
      final List<GameResultGroup> groups = const <GameResultGroup>[],
      this.error})
      : _groups = groups;

  @override
  @JsonKey()
  final bool fetching;
  final List<GameResultGroup> _groups;
  @override
  @JsonKey()
  List<GameResultGroup> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  @override
  final String? error;

  @override
  String toString() {
    return 'LiveState(fetching: $fetching, groups: $groups, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveStateImpl &&
            (identical(other.fetching, fetching) ||
                other.fetching == fetching) &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fetching,
      const DeepCollectionEquality().hash(_groups), error);

  /// Create a copy of LiveState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveStateImplCopyWith<_$LiveStateImpl> get copyWith =>
      __$$LiveStateImplCopyWithImpl<_$LiveStateImpl>(this, _$identity);
}

abstract class _LiveState implements LiveState {
  const factory _LiveState(
      {final bool fetching,
      final List<GameResultGroup> groups,
      final String? error}) = _$LiveStateImpl;

  @override
  bool get fetching;
  @override
  List<GameResultGroup> get groups;
  @override
  String? get error;

  /// Create a copy of LiveState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiveStateImplCopyWith<_$LiveStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
