import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/game.dart';
import '../../data/knockout_storage.dart';
import 'knockout_state.dart';

class KnockoutCubit extends Cubit<KnockoutState> {
  KnockoutCubit({required this.userId, required KnockoutStorage storage})
      : _storage = storage,
        super(KnockoutState.initial());

  final int userId;
  final KnockoutStorage _storage;

  Future<void> load() async {
    final rounds = await _storage.load(userId);
    emit(state.copyWith(rounds: rounds));
  }

  void setBracketFixtures(List<BracketRound> fixtures) {
    emit(state.copyWith(bracketFixtures: fixtures));
  }

  Future<void> updateRound(int round, List<List<GameWithResult>> games) async {
    final rounds = {...state.rounds, round: games};
    emit(state.copyWith(rounds: rounds));
    await _storage.save(userId, rounds);
  }

  Future<void> reset() async {
    await _storage.clear(userId);
    emit(state.copyWith(rounds: const {}));
  }
}
