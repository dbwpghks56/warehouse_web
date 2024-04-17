import 'package:flutter/material.dart';

class QuestionTag extends StatelessWidget {
  const QuestionTag({
    super.key,
    required this.tagName,
  });

  final String tagName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.only(right: 4),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white70,
        ),
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFF89D3FB),
      ),
      child: Text(
        tagName,
        style: const TextStyle(
          overflow: TextOverflow.ellipsis,
          color: Colors.white,
        ),
      ),
    );
  }
}
