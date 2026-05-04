import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/domain/team.dart';
import '../../features/theme/domain/tournament_theme.dart';

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
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value?.toString() ?? '');
    _focusNode.addListener(() => setState(() {}));
  }

  @override
  void didUpdateWidget(covariant ScoreInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    final next = widget.value?.toString() ?? '';
    if (_controller.text != next && !_focusNode.hasFocus) {
      _controller.text = next;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
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
        focusNode: _focusNode,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(2),
        ],
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        onChanged: _handleChange,
        cursorHeight: 16,
        style: TextStyle(
          color: tournament.textColor,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          hintText: '0',
          hintStyle: TextStyle(color: tournament.placeholderTextColor),
          fillColor: const Color(0x0D000000),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: tournament.textColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: tournament.textColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide:
                BorderSide(color: tournament.primaryColor, width: 2),
          ),
        ),
      ),
    );
  }
}
