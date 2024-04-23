import 'package:flutter/material.dart';

class QuestionTag extends StatelessWidget {
  const QuestionTag({
    super.key,
    required this.tags,
  });

  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 4,
      children: tags.map((e) {
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
            e,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              color: Colors.white,
            ),
          ),
        );
      }).toList(),
    );
  }
}
