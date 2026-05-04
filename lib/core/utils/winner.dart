import '../domain/game.dart';
import '../domain/team.dart';

Team getWinner(GameWithResult game) {
  final s1 = game.team1Score;
  final s2 = game.team2Score;
  if (s1 == null || s2 == null) return unknownTeam;
  if (s1 > s2) return game.team1;
  if (s1 < s2) return game.team2;
  return game.winner ?? unknownTeam;
}
