import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScoreDifferenceBadge extends StatelessWidget {
  const ScoreDifferenceBadge({super.key, required this.difference});

  final int difference;

  static final NumberFormat _formatter = NumberFormat()..maximumFractionDigits = 0;

  String _format() {
    if (difference == 0) return '';
    final value = _formatter.format(difference.abs());
    return difference > 0 ? '+$value' : '-$value';
  }

  @override
  Widget build(BuildContext context) {
    if (difference == 0) return const SizedBox.shrink();
    final color = difference > 0
        ? const Color(0xFF11AF30)
        : const Color(0xFFCF013E);
    return Positioned(
      top: 0,
      right: 0,
      child: SizedBox(
        width: 16,
        height: 12,
        child: Center(
          child: Text(
            _format(),
            textAlign: TextAlign.center,
            style: TextStyle(color: color, fontSize: 11, height: 1),
          ),
        ),
      ),
    );
  }
}
