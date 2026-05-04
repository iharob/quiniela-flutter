import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/list_item_separator.dart';
import '../bloc/rankings_cubit.dart';
import '../bloc/rankings_state.dart';
import '../widgets/list_header.dart';
import '../widgets/ranking_list_item.dart';

class RankingsPage extends StatefulWidget {
  const RankingsPage({super.key});

  @override
  State<RankingsPage> createState() => _RankingsPageState();
}

class _RankingsPageState extends State<RankingsPage> {
  @override
  void initState() {
    super.initState();
    context.read<RankingsCubit>().refresh();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RankingsCubit, RankingsState>(
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () => context.read<RankingsCubit>().refresh(),
          child: state.entries.isEmpty
              ? ListView(
                  children: [
                    const RankingsListHeader(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListEmptyMessage(
                            message: state.fetching
                                ? 'Cargando...'
                                : state.error != null
                                    ? 'Probablemente hay un problema de conexión.'
                                    : 'Parece que aún no empezamos.',
                            error: state.error != null,
                          ),
                          if (state.error != null)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              child: Text(
                                state.error!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFFCC0000),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                )
              : CustomScrollView(
                  slivers: [
                    const SliverPersistentHeader(
                      pinned: true,
                      delegate: _StickyHeader(),
                    ),
                    SliverList.separated(
                      itemCount: state.entries.length,
                      separatorBuilder: (_, __) => const ListItemSeparator(),
                      itemBuilder: (context, index) {
                        final entry = state.entries[index];
                        return RankingListItem(
                          entry: entry,
                          onTap: () => context.push(
                            '/score-details/${entry.userId}',
                            extra: ScoreDetailsArgs(
                              userName: entry.userName,
                              photoUrl: entry.photoUrl,
                              bio: entry.bio,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class ScoreDetailsArgs {
  const ScoreDetailsArgs({required this.userName, this.photoUrl, this.bio});
  final String userName;
  final String? photoUrl;
  final String? bio;
}

class _StickyHeader extends SliverPersistentHeaderDelegate {
  const _StickyHeader();

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) =>
      const RankingsListHeader();

  @override
  double get maxExtent => 44;

  @override
  double get minExtent => 44;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
