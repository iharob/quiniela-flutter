import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:quiniela_flutter/core/domain/group.dart';
import 'package:quiniela_flutter/core/domain/team.dart';

part 'classification.freezed.dart';

@freezed
class DirectMatch with _$DirectMatch {
  const factory DirectMatch({
    required int scored,
    required int received,
  }) = _DirectMatch;
}

@freezed
class ClassificationEntry with _$ClassificationEntry {
  const factory ClassificationEntry({
    required Team team,
    required int played,
    required int won,
    required int drawn,
    required int lost,
    required int goalsScored,
    required int goalsReceived,
    @Default(<String, DirectMatch>{}) Map<String, DirectMatch> directMatches,
  }) = _ClassificationEntry;

  factory ClassificationEntry.zero(Team team) => ClassificationEntry(
        team: team,
        played: 0,
        won: 0,
        drawn: 0,
        lost: 0,
        goalsScored: 0,
        goalsReceived: 0,
      );
}

@freezed
class ClassificationGroup with _$ClassificationGroup {
  const factory ClassificationGroup({
    required String name,
    required List<ClassificationEntry> entries,
  }) = _ClassificationGroup;
}

int computePoints(ClassificationEntry entry) => 3 * entry.won + entry.drawn;

ClassificationEntry _updateClassification({
  required Team team,
  required Team opponent,
  required int? teamScore,
  required int? opponentScore,
  required ClassificationEntry current,
}) {
  if (teamScore == null || opponentScore == null) {
    return current;
  }
  final won = teamScore > opponentScore ? current.won + 1 : current.won;
  final drawn = teamScore == opponentScore ? current.drawn + 1 : current.drawn;
  final lost = teamScore < opponentScore ? current.lost + 1 : current.lost;
  return current.copyWith(
    played: current.played + 1,
    won: won,
    drawn: drawn,
    lost: lost,
    goalsScored: current.goalsScored + teamScore,
    goalsReceived: current.goalsReceived + opponentScore,
    directMatches: {
      ...current.directMatches,
      opponent.country: DirectMatch(scored: teamScore, received: opponentScore),
    },
  );
}

List<ClassificationGroup> computeClassificationTable(
  List<GroupWithResults> groups,
) {
  return groups.map((group) {
    final teamsByCountry = <String, Team>{};
    for (final game in group.games) {
      teamsByCountry.putIfAbsent(game.team1.country, () => game.team1);
      teamsByCountry.putIfAbsent(game.team2.country, () => game.team2);
    }
    var table = <String, ClassificationEntry>{
      for (final team in teamsByCountry.values)
        team.country: ClassificationEntry.zero(team),
    };
    for (final game in group.games) {
      table = {
        ...table,
        game.team1.country: _updateClassification(
          team: game.team1,
          opponent: game.team2,
          teamScore: game.team1Score,
          opponentScore: game.team2Score,
          current: table[game.team1.country]!,
        ),
        game.team2.country: _updateClassification(
          team: game.team2,
          opponent: game.team1,
          teamScore: game.team2Score,
          opponentScore: game.team1Score,
          current: table[game.team2.country]!,
        ),
      };
    }

    final entries = table.values.toList()
      ..sort((a, b) {
        final pa = computePoints(a);
        final pb = computePoints(b);
        if (pa != pb) return pb - pa;

        final diffA = a.goalsScored - a.goalsReceived;
        final diffB = b.goalsScored - b.goalsReceived;
        if (diffA != diffB) return diffB - diffA;

        if (a.goalsScored != b.goalsScored) {
          return b.goalsScored - a.goalsScored;
        }

        final direct = a.directMatches[b.team.country] ??
            const DirectMatch(scored: 0, received: 0);
        if (direct.scored > direct.received) return 1;
        return 0;
      });

    return ClassificationGroup(name: group.name, entries: entries);
  }).toList();
}
