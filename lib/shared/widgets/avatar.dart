import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key, required this.name, this.size = 36, this.uri});

  final String name;
  final double size;
  final String? uri;

  static const List<Color> _palette = [
    Color(0xFFE57373),
    Color(0xFFF06292),
    Color(0xFFBA68C8),
    Color(0xFF9575CD),
    Color(0xFF7986CB),
    Color(0xFF64B5F6),
    Color(0xFF4FC3F7),
    Color(0xFF4DD0E1),
    Color(0xFF4DB6AC),
    Color(0xFF81C784),
    Color(0xFFAED581),
    Color(0xFFFF8A65),
    Color(0xFFA1887F),
    Color(0xFF90A4AE),
  ];

  Color _colorFor(String value) {
    var hash = 0;
    for (final char in value.codeUnits) {
      hash = char + ((hash << 5) - hash);
    }
    return _palette[hash.abs() % _palette.length];
  }

  String _initials(String value) {
    final parts =
        value.trim().split(RegExp(r'\s+')).where((p) => p.isNotEmpty).toList();
    if (parts.length >= 2) {
      return (parts.first[0] + parts.last[0]).toUpperCase();
    }
    if (value.length >= 2) return value.substring(0, 2).toUpperCase();
    if (value.isNotEmpty) return value.substring(0, 1).toUpperCase();
    return '?';
  }

  @override
  Widget build(BuildContext context) {
    if (uri != null && uri!.isNotEmpty) {
      return ClipOval(
        child: Image.network(
          uri!,
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _initialsAvatar(),
        ),
      );
    }
    return _initialsAvatar();
  }

  Widget _initialsAvatar() {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: _colorFor(name),
        shape: BoxShape.circle,
      ),
      child: Text(
        _initials(name),
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: size * 0.4,
        ),
      ),
    );
  }
}
