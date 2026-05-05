import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:quiniela_flutter/core/domain/game.dart';
import 'package:quiniela_flutter/features/predict/data/knockout_storage.dart';

part 'knockout_state.freezed.dart';

@freezed
class KnockoutState with _$KnockoutState {
  const factory KnockoutState({
    @Default(<int, List<List<GameWithResult>>>{}) KnockoutRounds rounds,
    @Default(<BracketRound>[]) List<BracketRound> bracketFixtures,
  }) = _KnockoutState;

  factory KnockoutState.initial() => const KnockoutState();
}
