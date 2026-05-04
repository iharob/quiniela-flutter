// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Game _$GameFromJson(Map<String, dynamic> json) {
  return _Game.fromJson(json);
}

/// @nodoc
mixin _$Game {
  int get gameId => throw _privateConstructorUsedError;
  Team get team1 => throw _privateConstructorUsedError;
  Team get team2 => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;

  /// Serializes this Game to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Game
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameCopyWith<Game> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameCopyWith<$Res> {
  factory $GameCopyWith(Game value, $Res Function(Game) then) =
      _$GameCopyWithImpl<$Res, Game>;
  @useResult
  $Res call({int gameId, Team team1, Team team2, String? date});

  $TeamCopyWith<$Res> get team1;
  $TeamCopyWith<$Res> get team2;
}

/// @nodoc
class _$GameCopyWithImpl<$Res, $Val extends Game>
    implements $GameCopyWith<$Res> {
  _$GameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Game
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
    Object? team1 = null,
    Object? team2 = null,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as int,
      team1: null == team1
          ? _value.team1
          : team1 // ignore: cast_nullable_to_non_nullable
              as Team,
      team2: null == team2
          ? _value.team2
          : team2 // ignore: cast_nullable_to_non_nullable
              as Team,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of Game
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get team1 {
    return $TeamCopyWith<$Res>(_value.team1, (value) {
      return _then(_value.copyWith(team1: value) as $Val);
    });
  }

  /// Create a copy of Game
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get team2 {
    return $TeamCopyWith<$Res>(_value.team2, (value) {
      return _then(_value.copyWith(team2: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GameImplCopyWith<$Res> implements $GameCopyWith<$Res> {
  factory _$$GameImplCopyWith(
          _$GameImpl value, $Res Function(_$GameImpl) then) =
      __$$GameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int gameId, Team team1, Team team2, String? date});

  @override
  $TeamCopyWith<$Res> get team1;
  @override
  $TeamCopyWith<$Res> get team2;
}

/// @nodoc
class __$$GameImplCopyWithImpl<$Res>
    extends _$GameCopyWithImpl<$Res, _$GameImpl>
    implements _$$GameImplCopyWith<$Res> {
  __$$GameImplCopyWithImpl(_$GameImpl _value, $Res Function(_$GameImpl) _then)
      : super(_value, _then);

  /// Create a copy of Game
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
    Object? team1 = null,
    Object? team2 = null,
    Object? date = freezed,
  }) {
    return _then(_$GameImpl(
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as int,
      team1: null == team1
          ? _value.team1
          : team1 // ignore: cast_nullable_to_non_nullable
              as Team,
      team2: null == team2
          ? _value.team2
          : team2 // ignore: cast_nullable_to_non_nullable
              as Team,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameImpl implements _Game {
  const _$GameImpl(
      {required this.gameId,
      required this.team1,
      required this.team2,
      this.date});

  factory _$GameImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameImplFromJson(json);

  @override
  final int gameId;
  @override
  final Team team1;
  @override
  final Team team2;
  @override
  final String? date;

  @override
  String toString() {
    return 'Game(gameId: $gameId, team1: $team1, team2: $team2, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameImpl &&
            (identical(other.gameId, gameId) || other.gameId == gameId) &&
            (identical(other.team1, team1) || other.team1 == team1) &&
            (identical(other.team2, team2) || other.team2 == team2) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, gameId, team1, team2, date);

  /// Create a copy of Game
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameImplCopyWith<_$GameImpl> get copyWith =>
      __$$GameImplCopyWithImpl<_$GameImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameImplToJson(
      this,
    );
  }
}

abstract class _Game implements Game {
  const factory _Game(
      {required final int gameId,
      required final Team team1,
      required final Team team2,
      final String? date}) = _$GameImpl;

  factory _Game.fromJson(Map<String, dynamic> json) = _$GameImpl.fromJson;

  @override
  int get gameId;
  @override
  Team get team1;
  @override
  Team get team2;
  @override
  String? get date;

  /// Create a copy of Game
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameImplCopyWith<_$GameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GameWithResult _$GameWithResultFromJson(Map<String, dynamic> json) {
  return _GameWithResult.fromJson(json);
}

/// @nodoc
mixin _$GameWithResult {
  int get gameId => throw _privateConstructorUsedError;
  Team get team1 => throw _privateConstructorUsedError;
  Team get team2 => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  int? get team1Score => throw _privateConstructorUsedError;
  int? get team2Score => throw _privateConstructorUsedError;
  Team? get winner => throw _privateConstructorUsedError;

  /// Serializes this GameWithResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameWithResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameWithResultCopyWith<GameWithResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameWithResultCopyWith<$Res> {
  factory $GameWithResultCopyWith(
          GameWithResult value, $Res Function(GameWithResult) then) =
      _$GameWithResultCopyWithImpl<$Res, GameWithResult>;
  @useResult
  $Res call(
      {int gameId,
      Team team1,
      Team team2,
      String? date,
      int? team1Score,
      int? team2Score,
      Team? winner});

  $TeamCopyWith<$Res> get team1;
  $TeamCopyWith<$Res> get team2;
  $TeamCopyWith<$Res>? get winner;
}

/// @nodoc
class _$GameWithResultCopyWithImpl<$Res, $Val extends GameWithResult>
    implements $GameWithResultCopyWith<$Res> {
  _$GameWithResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameWithResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
    Object? team1 = null,
    Object? team2 = null,
    Object? date = freezed,
    Object? team1Score = freezed,
    Object? team2Score = freezed,
    Object? winner = freezed,
  }) {
    return _then(_value.copyWith(
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as int,
      team1: null == team1
          ? _value.team1
          : team1 // ignore: cast_nullable_to_non_nullable
              as Team,
      team2: null == team2
          ? _value.team2
          : team2 // ignore: cast_nullable_to_non_nullable
              as Team,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      team1Score: freezed == team1Score
          ? _value.team1Score
          : team1Score // ignore: cast_nullable_to_non_nullable
              as int?,
      team2Score: freezed == team2Score
          ? _value.team2Score
          : team2Score // ignore: cast_nullable_to_non_nullable
              as int?,
      winner: freezed == winner
          ? _value.winner
          : winner // ignore: cast_nullable_to_non_nullable
              as Team?,
    ) as $Val);
  }

  /// Create a copy of GameWithResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get team1 {
    return $TeamCopyWith<$Res>(_value.team1, (value) {
      return _then(_value.copyWith(team1: value) as $Val);
    });
  }

  /// Create a copy of GameWithResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get team2 {
    return $TeamCopyWith<$Res>(_value.team2, (value) {
      return _then(_value.copyWith(team2: value) as $Val);
    });
  }

  /// Create a copy of GameWithResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res>? get winner {
    if (_value.winner == null) {
      return null;
    }

    return $TeamCopyWith<$Res>(_value.winner!, (value) {
      return _then(_value.copyWith(winner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GameWithResultImplCopyWith<$Res>
    implements $GameWithResultCopyWith<$Res> {
  factory _$$GameWithResultImplCopyWith(_$GameWithResultImpl value,
          $Res Function(_$GameWithResultImpl) then) =
      __$$GameWithResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int gameId,
      Team team1,
      Team team2,
      String? date,
      int? team1Score,
      int? team2Score,
      Team? winner});

  @override
  $TeamCopyWith<$Res> get team1;
  @override
  $TeamCopyWith<$Res> get team2;
  @override
  $TeamCopyWith<$Res>? get winner;
}

/// @nodoc
class __$$GameWithResultImplCopyWithImpl<$Res>
    extends _$GameWithResultCopyWithImpl<$Res, _$GameWithResultImpl>
    implements _$$GameWithResultImplCopyWith<$Res> {
  __$$GameWithResultImplCopyWithImpl(
      _$GameWithResultImpl _value, $Res Function(_$GameWithResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameWithResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
    Object? team1 = null,
    Object? team2 = null,
    Object? date = freezed,
    Object? team1Score = freezed,
    Object? team2Score = freezed,
    Object? winner = freezed,
  }) {
    return _then(_$GameWithResultImpl(
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as int,
      team1: null == team1
          ? _value.team1
          : team1 // ignore: cast_nullable_to_non_nullable
              as Team,
      team2: null == team2
          ? _value.team2
          : team2 // ignore: cast_nullable_to_non_nullable
              as Team,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      team1Score: freezed == team1Score
          ? _value.team1Score
          : team1Score // ignore: cast_nullable_to_non_nullable
              as int?,
      team2Score: freezed == team2Score
          ? _value.team2Score
          : team2Score // ignore: cast_nullable_to_non_nullable
              as int?,
      winner: freezed == winner
          ? _value.winner
          : winner // ignore: cast_nullable_to_non_nullable
              as Team?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameWithResultImpl implements _GameWithResult {
  const _$GameWithResultImpl(
      {required this.gameId,
      required this.team1,
      required this.team2,
      this.date,
      this.team1Score,
      this.team2Score,
      this.winner});

  factory _$GameWithResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameWithResultImplFromJson(json);

  @override
  final int gameId;
  @override
  final Team team1;
  @override
  final Team team2;
  @override
  final String? date;
  @override
  final int? team1Score;
  @override
  final int? team2Score;
  @override
  final Team? winner;

  @override
  String toString() {
    return 'GameWithResult(gameId: $gameId, team1: $team1, team2: $team2, date: $date, team1Score: $team1Score, team2Score: $team2Score, winner: $winner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameWithResultImpl &&
            (identical(other.gameId, gameId) || other.gameId == gameId) &&
            (identical(other.team1, team1) || other.team1 == team1) &&
            (identical(other.team2, team2) || other.team2 == team2) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.team1Score, team1Score) ||
                other.team1Score == team1Score) &&
            (identical(other.team2Score, team2Score) ||
                other.team2Score == team2Score) &&
            (identical(other.winner, winner) || other.winner == winner));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, gameId, team1, team2, date, team1Score, team2Score, winner);

  /// Create a copy of GameWithResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameWithResultImplCopyWith<_$GameWithResultImpl> get copyWith =>
      __$$GameWithResultImplCopyWithImpl<_$GameWithResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameWithResultImplToJson(
      this,
    );
  }
}

abstract class _GameWithResult implements GameWithResult {
  const factory _GameWithResult(
      {required final int gameId,
      required final Team team1,
      required final Team team2,
      final String? date,
      final int? team1Score,
      final int? team2Score,
      final Team? winner}) = _$GameWithResultImpl;

  factory _GameWithResult.fromJson(Map<String, dynamic> json) =
      _$GameWithResultImpl.fromJson;

  @override
  int get gameId;
  @override
  Team get team1;
  @override
  Team get team2;
  @override
  String? get date;
  @override
  int? get team1Score;
  @override
  int? get team2Score;
  @override
  Team? get winner;

  /// Create a copy of GameWithResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameWithResultImplCopyWith<_$GameWithResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BracketMatch _$BracketMatchFromJson(Map<String, dynamic> json) {
  return _BracketMatch.fromJson(json);
}

/// @nodoc
mixin _$BracketMatch {
  int get gameId => throw _privateConstructorUsedError;
  Team? get team1 => throw _privateConstructorUsedError;
  Team? get team2 => throw _privateConstructorUsedError;
  int? get team1Score => throw _privateConstructorUsedError;
  int? get team2Score => throw _privateConstructorUsedError;
  Team? get winner => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  int? get team1FromGame => throw _privateConstructorUsedError;
  int? get team2FromGame => throw _privateConstructorUsedError;

  /// Serializes this BracketMatch to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BracketMatch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BracketMatchCopyWith<BracketMatch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BracketMatchCopyWith<$Res> {
  factory $BracketMatchCopyWith(
          BracketMatch value, $Res Function(BracketMatch) then) =
      _$BracketMatchCopyWithImpl<$Res, BracketMatch>;
  @useResult
  $Res call(
      {int gameId,
      Team? team1,
      Team? team2,
      int? team1Score,
      int? team2Score,
      Team? winner,
      String? date,
      int? team1FromGame,
      int? team2FromGame});

  $TeamCopyWith<$Res>? get team1;
  $TeamCopyWith<$Res>? get team2;
  $TeamCopyWith<$Res>? get winner;
}

/// @nodoc
class _$BracketMatchCopyWithImpl<$Res, $Val extends BracketMatch>
    implements $BracketMatchCopyWith<$Res> {
  _$BracketMatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BracketMatch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
    Object? team1 = freezed,
    Object? team2 = freezed,
    Object? team1Score = freezed,
    Object? team2Score = freezed,
    Object? winner = freezed,
    Object? date = freezed,
    Object? team1FromGame = freezed,
    Object? team2FromGame = freezed,
  }) {
    return _then(_value.copyWith(
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as int,
      team1: freezed == team1
          ? _value.team1
          : team1 // ignore: cast_nullable_to_non_nullable
              as Team?,
      team2: freezed == team2
          ? _value.team2
          : team2 // ignore: cast_nullable_to_non_nullable
              as Team?,
      team1Score: freezed == team1Score
          ? _value.team1Score
          : team1Score // ignore: cast_nullable_to_non_nullable
              as int?,
      team2Score: freezed == team2Score
          ? _value.team2Score
          : team2Score // ignore: cast_nullable_to_non_nullable
              as int?,
      winner: freezed == winner
          ? _value.winner
          : winner // ignore: cast_nullable_to_non_nullable
              as Team?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      team1FromGame: freezed == team1FromGame
          ? _value.team1FromGame
          : team1FromGame // ignore: cast_nullable_to_non_nullable
              as int?,
      team2FromGame: freezed == team2FromGame
          ? _value.team2FromGame
          : team2FromGame // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of BracketMatch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res>? get team1 {
    if (_value.team1 == null) {
      return null;
    }

    return $TeamCopyWith<$Res>(_value.team1!, (value) {
      return _then(_value.copyWith(team1: value) as $Val);
    });
  }

  /// Create a copy of BracketMatch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res>? get team2 {
    if (_value.team2 == null) {
      return null;
    }

    return $TeamCopyWith<$Res>(_value.team2!, (value) {
      return _then(_value.copyWith(team2: value) as $Val);
    });
  }

  /// Create a copy of BracketMatch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res>? get winner {
    if (_value.winner == null) {
      return null;
    }

    return $TeamCopyWith<$Res>(_value.winner!, (value) {
      return _then(_value.copyWith(winner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BracketMatchImplCopyWith<$Res>
    implements $BracketMatchCopyWith<$Res> {
  factory _$$BracketMatchImplCopyWith(
          _$BracketMatchImpl value, $Res Function(_$BracketMatchImpl) then) =
      __$$BracketMatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int gameId,
      Team? team1,
      Team? team2,
      int? team1Score,
      int? team2Score,
      Team? winner,
      String? date,
      int? team1FromGame,
      int? team2FromGame});

  @override
  $TeamCopyWith<$Res>? get team1;
  @override
  $TeamCopyWith<$Res>? get team2;
  @override
  $TeamCopyWith<$Res>? get winner;
}

/// @nodoc
class __$$BracketMatchImplCopyWithImpl<$Res>
    extends _$BracketMatchCopyWithImpl<$Res, _$BracketMatchImpl>
    implements _$$BracketMatchImplCopyWith<$Res> {
  __$$BracketMatchImplCopyWithImpl(
      _$BracketMatchImpl _value, $Res Function(_$BracketMatchImpl) _then)
      : super(_value, _then);

  /// Create a copy of BracketMatch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
    Object? team1 = freezed,
    Object? team2 = freezed,
    Object? team1Score = freezed,
    Object? team2Score = freezed,
    Object? winner = freezed,
    Object? date = freezed,
    Object? team1FromGame = freezed,
    Object? team2FromGame = freezed,
  }) {
    return _then(_$BracketMatchImpl(
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as int,
      team1: freezed == team1
          ? _value.team1
          : team1 // ignore: cast_nullable_to_non_nullable
              as Team?,
      team2: freezed == team2
          ? _value.team2
          : team2 // ignore: cast_nullable_to_non_nullable
              as Team?,
      team1Score: freezed == team1Score
          ? _value.team1Score
          : team1Score // ignore: cast_nullable_to_non_nullable
              as int?,
      team2Score: freezed == team2Score
          ? _value.team2Score
          : team2Score // ignore: cast_nullable_to_non_nullable
              as int?,
      winner: freezed == winner
          ? _value.winner
          : winner // ignore: cast_nullable_to_non_nullable
              as Team?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      team1FromGame: freezed == team1FromGame
          ? _value.team1FromGame
          : team1FromGame // ignore: cast_nullable_to_non_nullable
              as int?,
      team2FromGame: freezed == team2FromGame
          ? _value.team2FromGame
          : team2FromGame // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BracketMatchImpl implements _BracketMatch {
  const _$BracketMatchImpl(
      {required this.gameId,
      this.team1,
      this.team2,
      this.team1Score,
      this.team2Score,
      this.winner,
      this.date,
      this.team1FromGame,
      this.team2FromGame});

  factory _$BracketMatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$BracketMatchImplFromJson(json);

  @override
  final int gameId;
  @override
  final Team? team1;
  @override
  final Team? team2;
  @override
  final int? team1Score;
  @override
  final int? team2Score;
  @override
  final Team? winner;
  @override
  final String? date;
  @override
  final int? team1FromGame;
  @override
  final int? team2FromGame;

  @override
  String toString() {
    return 'BracketMatch(gameId: $gameId, team1: $team1, team2: $team2, team1Score: $team1Score, team2Score: $team2Score, winner: $winner, date: $date, team1FromGame: $team1FromGame, team2FromGame: $team2FromGame)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BracketMatchImpl &&
            (identical(other.gameId, gameId) || other.gameId == gameId) &&
            (identical(other.team1, team1) || other.team1 == team1) &&
            (identical(other.team2, team2) || other.team2 == team2) &&
            (identical(other.team1Score, team1Score) ||
                other.team1Score == team1Score) &&
            (identical(other.team2Score, team2Score) ||
                other.team2Score == team2Score) &&
            (identical(other.winner, winner) || other.winner == winner) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.team1FromGame, team1FromGame) ||
                other.team1FromGame == team1FromGame) &&
            (identical(other.team2FromGame, team2FromGame) ||
                other.team2FromGame == team2FromGame));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, gameId, team1, team2, team1Score,
      team2Score, winner, date, team1FromGame, team2FromGame);

  /// Create a copy of BracketMatch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BracketMatchImplCopyWith<_$BracketMatchImpl> get copyWith =>
      __$$BracketMatchImplCopyWithImpl<_$BracketMatchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BracketMatchImplToJson(
      this,
    );
  }
}

abstract class _BracketMatch implements BracketMatch {
  const factory _BracketMatch(
      {required final int gameId,
      final Team? team1,
      final Team? team2,
      final int? team1Score,
      final int? team2Score,
      final Team? winner,
      final String? date,
      final int? team1FromGame,
      final int? team2FromGame}) = _$BracketMatchImpl;

  factory _BracketMatch.fromJson(Map<String, dynamic> json) =
      _$BracketMatchImpl.fromJson;

  @override
  int get gameId;
  @override
  Team? get team1;
  @override
  Team? get team2;
  @override
  int? get team1Score;
  @override
  int? get team2Score;
  @override
  Team? get winner;
  @override
  String? get date;
  @override
  int? get team1FromGame;
  @override
  int? get team2FromGame;

  /// Create a copy of BracketMatch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BracketMatchImplCopyWith<_$BracketMatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BracketRound _$BracketRoundFromJson(Map<String, dynamic> json) {
  return _BracketRound.fromJson(json);
}

/// @nodoc
mixin _$BracketRound {
  int get round => throw _privateConstructorUsedError;
  List<BracketMatch> get matches => throw _privateConstructorUsedError;

  /// Serializes this BracketRound to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BracketRound
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BracketRoundCopyWith<BracketRound> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BracketRoundCopyWith<$Res> {
  factory $BracketRoundCopyWith(
          BracketRound value, $Res Function(BracketRound) then) =
      _$BracketRoundCopyWithImpl<$Res, BracketRound>;
  @useResult
  $Res call({int round, List<BracketMatch> matches});
}

/// @nodoc
class _$BracketRoundCopyWithImpl<$Res, $Val extends BracketRound>
    implements $BracketRoundCopyWith<$Res> {
  _$BracketRoundCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BracketRound
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? round = null,
    Object? matches = null,
  }) {
    return _then(_value.copyWith(
      round: null == round
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as int,
      matches: null == matches
          ? _value.matches
          : matches // ignore: cast_nullable_to_non_nullable
              as List<BracketMatch>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BracketRoundImplCopyWith<$Res>
    implements $BracketRoundCopyWith<$Res> {
  factory _$$BracketRoundImplCopyWith(
          _$BracketRoundImpl value, $Res Function(_$BracketRoundImpl) then) =
      __$$BracketRoundImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int round, List<BracketMatch> matches});
}

/// @nodoc
class __$$BracketRoundImplCopyWithImpl<$Res>
    extends _$BracketRoundCopyWithImpl<$Res, _$BracketRoundImpl>
    implements _$$BracketRoundImplCopyWith<$Res> {
  __$$BracketRoundImplCopyWithImpl(
      _$BracketRoundImpl _value, $Res Function(_$BracketRoundImpl) _then)
      : super(_value, _then);

  /// Create a copy of BracketRound
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? round = null,
    Object? matches = null,
  }) {
    return _then(_$BracketRoundImpl(
      round: null == round
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as int,
      matches: null == matches
          ? _value._matches
          : matches // ignore: cast_nullable_to_non_nullable
              as List<BracketMatch>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BracketRoundImpl implements _BracketRound {
  const _$BracketRoundImpl(
      {required this.round, required final List<BracketMatch> matches})
      : _matches = matches;

  factory _$BracketRoundImpl.fromJson(Map<String, dynamic> json) =>
      _$$BracketRoundImplFromJson(json);

  @override
  final int round;
  final List<BracketMatch> _matches;
  @override
  List<BracketMatch> get matches {
    if (_matches is EqualUnmodifiableListView) return _matches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_matches);
  }

  @override
  String toString() {
    return 'BracketRound(round: $round, matches: $matches)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BracketRoundImpl &&
            (identical(other.round, round) || other.round == round) &&
            const DeepCollectionEquality().equals(other._matches, _matches));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, round, const DeepCollectionEquality().hash(_matches));

  /// Create a copy of BracketRound
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BracketRoundImplCopyWith<_$BracketRoundImpl> get copyWith =>
      __$$BracketRoundImplCopyWithImpl<_$BracketRoundImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BracketRoundImplToJson(
      this,
    );
  }
}

abstract class _BracketRound implements BracketRound {
  const factory _BracketRound(
      {required final int round,
      required final List<BracketMatch> matches}) = _$BracketRoundImpl;

  factory _BracketRound.fromJson(Map<String, dynamic> json) =
      _$BracketRoundImpl.fromJson;

  @override
  int get round;
  @override
  List<BracketMatch> get matches;

  /// Create a copy of BracketRound
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BracketRoundImplCopyWith<_$BracketRoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
