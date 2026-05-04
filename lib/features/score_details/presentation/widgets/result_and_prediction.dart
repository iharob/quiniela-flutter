import 'package:flutter/material.dart';

import '../../../../core/domain/predicted_result.dart';
import '../../../../shared/widgets/team_item.dart';
import 'list_item_base.dart';
import 'team_cell.dart';

const double _teamRowHeight = 24;

class ResultAndPrediction extends StatelessWidget {
  const ResultAndPrediction({super.key, required this.item});

  final PredictedResult item;

  bool get _hasActual =>
      item.actualTeam1 != null &&
      item.actualTeam2 != null &&
      item.actualScoreTeam1 != null &&
      item.actualScoreTeam2 != null;

  @override
  Widget build(BuildContext context) {
    return ScoreListItemBase(
      added: item.matchPoints,
      total: item.total,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PredictedTeamCell(
                predicted: item.predictedTeam1,
                actual: item.actualTeam1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: SizedBox(
                      height: _teamRowHeight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _Score(text: '${item.predictedScoreTeam1}'),
                          const _Separator(),
                          _Score(text: '${item.predictedScoreTeam2}'),
                        ],
                      ),
                    ),
                  ),
                  if (_hasActual)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: SizedBox(
                        height: _teamRowHeight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _Score(
                              text: '${item.actualScoreTeam1}',
                              actual: true,
                            ),
                            const _Separator(actual: true),
                            _Score(
                              text: '${item.actualScoreTeam2}',
                              actual: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: PredictedTeamCell(
                predicted: item.predictedTeam2,
                actual: item.actualTeam2,
                direction: TeamItemDirection.reverse,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Score extends StatelessWidget {
  const _Score({required this.text, this.actual = false});
  final String text;
  final bool actual;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: actual ? 0.55 : 1,
      child: Text(
        text,
        style: TextStyle(
          fontSize: actual ? 12 : 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _Separator extends StatelessWidget {
  const _Separator({this.actual = false});
  final bool actual;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: actual ? 0.55 : 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Text(
          '—',
          style: TextStyle(fontSize: actual ? 12 : 14),
        ),
      ),
    );
  }
}
