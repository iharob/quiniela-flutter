import 'package:flutter/material.dart';

import '../../../../core/domain/classification.dart';
import '../../../../shared/widgets/team_item.dart';
import '../../../theme/domain/tournament_theme.dart';

class GroupClassificationTable extends StatelessWidget {
  const GroupClassificationTable({
    super.key,
    required this.group,
    this.rowHeight,
  });

  final ClassificationGroup group;
  final double? rowHeight;

  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    final headerStyle = TextStyle(
      color: tournament.textColor,
      fontWeight: FontWeight.w800,
      fontSize: 11,
    ).copyWith();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        children: [
          SizedBox(
            height: 30,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              child: Row(
                children: [
                  SizedBox(
                    width: 140,
                    child: Text(
                      'EQUIPO',
                      style: headerStyle,
                    ),
                  ),
                  const Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _HeaderCell('PTS'),
                        _HeaderCell('J'),
                        _HeaderCell('G'),
                        _HeaderCell('E'),
                        _HeaderCell('P'),
                        _HeaderCell('GA'),
                        _HeaderCell('GR'),
                        _HeaderCell('+/-'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          for (var i = 0; i < group.entries.length; i++)
            Column(
              children: [
                _Row(entry: group.entries[i], rowHeight: rowHeight),
                if (i < group.entries.length - 1)
                  Container(height: 1, color: const Color(0xFFCCCCCC)),
              ],
            ),
        ],
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.entry, this.rowHeight});

  final ClassificationEntry entry;
  final double? rowHeight;

  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    final valueStyle = TextStyle(
      color: tournament.textColor,
      fontWeight: FontWeight.w700,
      fontSize: 13,
    );
    return SizedBox(
      height: rowHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 140,
              child: TeamItem(team: entry.team),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _ValueCell(text: '${computePoints(entry)}', style: valueStyle),
                  _ValueCell(text: '${entry.played}', style: valueStyle, dim: true),
                  _ValueCell(text: '${entry.won}', style: valueStyle, dim: true),
                  _ValueCell(text: '${entry.drawn}', style: valueStyle, dim: true),
                  _ValueCell(text: '${entry.lost}', style: valueStyle, dim: true),
                  _ValueCell(
                    text: '${entry.goalsScored}',
                    style: valueStyle,
                    dim: true,
                  ),
                  _ValueCell(
                    text: '${entry.goalsReceived}',
                    style: valueStyle,
                    dim: true,
                  ),
                  _ValueCell(
                    text: '${entry.goalsScored - entry.goalsReceived}',
                    style: valueStyle,
                    dim: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  const _HeaderCell(this.text);
  final String text;
  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    return Expanded(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: tournament.textColor.withValues(alpha: 0.75),
          fontWeight: FontWeight.w800,
          fontSize: 11,
        ),
      ),
    );
  }
}

class _ValueCell extends StatelessWidget {
  const _ValueCell({required this.text, required this.style, this.dim = false});
  final String text;
  final TextStyle style;
  final bool dim;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Opacity(
        opacity: dim ? 0.65 : 1,
        child: Text(text, textAlign: TextAlign.center, style: style),
      ),
    );
  }
}
