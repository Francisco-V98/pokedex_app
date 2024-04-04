import 'package:flutter/material.dart';

class LineBarIndicator extends StatelessWidget {
  final String title;
  final int value;
  final Color color;
  const LineBarIndicator({
    super.key,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SizedBox(
        width: 320,
        child: Column(
          children: [
            Stack(
              children: [
                Text(
                  title.toUpperCase(),
                  style:  TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: color,
                  ),
                ),
                Text(
                  title.toUpperCase(),
                  style:  const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black38,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Stack(
              children: [
                SizedBox(
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(100),
                    minHeight: 24,
                    value: value / 255,
                    color: color,
                    backgroundColor: color.withOpacity(0.2),
                  ),
                ),
                Center(
                  child: Text(
                    value.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
