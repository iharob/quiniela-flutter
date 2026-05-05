import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';

import 'package:quiniela_flutter/core/domain/team.dart';

class _FifaRankingEntry {
  const _FifaRankingEntry({required this.iso2, required this.points});
  final String iso2;
  final int points;
}

class Simulator {
  Simulator._(this._pointsByCountry);

  static const int _defaultPoints = 1300;
  static const double _totalExpectedGoals = 3.5;

  final Map<String, int> _pointsByCountry;
  final Random _random = Random();

  static Simulator? _instance;

  static Future<Simulator> load() async {
    if (_instance != null) return _instance!;
    final raw = await rootBundle.loadString('assets/rankings.json');
    final list = (jsonDecode(raw) as List<dynamic>)
        .map((e) => _FifaRankingEntry(
              iso2: e['iso2'] as String,
              points: (e['points'] as num).toInt(),
            ))
        .toList();
    final map = <String, int>{for (final e in list) e.iso2: e.points};
    _instance = Simulator._(map);
    return _instance!;
  }

  /// Synchronous access; returns a no-op simulator when assets aren't loaded yet.
  static Simulator get instance =>
      _instance ?? Simulator._(const <String, int>{});

  int _pointsFor(Team team) {
    final p = _pointsByCountry[team.country];
    if (p != null) return p;
    final fallback = _pointsByCountry['GB-${team.country}'];
    return fallback ?? _defaultPoints;
  }

  int _poissonSample(double lambda) {
    final limit = exp(-lambda);
    var k = 0;
    var p = 1.0;
    do {
      k += 1;
      p *= _random.nextDouble();
    } while (p > limit);
    return k - 1;
  }

  double _strengthShare(int a, int b) =>
      1 / (1 + pow(10, -(a - b) / 250).toDouble());

  ({int team1Score, int team2Score}) simulateGroupScore(Team t1, Team t2) {
    final share = _strengthShare(_pointsFor(t1), _pointsFor(t2));
    return (
      team1Score: _poissonSample(_totalExpectedGoals * share),
      team2Score: _poissonSample(_totalExpectedGoals * (1 - share)),
    );
  }

  ({int team1Score, int team2Score, Team? winner}) simulateScore(
      Team t1, Team t2) {
    final share = _strengthShare(_pointsFor(t1), _pointsFor(t2));
    final s1 = _poissonSample(_totalExpectedGoals * share);
    final s2 = _poissonSample(_totalExpectedGoals * (1 - share));
    final winner = s1 == s2 ? (_random.nextDouble() < share ? t1 : t2) : null;
    return (team1Score: s1, team2Score: s2, winner: winner);
  }
}
