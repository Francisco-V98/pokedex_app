import 'package:flutter/material.dart';

class TextDataInformation extends StatelessWidget {
  final String title;
  final String description;
  final Color color;
  const TextDataInformation({
    super.key,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 2),
        SizedBox(
          width: 330,
          child: Text(description.replaceAll('\n', ' ')),
        ),
        const SizedBox(height: 6),
        Divider(
          color: color.withOpacity(0.7),
        ),
      ],
    );
  }
}