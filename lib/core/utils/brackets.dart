import '../domain/game.dart';
import '../domain/team.dart';
import 'winner.dart';

GameWithResult _bracketMatchToGame(BracketMatch match) => GameWithResult(
      gameId: match.gameId,
      team1: match.team1 ?? unknownTeam,
      team2: match.team2 ?? unknownTeam,
      team1Score: match.team1Score,
      team2Score: match.team2Score,
      date: match.date,
      winner: match.winner,
    );

BracketRound? findRound(List<BracketRound> rounds, int round) {
  for (final r in rounds) {
    if (r.round == round) return r;
  }
  return null;
}

List<List<GameWithResult>> pairMatchesByFeeders(
  List<BracketMatch> currentRound,
  List<BracketMatch> nextRound,
) {
  final byId = {for (final m in currentRound) m.gameId: m};
  final pairs = <List<GameWithResult>>[];
  for (final next in nextRound) {
    final from1 = next.team1FromGame;
    final from2 = next.team2FromGame;
    if (from1 == null || from2 == null) continue;
    final m1 = byId[from1];
    final m2 = byId[from2];
    if (m1 == null || m2 == null) continue;
    pairs.add([_bracketMatchToGame(m1), _bracketMatchToGame(m2)]);
  }
  return pairs;
}

List<List<GameWithResult>> pairGamesByFeeders(
  List<GameWithResult> games,
  List<BracketMatch> nextRound,
) {
  final byId = {for (final g in games) g.gameId: g};
  final pairs = <List<GameWithResult>>[];
  for (final next in nextRound) {
    final from1 = next.team1FromGame;
    final from2 = next.team2FromGame;
    if (from1 == null || from2 == null) continue;
    final g1 = byId[from1];
    final g2 = byId[from2];
    if (g1 == null || g2 == null) continue;
    pairs.add([g1, g2]);
  }
  return pairs;
}

List<GameWithResult> buildNextRoundGames(
  List<List<GameWithResult>> completedPairs,
  List<BracketMatch> nextRoundMatches,
) {
  final winnersByGameId = <int, Team>{};
  for (final pair in completedPairs) {
    winnersByGameId[pair[0].gameId] = getWinner(pair[0]);
    winnersByGameId[pair[1].gameId] = getWinner(pair[1]);
  }
  return nextRoundMatches.map((match) {
    final t1 = match.team1FromGame == null
        ? null
        : winnersByGameId[match.team1FromGame!];
    final t2 = match.team2FromGame == null
        ? null
        : winnersByGameId[match.team2FromGame!];
    return GameWithResult(
      gameId: match.gameId,
      team1: t1 ?? unknownTeam,
      team2: t2 ?? unknownTeam,
      date: match.date,
    );
  }).toList();
}
