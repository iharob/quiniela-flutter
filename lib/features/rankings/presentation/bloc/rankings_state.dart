import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/rankings.dart';

part 'rankings_state.freezed.dart';

@freezed
class RankingsState with _$RankingsState {
  const factory RankingsState({
    @Default(false) bool fetching,
    @Default(<RankingsEntry>[]) List<RankingsEntry> entries,
    String? error,
  }) = _RankingsState;
}
