import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/classification.dart';
import '../../../../core/domain/group.dart';

part 'groups_state.freezed.dart';

@freezed
class GroupsState with _$GroupsState {
  const factory GroupsState({
    @Default(false) bool loading,
    @Default(<GroupWithResults>[]) List<GroupWithResults> groups,
    @Default(<ClassificationGroup>[]) List<ClassificationGroup> positions,
    String? error,
  }) = _GroupsState;

  factory GroupsState.initial() => const GroupsState(loading: true);
}
