import 'package:freezed_annotation/freezed_annotation.dart';

part 'scoring_rule.freezed.dart';

@freezed
class ScoringRule with _$ScoringRule {
  const factory ScoringRule({
    required String description,
    required int value,
  }) = _ScoringRule;
}

const List<ScoringRule> defaultRules = [
  ScoringRule(
    description:
        'Al acertar resultado y marcador de un juego en cualquiera de las fases',
    value: 3,
  ),
  ScoringRule(
    description: 'Al acertar sólo el resultado en algun juego',
    value: 1,
  ),
  ScoringRule(
    description: 'Por cada clasificado en cualquiera de la fases de grupo',
    value: 1,
  ),
  ScoringRule(
    description: 'Por cada llave acertada en los grupos se le asignan',
    value: 2,
  ),
  ScoringRule(description: 'Acertar campeón', value: 5),
];
