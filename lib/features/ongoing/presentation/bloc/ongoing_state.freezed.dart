// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ongoing_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OngoingState {
  bool get fetching => throw _privateConstructorUsedError;
  List<GameResultGroup> get groups => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of OngoingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OngoingStateCopyWith<OngoingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OngoingStateCopyWith<$Res> {
  factory $OngoingStateCopyWith(
          OngoingState value, $Res Function(OngoingState) then) =
      _$OngoingStateCopyWithImpl<$Res, OngoingState>;
  @useResult
  $Res call({bool fetching, List<GameResultGroup> groups, String? error});
}

/// @nodoc
class _$OngoingStateCopyWithImpl<$Res, $Val extends OngoingState>
    implements $OngoingStateCopyWith<$Res> {
  _$OngoingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OngoingState
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
abstract class _$$OngoingStateImplCopyWith<$Res>
    implements $OngoingStateCopyWith<$Res> {
  factory _$$OngoingStateImplCopyWith(
          _$OngoingStateImpl value, $Res Function(_$OngoingStateImpl) then) =
      __$$OngoingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool fetching, List<GameResultGroup> groups, String? error});
}

/// @nodoc
class __$$OngoingStateImplCopyWithImpl<$Res>
    extends _$OngoingStateCopyWithImpl<$Res, _$OngoingStateImpl>
    implements _$$OngoingStateImplCopyWith<$Res> {
  __$$OngoingStateImplCopyWithImpl(
      _$OngoingStateImpl _value, $Res Function(_$OngoingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OngoingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetching = null,
    Object? groups = null,
    Object? error = freezed,
  }) {
    return _then(_$OngoingStateImpl(
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

class _$OngoingStateImpl implements _OngoingState {
  const _$OngoingStateImpl(
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
    return 'OngoingState(fetching: $fetching, groups: $groups, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OngoingStateImpl &&
            (identical(other.fetching, fetching) ||
                other.fetching == fetching) &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fetching,
      const DeepCollectionEquality().hash(_groups), error);

  /// Create a copy of OngoingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OngoingStateImplCopyWith<_$OngoingStateImpl> get copyWith =>
      __$$OngoingStateImplCopyWithImpl<_$OngoingStateImpl>(this, _$identity);
}

abstract class _OngoingState implements OngoingState {
  const factory _OngoingState(
      {final bool fetching,
      final List<GameResultGroup> groups,
      final String? error}) = _$OngoingStateImpl;

  @override
  bool get fetching;
  @override
  List<GameResultGroup> get groups;
  @override
  String? get error;

  /// Create a copy of OngoingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OngoingStateImplCopyWith<_$OngoingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
