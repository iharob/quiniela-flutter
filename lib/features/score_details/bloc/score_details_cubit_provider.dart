import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/data/api_client.dart';
import '../presentation/bloc/score_details_cubit.dart';

class ScoreDetailsCubitProvider extends StatelessWidget {
  const ScoreDetailsCubitProvider({
    super.key,
    required this.userId,
    required this.child,
  });

  final int userId;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ScoreDetailsCubit(
        apiClient: context.read<ApiClient>(),
        userId: userId,
      ),
      child: child,
    );
  }
}
