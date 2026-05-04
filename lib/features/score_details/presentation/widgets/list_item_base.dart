import 'package:flutter/material.dart';

class ScoreListItemBase extends StatelessWidget {
  const ScoreListItemBase({
    super.key,
    required this.added,
    required this.total,
    required this.child,
  });

  final int added;
  final int total;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final addedText = added == 0
        ? const _DimmedText('—')
        : Text('+$added', style: _strongTextStyle);
    final totalText = added == 0
        ? _DimmedText('$total')
        : Text('$total', style: _strongTextStyle);
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: child,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 9),
            child: SizedBox(
              width: 40,
              height: 18,
              child: Center(child: addedText),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 9),
            child: SizedBox(
              width: 40,
              height: 18,
              child: Center(child: totalText),
            ),
          ),
        ],
      ),
    );
  }
}

const TextStyle _strongTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
);

class _DimmedText extends StatelessWidget {
  const _DimmedText(this.text);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.25,
      child: Text(text, style: _strongTextStyle),
    );
  }
}
