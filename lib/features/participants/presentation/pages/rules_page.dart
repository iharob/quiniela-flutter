import 'package:flutter/material.dart';

import 'package:quiniela_flutter/core/domain/scoring_rule.dart';
import 'package:quiniela_flutter/features/theme/domain/tournament_theme.dart';

class RulesPage extends StatelessWidget {
  const RulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Reglas')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:
                  const EdgeInsets.fromLTRB(22, 0, 22, 10),
              child: Text(
                'PUNTUACIÓN',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.6,
                  color: tournament.textColor.withValues(alpha: 0.45),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: tournament.dimmedCardColor,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: tournament.borderColor, width: 0.5),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  for (var i = 0; i < defaultRules.length; i++) ...[
                    if (i > 0)
                      Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: Container(
                          height: 0.5,
                          color: tournament.borderColor,
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 14,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 14),
                              child: Text(
                                defaultRules[i].description,
                                style: TextStyle(
                                  fontSize: 14.5,
                                  height: 1.4,
                                  color:
                                      tournament.textColor.withValues(alpha: 0.82),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            constraints: const BoxConstraints(minWidth: 38),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: tournament.borderColor,
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              '+${defaultRules[i].value}',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: tournament.primaryColor.withValues(alpha: 0.85),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 22, 22, 4),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Opacity(
                      opacity: 0.5,
                      child: Icon(Icons.emoji_events,
                          color: tournament.primaryColor, size: 16),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'El participante con más puntos al finalizar el torneo gana la quiniela. Lógicamente.',
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.4,
                        color: tournament.textColor.withValues(alpha: 0.5),
                      ),
                    ),
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
