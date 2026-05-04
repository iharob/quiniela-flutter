// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'knockout_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$KnockoutState {
  Map<int, List<List<GameWithResult>>> get rounds =>
      throw _privateConstructorUsedError;
  List<BracketRound> get bracketFixtures => throw _privateConstructorUsedError;

  /// Create a copy of KnockoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KnockoutStateCopyWith<KnockoutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KnockoutStateCopyWith<$Res> {
  factory $KnockoutStateCopyWith(
          KnockoutState value, $Res Function(KnockoutState) then) =
      _$KnockoutStateCopyWithImpl<$Res, KnockoutState>;
  @useResult
  $Res call(
      {Map<int, List<List<GameWithResult>>> rounds,
      List<BracketRound> bracketFixtures});
}

/// @nodoc
class _$KnockoutStateCopyWithImpl<$Res, $Val extends KnockoutState>
    implements $KnockoutStateCopyWith<$Res> {
  _$KnockoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KnockoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rounds = null,
    Object? bracketFixtures = null,
  }) {
    return _then(_value.copyWith(
      rounds: null == rounds
          ? _value.rounds
          : rounds // ignore: cast_nullable_to_non_nullable
              as Map<int, List<List<GameWithResult>>>,
      bracketFixtures: null == bracketFixtures
          ? _value.bracketFixtures
          : bracketFixtures // ignore: cast_nullable_to_non_nullable
              as List<BracketRound>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KnockoutStateImplCopyWith<$Res>
    implements $KnockoutStateCopyWith<$Res> {
  factory _$$KnockoutStateImplCopyWith(
          _$KnockoutStateImpl value, $Res Function(_$KnockoutStateImpl) then) =
      __$$KnockoutStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<int, List<List<GameWithResult>>> rounds,
      List<BracketRound> bracketFixtures});
}

/// @nodoc
class __$$KnockoutStateImplCopyWithImpl<$Res>
    extends _$KnockoutStateCopyWithImpl<$Res, _$KnockoutStateImpl>
    implements _$$KnockoutStateImplCopyWith<$Res> {
  __$$KnockoutStateImplCopyWithImpl(
      _$KnockoutStateImpl _value, $Res Function(_$KnockoutStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of KnockoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rounds = null,
    Object? bracketFixtures = null,
  }) {
    return _then(_$KnockoutStateImpl(
      rounds: null == rounds
          ? _value._rounds
          : rounds // ignore: cast_nullable_to_non_nullable
              as Map<int, List<List<GameWithResult>>>,
      bracketFixtures: null == bracketFixtures
          ? _value._bracketFixtures
          : bracketFixtures // ignore: cast_nullable_to_non_nullable
              as List<BracketRound>,
    ));
  }
}

/// @nodoc

class _$KnockoutStateImpl implements _KnockoutState {
  const _$KnockoutStateImpl(
      {final Map<int, List<List<GameWithResult>>> rounds =
          const <int, List<List<GameWithResult>>>{},
      final List<BracketRound> bracketFixtures = const <BracketRound>[]})
      : _rounds = rounds,
        _bracketFixtures = bracketFixtures;

  final Map<int, List<List<GameWithResult>>> _rounds;
  @override
  @JsonKey()
  Map<int, List<List<GameWithResult>>> get rounds {
    if (_rounds is EqualUnmodifiableMapView) return _rounds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rounds);
  }

  final List<BracketRound> _bracketFixtures;
  @override
  @JsonKey()
  List<BracketRound> get bracketFixtures {
    if (_bracketFixtures is EqualUnmodifiableListView) return _bracketFixtures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bracketFixtures);
  }

  @override
  String toString() {
    return 'KnockoutState(rounds: $rounds, bracketFixtures: $bracketFixtures)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KnockoutStateImpl &&
            const DeepCollectionEquality().equals(other._rounds, _rounds) &&
            const DeepCollectionEquality()
                .equals(other._bracketFixtures, _bracketFixtures));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_rounds),
      const DeepCollectionEquality().hash(_bracketFixtures));

  /// Create a copy of KnockoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KnockoutStateImplCopyWith<_$KnockoutStateImpl> get copyWith =>
      __$$KnockoutStateImplCopyWithImpl<_$KnockoutStateImpl>(this, _$identity);
}

abstract class _KnockoutState implements KnockoutState {
  const factory _KnockoutState(
      {final Map<int, List<List<GameWithResult>>> rounds,
      final List<BracketRound> bracketFixtures}) = _$KnockoutStateImpl;

  @override
  Map<int, List<List<GameWithResult>>> get rounds;
  @override
  List<BracketRound> get bracketFixtures;

  /// Create a copy of KnockoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KnockoutStateImplCopyWith<_$KnockoutStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
