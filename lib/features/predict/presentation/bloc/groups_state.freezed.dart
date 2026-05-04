// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'groups_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GroupsState {
  bool get loading => throw _privateConstructorUsedError;
  List<GroupWithResults> get groups => throw _privateConstructorUsedError;
  List<ClassificationGroup> get positions => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of GroupsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupsStateCopyWith<GroupsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupsStateCopyWith<$Res> {
  factory $GroupsStateCopyWith(
          GroupsState value, $Res Function(GroupsState) then) =
      _$GroupsStateCopyWithImpl<$Res, GroupsState>;
  @useResult
  $Res call(
      {bool loading,
      List<GroupWithResults> groups,
      List<ClassificationGroup> positions,
      String? error});
}

/// @nodoc
class _$GroupsStateCopyWithImpl<$Res, $Val extends GroupsState>
    implements $GroupsStateCopyWith<$Res> {
  _$GroupsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? groups = null,
    Object? positions = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      groups: null == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<GroupWithResults>,
      positions: null == positions
          ? _value.positions
          : positions // ignore: cast_nullable_to_non_nullable
              as List<ClassificationGroup>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupsStateImplCopyWith<$Res>
    implements $GroupsStateCopyWith<$Res> {
  factory _$$GroupsStateImplCopyWith(
          _$GroupsStateImpl value, $Res Function(_$GroupsStateImpl) then) =
      __$$GroupsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      List<GroupWithResults> groups,
      List<ClassificationGroup> positions,
      String? error});
}

/// @nodoc
class __$$GroupsStateImplCopyWithImpl<$Res>
    extends _$GroupsStateCopyWithImpl<$Res, _$GroupsStateImpl>
    implements _$$GroupsStateImplCopyWith<$Res> {
  __$$GroupsStateImplCopyWithImpl(
      _$GroupsStateImpl _value, $Res Function(_$GroupsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? groups = null,
    Object? positions = null,
    Object? error = freezed,
  }) {
    return _then(_$GroupsStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      groups: null == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<GroupWithResults>,
      positions: null == positions
          ? _value._positions
          : positions // ignore: cast_nullable_to_non_nullable
              as List<ClassificationGroup>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GroupsStateImpl implements _GroupsState {
  const _$GroupsStateImpl(
      {this.loading = false,
      final List<GroupWithResults> groups = const <GroupWithResults>[],
      final List<ClassificationGroup> positions = const <ClassificationGroup>[],
      this.error})
      : _groups = groups,
        _positions = positions;

  @override
  @JsonKey()
  final bool loading;
  final List<GroupWithResults> _groups;
  @override
  @JsonKey()
  List<GroupWithResults> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  final List<ClassificationGroup> _positions;
  @override
  @JsonKey()
  List<ClassificationGroup> get positions {
    if (_positions is EqualUnmodifiableListView) return _positions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_positions);
  }

  @override
  final String? error;

  @override
  String toString() {
    return 'GroupsState(loading: $loading, groups: $groups, positions: $positions, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupsStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            const DeepCollectionEquality()
                .equals(other._positions, _positions) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      const DeepCollectionEquality().hash(_groups),
      const DeepCollectionEquality().hash(_positions),
      error);

  /// Create a copy of GroupsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupsStateImplCopyWith<_$GroupsStateImpl> get copyWith =>
      __$$GroupsStateImplCopyWithImpl<_$GroupsStateImpl>(this, _$identity);
}

abstract class _GroupsState implements GroupsState {
  const factory _GroupsState(
      {final bool loading,
      final List<GroupWithResults> groups,
      final List<ClassificationGroup> positions,
      final String? error}) = _$GroupsStateImpl;

  @override
  bool get loading;
  @override
  List<GroupWithResults> get groups;
  @override
  List<ClassificationGroup> get positions;
  @override
  String? get error;

  /// Create a copy of GroupsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupsStateImplCopyWith<_$GroupsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
