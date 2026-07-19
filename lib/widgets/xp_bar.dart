import 'package:flutter/material.dart';

class XpBar extends StatelessWidget {
  final int xp;
  final int maxXp;

  const XpBar({
    super.key,
    required this.xp,
    required this.maxXp,
  });

  @override
  Widget build(BuildContext context) {

    double progress = xp / maxXp;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "XP",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        LinearProgressIndicator(
          value: progress,
          minHeight: 15,
          borderRadius: BorderRadius.circular(10),
        ),

        const SizedBox(height: 5),

        Text(
          "$xp / $maxXp",
          style: const TextStyle(
            fontSize: 16,
          ),
        ),

      ],
    );
  }
}