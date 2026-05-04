import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Displays the country flag for a given ISO country code from the bundled
/// asset library. Falls back to an empty box when the asset is missing.
class TeamFlag extends StatefulWidget {
  const TeamFlag({
    super.key,
    required this.country,
    this.width = 24,
    this.height = 18,
  });

  final String country;
  final double width;
  final double height;

  @override
  State<TeamFlag> createState() => _TeamFlagState();
}

class _TeamFlagState extends State<TeamFlag> {
  static final Map<String, bool> _availability = {};

  late Future<bool> _exists;

  @override
  void initState() {
    super.initState();
    _exists = _resolve(widget.country);
  }

  @override
  void didUpdateWidget(covariant TeamFlag oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.country != widget.country) {
      _exists = _resolve(widget.country);
    }
  }

  Future<bool> _resolve(String country) async {
    final code = country.toLowerCase();
    final cached = _availability[code];
    if (cached != null) return cached;
    try {
      await rootBundle.load('assets/flags/$code.png');
      _availability[code] = true;
      return true;
    } catch (_) {
      _availability[code] = false;
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: FutureBuilder<bool>(
        future: _exists,
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            return Image.asset(
              'assets/flags/${widget.country.toLowerCase()}.png',
              width: widget.width,
              height: widget.height,
              fit: BoxFit.cover,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
