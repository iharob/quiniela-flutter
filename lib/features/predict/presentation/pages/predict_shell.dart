import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/api_client.dart';
import '../../data/groups_storage.dart';
import '../../data/knockout_storage.dart';
import '../bloc/groups_cubit.dart';
import '../bloc/knockout_cubit.dart';

/// Wraps the predict flow with the user-scoped [GroupsCubit] and [KnockoutCubit].
class PredictShell extends StatelessWidget {
  const PredictShell({
    super.key,
    required this.userId,
    required this.child,
  });

  final int userId;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final api = context.read<ApiClient>();
    final groupsStorage = context.read<GroupsStorage>();
    final knockoutStorage = context.read<KnockoutStorage>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              GroupsCubit(apiClient: api, storage: groupsStorage, userId: userId),
        ),
        BlocProvider(
          create: (_) =>
              KnockoutCubit(userId: userId, storage: knockoutStorage)..load(),
        ),
      ],
      child: child,
    );
  }
}
