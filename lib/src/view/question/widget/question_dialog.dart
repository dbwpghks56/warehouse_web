import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:warehouse_web/src/const/solved_rank.dart';
import 'package:warehouse_web/src/model/question.dart';
import 'package:warehouse_web/src/service/query.dart';
import 'package:warehouse_web/src/view/question/widget/question_tag.dart';
import 'package:warehouse_web/util/tag_util.dart';

class QuestionDialog extends HookWidget {
  const QuestionDialog({
    super.key,
    required this.questionId,
  });

  final int questionId;

  @override
  Widget build(BuildContext context) {
    final detailQuestionQuery = useQuery(
      QueryOptions(
        document: gql(Queries.detailQuestion),
        variables: {
          'id': questionId,
        },
      ),
    );

    final result = detailQuestionQuery.result;

    return Dialog(
      backgroundColor: Colors.white,
      child: buildDialog(result),
    );
  }

  Widget buildDialog(QueryResult<Object?> result) {
    if (result.isLoading) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(16.0),
        width: 700,
        height: 600,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (result.hasException) {
      return Center(
        child: Text(result.exception.toString()),
      );
    } else {
      final Question question =
          Question.fromJson(result.data?["detailQuestion"]);
      final List<String> tags = getTags(question.tag!);

      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(16.0),
        width: 700,
        height: 600,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                question.title,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 1,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "상세 : ${question.content}",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(question.source!),
              const SizedBox(
                height: 12,
              ),
              getRank(question),
              const SizedBox(
                height: 12,
              ),
              Text("백준 ID : ${question.problemId ?? '정보 없음'}"),
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
                "맞힌 사람 : ${question.totalPerson ?? '정보 없음'}",
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
                "맞춘 시도 : ${question.totalSuccess ?? '정보 없음'}",
              ),
              const SizedBox(
                height: 12,
              ),
              QuestionTag(tags: tags),
            ],
          ),
        ),
      );
    }
  }
}
