// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'classification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DirectMatch {
  int get scored => throw _privateConstructorUsedError;
  int get received => throw _privateConstructorUsedError;

  /// Create a copy of DirectMatch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DirectMatchCopyWith<DirectMatch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectMatchCopyWith<$Res> {
  factory $DirectMatchCopyWith(
          DirectMatch value, $Res Function(DirectMatch) then) =
      _$DirectMatchCopyWithImpl<$Res, DirectMatch>;
  @useResult
  $Res call({int scored, int received});
}

/// @nodoc
class _$DirectMatchCopyWithImpl<$Res, $Val extends DirectMatch>
    implements $DirectMatchCopyWith<$Res> {
  _$DirectMatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DirectMatch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scored = null,
    Object? received = null,
  }) {
    return _then(_value.copyWith(
      scored: null == scored
          ? _value.scored
          : scored // ignore: cast_nullable_to_non_nullable
              as int,
      received: null == received
          ? _value.received
          : received // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DirectMatchImplCopyWith<$Res>
    implements $DirectMatchCopyWith<$Res> {
  factory _$$DirectMatchImplCopyWith(
          _$DirectMatchImpl value, $Res Function(_$DirectMatchImpl) then) =
      __$$DirectMatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int scored, int received});
}

/// @nodoc
class __$$DirectMatchImplCopyWithImpl<$Res>
    extends _$DirectMatchCopyWithImpl<$Res, _$DirectMatchImpl>
    implements _$$DirectMatchImplCopyWith<$Res> {
  __$$DirectMatchImplCopyWithImpl(
      _$DirectMatchImpl _value, $Res Function(_$DirectMatchImpl) _then)
      : super(_value, _then);

  /// Create a copy of DirectMatch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scored = null,
    Object? received = null,
  }) {
    return _then(_$DirectMatchImpl(
      scored: null == scored
          ? _value.scored
          : scored // ignore: cast_nullable_to_non_nullable
              as int,
      received: null == received
          ? _value.received
          : received // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DirectMatchImpl implements _DirectMatch {
  const _$DirectMatchImpl({required this.scored, required this.received});

  @override
  final int scored;
  @override
  final int received;

  @override
  String toString() {
    return 'DirectMatch(scored: $scored, received: $received)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DirectMatchImpl &&
            (identical(other.scored, scored) || other.scored == scored) &&
            (identical(other.received, received) ||
                other.received == received));
  }

  @override
  int get hashCode => Object.hash(runtimeType, scored, received);

  /// Create a copy of DirectMatch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DirectMatchImplCopyWith<_$DirectMatchImpl> get copyWith =>
      __$$DirectMatchImplCopyWithImpl<_$DirectMatchImpl>(this, _$identity);
}

abstract class _DirectMatch implements DirectMatch {
  const factory _DirectMatch(
      {required final int scored,
      required final int received}) = _$DirectMatchImpl;

  @override
  int get scored;
  @override
  int get received;

  /// Create a copy of DirectMatch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DirectMatchImplCopyWith<_$DirectMatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ClassificationEntry {
  Team get team => throw _privateConstructorUsedError;
  int get played => throw _privateConstructorUsedError;
  int get won => throw _privateConstructorUsedError;
  int get drawn => throw _privateConstructorUsedError;
  int get lost => throw _privateConstructorUsedError;
  int get goalsScored => throw _privateConstructorUsedError;
  int get goalsReceived => throw _privateConstructorUsedError;
  Map<String, DirectMatch> get directMatches =>
      throw _privateConstructorUsedError;

  /// Create a copy of ClassificationEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClassificationEntryCopyWith<ClassificationEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassificationEntryCopyWith<$Res> {
  factory $ClassificationEntryCopyWith(
          ClassificationEntry value, $Res Function(ClassificationEntry) then) =
      _$ClassificationEntryCopyWithImpl<$Res, ClassificationEntry>;
  @useResult
  $Res call(
      {Team team,
      int played,
      int won,
      int drawn,
      int lost,
      int goalsScored,
      int goalsReceived,
      Map<String, DirectMatch> directMatches});

  $TeamCopyWith<$Res> get team;
}

/// @nodoc
class _$ClassificationEntryCopyWithImpl<$Res, $Val extends ClassificationEntry>
    implements $ClassificationEntryCopyWith<$Res> {
  _$ClassificationEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClassificationEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? team = null,
    Object? played = null,
    Object? won = null,
    Object? drawn = null,
    Object? lost = null,
    Object? goalsScored = null,
    Object? goalsReceived = null,
    Object? directMatches = null,
  }) {
    return _then(_value.copyWith(
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
      played: null == played
          ? _value.played
          : played // ignore: cast_nullable_to_non_nullable
              as int,
      won: null == won
          ? _value.won
          : won // ignore: cast_nullable_to_non_nullable
              as int,
      drawn: null == drawn
          ? _value.drawn
          : drawn // ignore: cast_nullable_to_non_nullable
              as int,
      lost: null == lost
          ? _value.lost
          : lost // ignore: cast_nullable_to_non_nullable
              as int,
      goalsScored: null == goalsScored
          ? _value.goalsScored
          : goalsScored // ignore: cast_nullable_to_non_nullable
              as int,
      goalsReceived: null == goalsReceived
          ? _value.goalsReceived
          : goalsReceived // ignore: cast_nullable_to_non_nullable
              as int,
      directMatches: null == directMatches
          ? _value.directMatches
          : directMatches // ignore: cast_nullable_to_non_nullable
              as Map<String, DirectMatch>,
    ) as $Val);
  }

  /// Create a copy of ClassificationEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get team {
    return $TeamCopyWith<$Res>(_value.team, (value) {
      return _then(_value.copyWith(team: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClassificationEntryImplCopyWith<$Res>
    implements $ClassificationEntryCopyWith<$Res> {
  factory _$$ClassificationEntryImplCopyWith(_$ClassificationEntryImpl value,
          $Res Function(_$ClassificationEntryImpl) then) =
      __$$ClassificationEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Team team,
      int played,
      int won,
      int drawn,
      int lost,
      int goalsScored,
      int goalsReceived,
      Map<String, DirectMatch> directMatches});

  @override
  $TeamCopyWith<$Res> get team;
}

/// @nodoc
class __$$ClassificationEntryImplCopyWithImpl<$Res>
    extends _$ClassificationEntryCopyWithImpl<$Res, _$ClassificationEntryImpl>
    implements _$$ClassificationEntryImplCopyWith<$Res> {
  __$$ClassificationEntryImplCopyWithImpl(_$ClassificationEntryImpl _value,
      $Res Function(_$ClassificationEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClassificationEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? team = null,
    Object? played = null,
    Object? won = null,
    Object? drawn = null,
    Object? lost = null,
    Object? goalsScored = null,
    Object? goalsReceived = null,
    Object? directMatches = null,
  }) {
    return _then(_$ClassificationEntryImpl(
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
      played: null == played
          ? _value.played
          : played // ignore: cast_nullable_to_non_nullable
              as int,
      won: null == won
          ? _value.won
          : won // ignore: cast_nullable_to_non_nullable
              as int,
      drawn: null == drawn
          ? _value.drawn
          : drawn // ignore: cast_nullable_to_non_nullable
              as int,
      lost: null == lost
          ? _value.lost
          : lost // ignore: cast_nullable_to_non_nullable
              as int,
      goalsScored: null == goalsScored
          ? _value.goalsScored
          : goalsScored // ignore: cast_nullable_to_non_nullable
              as int,
      goalsReceived: null == goalsReceived
          ? _value.goalsReceived
          : goalsReceived // ignore: cast_nullable_to_non_nullable
              as int,
      directMatches: null == directMatches
          ? _value._directMatches
          : directMatches // ignore: cast_nullable_to_non_nullable
              as Map<String, DirectMatch>,
    ));
  }
}

/// @nodoc

class _$ClassificationEntryImpl implements _ClassificationEntry {
  const _$ClassificationEntryImpl(
      {required this.team,
      required this.played,
      required this.won,
      required this.drawn,
      required this.lost,
      required this.goalsScored,
      required this.goalsReceived,
      final Map<String, DirectMatch> directMatches =
          const <String, DirectMatch>{}})
      : _directMatches = directMatches;

  @override
  final Team team;
  @override
  final int played;
  @override
  final int won;
  @override
  final int drawn;
  @override
  final int lost;
  @override
  final int goalsScored;
  @override
  final int goalsReceived;
  final Map<String, DirectMatch> _directMatches;
  @override
  @JsonKey()
  Map<String, DirectMatch> get directMatches {
    if (_directMatches is EqualUnmodifiableMapView) return _directMatches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_directMatches);
  }

  @override
  String toString() {
    return 'ClassificationEntry(team: $team, played: $played, won: $won, drawn: $drawn, lost: $lost, goalsScored: $goalsScored, goalsReceived: $goalsReceived, directMatches: $directMatches)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassificationEntryImpl &&
            (identical(other.team, team) || other.team == team) &&
            (identical(other.played, played) || other.played == played) &&
            (identical(other.won, won) || other.won == won) &&
            (identical(other.drawn, drawn) || other.drawn == drawn) &&
            (identical(other.lost, lost) || other.lost == lost) &&
            (identical(other.goalsScored, goalsScored) ||
                other.goalsScored == goalsScored) &&
            (identical(other.goalsReceived, goalsReceived) ||
                other.goalsReceived == goalsReceived) &&
            const DeepCollectionEquality()
                .equals(other._directMatches, _directMatches));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      team,
      played,
      won,
      drawn,
      lost,
      goalsScored,
      goalsReceived,
      const DeepCollectionEquality().hash(_directMatches));

  /// Create a copy of ClassificationEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClassificationEntryImplCopyWith<_$ClassificationEntryImpl> get copyWith =>
      __$$ClassificationEntryImplCopyWithImpl<_$ClassificationEntryImpl>(
          this, _$identity);
}

abstract class _ClassificationEntry implements ClassificationEntry {
  const factory _ClassificationEntry(
          {required final Team team,
          required final int played,
          required final int won,
          required final int drawn,
          required final int lost,
          required final int goalsScored,
          required final int goalsReceived,
          final Map<String, DirectMatch> directMatches}) =
      _$ClassificationEntryImpl;

  @override
  Team get team;
  @override
  int get played;
  @override
  int get won;
  @override
  int get drawn;
  @override
  int get lost;
  @override
  int get goalsScored;
  @override
  int get goalsReceived;
  @override
  Map<String, DirectMatch> get directMatches;

  /// Create a copy of ClassificationEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClassificationEntryImplCopyWith<_$ClassificationEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ClassificationGroup {
  String get name => throw _privateConstructorUsedError;
  List<ClassificationEntry> get entries => throw _privateConstructorUsedError;

  /// Create a copy of ClassificationGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClassificationGroupCopyWith<ClassificationGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassificationGroupCopyWith<$Res> {
  factory $ClassificationGroupCopyWith(
          ClassificationGroup value, $Res Function(ClassificationGroup) then) =
      _$ClassificationGroupCopyWithImpl<$Res, ClassificationGroup>;
  @useResult
  $Res call({String name, List<ClassificationEntry> entries});
}

/// @nodoc
class _$ClassificationGroupCopyWithImpl<$Res, $Val extends ClassificationGroup>
    implements $ClassificationGroupCopyWith<$Res> {
  _$ClassificationGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClassificationGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? entries = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      entries: null == entries
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<ClassificationEntry>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClassificationGroupImplCopyWith<$Res>
    implements $ClassificationGroupCopyWith<$Res> {
  factory _$$ClassificationGroupImplCopyWith(_$ClassificationGroupImpl value,
          $Res Function(_$ClassificationGroupImpl) then) =
      __$$ClassificationGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<ClassificationEntry> entries});
}

/// @nodoc
class __$$ClassificationGroupImplCopyWithImpl<$Res>
    extends _$ClassificationGroupCopyWithImpl<$Res, _$ClassificationGroupImpl>
    implements _$$ClassificationGroupImplCopyWith<$Res> {
  __$$ClassificationGroupImplCopyWithImpl(_$ClassificationGroupImpl _value,
      $Res Function(_$ClassificationGroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClassificationGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? entries = null,
  }) {
    return _then(_$ClassificationGroupImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      entries: null == entries
          ? _value._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<ClassificationEntry>,
    ));
  }
}

/// @nodoc

class _$ClassificationGroupImpl implements _ClassificationGroup {
  const _$ClassificationGroupImpl(
      {required this.name, required final List<ClassificationEntry> entries})
      : _entries = entries;

  @override
  final String name;
  final List<ClassificationEntry> _entries;
  @override
  List<ClassificationEntry> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  @override
  String toString() {
    return 'ClassificationGroup(name: $name, entries: $entries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassificationGroupImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._entries, _entries));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_entries));

  /// Create a copy of ClassificationGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClassificationGroupImplCopyWith<_$ClassificationGroupImpl> get copyWith =>
      __$$ClassificationGroupImplCopyWithImpl<_$ClassificationGroupImpl>(
          this, _$identity);
}

abstract class _ClassificationGroup implements ClassificationGroup {
  const factory _ClassificationGroup(
          {required final String name,
          required final List<ClassificationEntry> entries}) =
      _$ClassificationGroupImpl;

  @override
  String get name;
  @override
  List<ClassificationEntry> get entries;

  /// Create a copy of ClassificationGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClassificationGroupImplCopyWith<_$ClassificationGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
