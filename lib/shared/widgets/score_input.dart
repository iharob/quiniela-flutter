import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:quiniela_flutter/core/domain/team.dart';
import 'package:quiniela_flutter/features/theme/domain/tournament_theme.dart';

class ScoreInput extends StatefulWidget {
  const ScoreInput({
    super.key,
    required this.value,
    required this.team,
    required this.gameId,
    required this.onChange,
  });

  final int? value;
  final Team team;
  final int gameId;
  final void Function(int gameId, Team team, int? value) onChange;

  @override
  State<ScoreInput> createState() => _ScoreInputState();
}

class _ScoreInputState extends State<ScoreInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value?.toString() ?? '');
  }

  @override
  void didUpdateWidget(covariant ScoreInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    final next = widget.value?.toString() ?? '';
    if (_controller.text != next) {
      _controller.text = next;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleChange(String text) {
    if (text.trim().isEmpty) {
      widget.onChange(widget.gameId, widget.team, null);
      return;
    }
    final parsed = int.tryParse(text);
    if (parsed != null) {
      widget.onChange(widget.gameId, widget.team, parsed);
    }
  }

  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    return SizedBox(
      width: 30,
      height: 30,
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(2),
        ],
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        onChanged: _handleChange,
        style: TextStyle(
          color: tournament.textColor,
          height: 1,
        ),
        decoration: const InputDecoration(
          constraints: BoxConstraints(minHeight: 30, minWidth: 30),
          prefix: SizedBox(width: 2.0),
          contentPadding: EdgeInsets.zero,
          hintText: '0',
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 1.0),
          ),
        ),
      ),
    );
  }
}
