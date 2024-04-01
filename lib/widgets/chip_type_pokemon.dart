import 'package:flutter/material.dart';

class ChipTypePokemon extends StatelessWidget {
  final Color backgroundChip;
  final String textChip;
  const ChipTypePokemon({
    super.key,
    required this.textChip,
    required this.backgroundChip,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: backgroundChip,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        textChip,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}