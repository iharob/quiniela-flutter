import 'package:quiniela_flutter/core/domain/game.dart';

class KnockoutNavArgs {
  const KnockoutNavArgs({required this.round, required this.games});

  final int round;
  final List<List<GameWithResult>> games;
}
