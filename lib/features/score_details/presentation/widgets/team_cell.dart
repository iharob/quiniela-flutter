import 'package:flutter/material.dart';

import 'package:quiniela_flutter/core/domain/team.dart';
import 'package:quiniela_flutter/shared/widgets/team_item.dart';

class PredictedTeamCell extends StatelessWidget {
  const PredictedTeamCell({
    super.key,
    required this.predicted,
    required this.actual,
    this.direction = TeamItemDirection.normal,
  });

  final Team predicted;
  final Team? actual;
  final TeamItemDirection direction;

  @override
  Widget build(BuildContext context) {
    final matched = actual == null || actual!.country == predicted.country;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: TeamItem(
            team: predicted,
            direction: direction,
            strikethrough: !matched,
          ),
        ),
        if (actual != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: matched
                ? const SizedBox(height: 24)
                : TeamItem(team: actual!, direction: direction),
          ),
      ],
    );
  }
}
