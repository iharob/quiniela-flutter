import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_filex/open_filex.dart';

import 'package:quiniela_flutter/core/data/api_client.dart';
import 'package:quiniela_flutter/core/domain/predicted_result.dart';
import 'package:quiniela_flutter/shared/widgets/avatar.dart';
import 'package:quiniela_flutter/features/theme/domain/tournament_theme.dart';
import 'package:quiniela_flutter/features/score_details/presentation/bloc/score_details_cubit.dart';
import 'package:quiniela_flutter/features/score_details/presentation/bloc/score_details_state.dart';
import 'package:quiniela_flutter/features/score_details/presentation/widgets/result_and_prediction.dart';

const Map<int, String> _knockoutRoundNames = {
  2: 'Dieciseisavos de final',
  3: 'Octavos de final',
  4: 'Cuartos de final',
  5: 'Semi-final',
  6: 'Final',
};

class _Section {
  const _Section({
    required this.sortKey,
    required this.title,
    required this.round,
    required this.items,
  });
  final String sortKey;
  final String title;
  final int round;
  final List<PredictedResult> items;
}

List<_Section> _computeSections(PointsDetails details) {
  final groupsByName = <String, List<PredictedResult>>{};
  for (final r in details.groups) {
    final key = r.classificationGroup ?? '?';
    groupsByName.putIfAbsent(key, () => []).add(r);
  }
  final groupsSections = groupsByName.entries
      .map((e) => _Section(
            sortKey: e.key,
            title: 'Grupo ${e.key}',
            round: 1,
            items: e.value,
          ))
      .toList()
    ..sort((a, b) => a.sortKey.compareTo(b.sortKey));

  final knockoutByRound = <int, List<PredictedResult>>{};
  for (final r in details.knockout) {
    knockoutByRound.putIfAbsent(r.round, () => []).add(r);
  }
  final knockoutSections = knockoutByRound.entries
      .map((e) => _Section(
            sortKey: '${e.key}',
            title: _knockoutRoundNames[e.key] ?? 'Ronda ${e.key}',
            round: e.key,
            items: e.value,
          ))
      .toList();

  final finalSections = <_Section>[];
  if (details.finalMatch != null) {
    finalSections.add(_Section(
      sortKey: '6',
      title: _knockoutRoundNames[6]!,
      round: 6,
      items: [details.finalMatch!],
    ));
  }

  return [...groupsSections, ...knockoutSections, ...finalSections];
}

class ScoreDetailsPage extends StatefulWidget {
  const ScoreDetailsPage({
    super.key,
    required this.userId,
    required this.userName,
    this.bio,
    this.photoUrl,
  });

  final int userId;
  final String userName;
  final String? bio;
  final String? photoUrl;

  @override
  State<ScoreDetailsPage> createState() => _ScoreDetailsPageState();
}

class _SectionHeaderDelegate extends SliverPersistentHeaderDelegate {
  _SectionHeaderDelegate({required this.title, required this.textColor});

  final String title;
  final Color textColor;

  static const double _height = 40;

  @override
  double get minExtent => _height;
  @override
  double get maxExtent => _height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Color(0xFFA0A0A0)),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
          SizedBox(
            width: 40,
            child: Center(
              child: Icon(Icons.calculate, color: textColor, size: 16),
            ),
          ),
          SizedBox(
            width: 40,
            child: Center(
              child: Icon(Icons.drag_handle, color: textColor, size: 16),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(_SectionHeaderDelegate oldDelegate) {
    return oldDelegate.title != title || oldDelegate.textColor != textColor;
  }
}

class _ScoreDetailsPageState extends State<ScoreDetailsPage> {
  bool _downloading = false;

  @override
  void initState() {
    super.initState();
    context.read<ScoreDetailsCubit>().refresh();
  }

  Future<void> _downloadPdf() async {
    setState(() => _downloading = true);
    try {
      final api = context.read<ApiClient>();
      final file = await api.downloadUserScorePdf(widget.userId);
      await OpenFilex.open(file.path, type: 'application/pdf');
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No se pudo abrir el PDF: $e')),
      );
    } finally {
      if (mounted) setState(() => _downloading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Avatar(name: widget.userName, uri: widget.photoUrl, size: 36),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.userName,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: tournament.contrastTextColor,
                    ),
                  ),
                  Text(
                    widget.bio ?? '—',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      color: tournament.contrastTextColor.withValues(alpha: 0.75),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: IconButton(
              tooltip: 'Descargar PDF',
              onPressed: _downloading ? null : _downloadPdf,
              icon: _downloading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.picture_as_pdf),
            ),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: BlocBuilder<ScoreDetailsCubit, ScoreDetailsState>(
          builder: (context, state) {
            if (state.data == null && state.fetching) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.data == null && state.error != null) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'No se pudo cargar el detalle.',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        state.error!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFFCC0000),
                        ),
                      ),
                      const SizedBox(height: 16),
                      FilledButton.tonal(
                        onPressed: () =>
                            context.read<ScoreDetailsCubit>().refresh(),
                        child: const Text('Reintentar'),
                      ),
                    ],
                  ),
                ),
              );
            }
            final data = state.data ?? PointsDetails.empty();
            final sections = _computeSections(data);
            if (sections.isEmpty) {
              return RefreshIndicator(
                onRefresh: () => context.read<ScoreDetailsCubit>().refresh(),
                child: ListView(
                  children: const [
                    SizedBox(height: 80),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'Sin partidos predichos para mostrar.',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return RefreshIndicator(
              onRefresh: () => context.read<ScoreDetailsCubit>().refresh(),
              child: CustomScrollView(
                slivers: [
                  for (final section in sections)
                    SliverMainAxisGroup(
                      slivers: [
                        SliverPersistentHeader(
                          pinned: true,
                          delegate: _SectionHeaderDelegate(
                            title: section.title,
                            textColor: tournament.textColor,
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, i) =>
                                ResultAndPrediction(item: section.items[i]),
                            childCount: section.items.length,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
