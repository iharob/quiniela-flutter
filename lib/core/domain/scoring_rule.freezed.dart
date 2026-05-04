// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scoring_rule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScoringRule {
  String get description => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;

  /// Create a copy of ScoringRule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScoringRuleCopyWith<ScoringRule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoringRuleCopyWith<$Res> {
  factory $ScoringRuleCopyWith(
          ScoringRule value, $Res Function(ScoringRule) then) =
      _$ScoringRuleCopyWithImpl<$Res, ScoringRule>;
  @useResult
  $Res call({String description, int value});
}

/// @nodoc
class _$ScoringRuleCopyWithImpl<$Res, $Val extends ScoringRule>
    implements $ScoringRuleCopyWith<$Res> {
  _$ScoringRuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScoringRule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScoringRuleImplCopyWith<$Res>
    implements $ScoringRuleCopyWith<$Res> {
  factory _$$ScoringRuleImplCopyWith(
          _$ScoringRuleImpl value, $Res Function(_$ScoringRuleImpl) then) =
      __$$ScoringRuleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description, int value});
}

/// @nodoc
class __$$ScoringRuleImplCopyWithImpl<$Res>
    extends _$ScoringRuleCopyWithImpl<$Res, _$ScoringRuleImpl>
    implements _$$ScoringRuleImplCopyWith<$Res> {
  __$$ScoringRuleImplCopyWithImpl(
      _$ScoringRuleImpl _value, $Res Function(_$ScoringRuleImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScoringRule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? value = null,
  }) {
    return _then(_$ScoringRuleImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ScoringRuleImpl implements _ScoringRule {
  const _$ScoringRuleImpl({required this.description, required this.value});

  @override
  final String description;
  @override
  final int value;

  @override
  String toString() {
    return 'ScoringRule(description: $description, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScoringRuleImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description, value);

  /// Create a copy of ScoringRule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScoringRuleImplCopyWith<_$ScoringRuleImpl> get copyWith =>
      __$$ScoringRuleImplCopyWithImpl<_$ScoringRuleImpl>(this, _$identity);
}

abstract class _ScoringRule implements ScoringRule {
  const factory _ScoringRule(
      {required final String description,
      required final int value}) = _$ScoringRuleImpl;

  @override
  String get description;
  @override
  int get value;

  /// Create a copy of ScoringRule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScoringRuleImplCopyWith<_$ScoringRuleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
