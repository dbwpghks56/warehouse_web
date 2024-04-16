import 'package:flutter/material.dart';
import 'package:warehouse_web/src/const/solved_rank.dart';
import 'package:warehouse_web/src/model/question.dart';
import 'package:warehouse_web/src/view/question/widget/question_tag.dart';

class QuestionDialog extends StatelessWidget {
  const QuestionDialog({
    super.key,
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    final List<String> tags = question.tag!.split(' , ');
    tags.removeWhere((element) => element.isEmpty);

    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: 700,
        height: 600,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "제목 : ${question.title}",
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "상세 : ${question.content}",
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text("출처 : ${question.source!}"),
              const SizedBox(
                height: 12,
              ),
              Text(
                "난이도 : ${getRank(question)}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text("시간 제한 : ${question.timeLimit ?? '정보 없음'}"),
              const SizedBox(
                height: 12,
              ),
              Text("공간 제한 : ${question.memoryLimit ?? '정보 없음'}"),
              const SizedBox(
                height: 12,
              ),
              Text("평균시도 : ${question.averageTries ?? '정보 없음'}"),
              const SizedBox(
                height: 12,
              ),
              Text("총 시도 : ${question.totalTries ?? '정보 없음'}"),
              const SizedBox(
                height: 12,
              ),
              Text(
                "도전한 사람 : ${question.totalPerson ?? '정보 없음'}",
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "정답률 : ${question.successRate ?? '정보없음'}",
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "완료한 사람 : ${question.totalSuccess ?? '정보 없음'}",
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: tags.map((e) => QuestionTag(tagName: e)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
