import 'package:flutter/material.dart';

import 'package:quiniela_flutter/core/domain/team.dart';
import 'package:quiniela_flutter/features/theme/domain/tournament_theme.dart';
import 'package:quiniela_flutter/shared/widgets/team_flag.dart';

enum TeamItemOrientation { horizontal, vertical }

enum TeamItemDirection { normal, reverse }

enum TeamItemVariant { dark, light }

class TeamItem extends StatelessWidget {
  const TeamItem({
    super.key,
    required this.team,
    this.orientation = TeamItemOrientation.horizontal,
    this.direction = TeamItemDirection.normal,
    this.variant = TeamItemVariant.dark,
    this.strikethrough = false,
  });

  final Team team;
  final TeamItemOrientation orientation;
  final TeamItemDirection direction;
  final TeamItemVariant variant;
  final bool strikethrough;

  Color _color(BuildContext context) {
    final tournament = context.tournamentTheme;
    return variant == TeamItemVariant.light
        ? tournament.contrastTextColor
        : tournament.textColor;
  }

  TextAlign _textAlign() {
    if (orientation == TeamItemOrientation.vertical) return TextAlign.center;
    return direction == TeamItemDirection.normal
        ? TextAlign.left
        : TextAlign.right;
  }

  @override
  Widget build(BuildContext context) {
    final color = _color(context);
    final isUnknown = team.country == 'NA';
    final flag = isUnknown
        ? const _UnknownFlag()
        : TeamFlag(country: team.country);

    final name = Expanded(
      child: Text(
        team.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: _textAlign(),
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w600,
          decoration:
              strikethrough ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
    );

    final children = direction == TeamItemDirection.reverse
        ? <Widget>[name, const SizedBox(width: 5), flag]
        : <Widget>[flag, const SizedBox(width: 5), name];

    if (orientation == TeamItemOrientation.vertical) {
      final verticalChildren = direction == TeamItemDirection.reverse
          ? <Widget>[
              Text(
                team.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(color: color, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              flag,
            ]
          : <Widget>[
              flag,
              const SizedBox(height: 4),
              Text(
                team.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(color: color, fontWeight: FontWeight.w600),
              ),
            ];

      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: verticalChildren,
      );
    }

    return SizedBox(
      height: 24,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}

class _UnknownFlag extends StatelessWidget {
  const _UnknownFlag();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 18,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0x26FFFFFF),
        borderRadius: BorderRadius.circular(2),
      ),
      child: const Text(
        '?',
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }
}
