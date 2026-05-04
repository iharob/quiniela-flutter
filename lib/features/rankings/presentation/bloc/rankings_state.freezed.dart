// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rankings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RankingsState {
  bool get fetching => throw _privateConstructorUsedError;
  List<RankingsEntry> get entries => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of RankingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RankingsStateCopyWith<RankingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RankingsStateCopyWith<$Res> {
  factory $RankingsStateCopyWith(
          RankingsState value, $Res Function(RankingsState) then) =
      _$RankingsStateCopyWithImpl<$Res, RankingsState>;
  @useResult
  $Res call({bool fetching, List<RankingsEntry> entries, String? error});
}

/// @nodoc
class _$RankingsStateCopyWithImpl<$Res, $Val extends RankingsState>
    implements $RankingsStateCopyWith<$Res> {
  _$RankingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RankingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetching = null,
    Object? entries = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      fetching: null == fetching
          ? _value.fetching
          : fetching // ignore: cast_nullable_to_non_nullable
              as bool,
      entries: null == entries
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<RankingsEntry>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RankingsStateImplCopyWith<$Res>
    implements $RankingsStateCopyWith<$Res> {
  factory _$$RankingsStateImplCopyWith(
          _$RankingsStateImpl value, $Res Function(_$RankingsStateImpl) then) =
      __$$RankingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool fetching, List<RankingsEntry> entries, String? error});
}

/// @nodoc
class __$$RankingsStateImplCopyWithImpl<$Res>
    extends _$RankingsStateCopyWithImpl<$Res, _$RankingsStateImpl>
    implements _$$RankingsStateImplCopyWith<$Res> {
  __$$RankingsStateImplCopyWithImpl(
      _$RankingsStateImpl _value, $Res Function(_$RankingsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RankingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetching = null,
    Object? entries = null,
    Object? error = freezed,
  }) {
    return _then(_$RankingsStateImpl(
      fetching: null == fetching
          ? _value.fetching
          : fetching // ignore: cast_nullable_to_non_nullable
              as bool,
      entries: null == entries
          ? _value._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<RankingsEntry>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RankingsStateImpl implements _RankingsState {
  const _$RankingsStateImpl(
      {this.fetching = false,
      final List<RankingsEntry> entries = const <RankingsEntry>[],
      this.error})
      : _entries = entries;

  @override
  @JsonKey()
  final bool fetching;
  final List<RankingsEntry> _entries;
  @override
  @JsonKey()
  List<RankingsEntry> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  @override
  final String? error;

  @override
  String toString() {
    return 'RankingsState(fetching: $fetching, entries: $entries, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RankingsStateImpl &&
            (identical(other.fetching, fetching) ||
                other.fetching == fetching) &&
            const DeepCollectionEquality().equals(other._entries, _entries) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fetching,
      const DeepCollectionEquality().hash(_entries), error);

  /// Create a copy of RankingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RankingsStateImplCopyWith<_$RankingsStateImpl> get copyWith =>
      __$$RankingsStateImplCopyWithImpl<_$RankingsStateImpl>(this, _$identity);
}

abstract class _RankingsState implements RankingsState {
  const factory _RankingsState(
      {final bool fetching,
      final List<RankingsEntry> entries,
      final String? error}) = _$RankingsStateImpl;

  @override
  bool get fetching;
  @override
  List<RankingsEntry> get entries;
  @override
  String? get error;

  /// Create a copy of RankingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RankingsStateImplCopyWith<_$RankingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
