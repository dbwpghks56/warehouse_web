import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:warehouse_web/src/const/solved_rank.dart';
import 'package:warehouse_web/src/model/question.dart';
import 'package:warehouse_web/src/view/question/widget/question_tag.dart';

class QuestionTile extends StatelessWidget {
  const QuestionTile({
    super.key,
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    final List<String> tags = question.tag!.split(' , ');
    tags.removeWhere((element) => element.isEmpty);

    final String levelData;

    if (question.source == "solved.ac") {
      levelData = rankLevel[question.level!];
    } else if (question.source == "leetcode") {
      switch (question.level) {
        case 1:
          levelData = "Easy";
          break;
        case 2:
          levelData = "Medium";
          break;
        case 3:
          levelData = "Hard";
          break;
        default:
          levelData = "Unknown";
      }
    } else {
      levelData = "Level ${question.level}";
    }

    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        question.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text("출처 : ${question.source}")
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: tags.map((e) => QuestionTag(tagName: e)).toList(),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Text("시간 제한 : ${question.timeLimit ?? '정보 없음'}"),
                Text("공간 제한 : ${question.memoryLimit ?? '정보 없음'}"),
                Text("평균시도 : ${question.averageTries ?? '정보 없음'}"),
                Text("총 시도 : ${question.totalTries ?? '정보 없음'}"),
              ],
            ),
            const SizedBox(width: 12),
            Column(
              children: [
                Text(
                  levelData,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "도전한 사람 : ${question.totalPerson ?? '정보 없음'}",
                ),
                Text(
                  "정답률 : ${question.successRate?.toStringAsFixed(2) ?? '정보 없음'} %",
                ),
                Text(
                  "완료한 사람 : ${question.totalSuccess ?? '정보 없음'}",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
