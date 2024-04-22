import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:warehouse_web/src/const/solved_rank.dart';
import 'package:warehouse_web/src/model/question.dart';
import 'package:warehouse_web/src/view/question/widget/question_bottomsheet.dart';
import 'package:warehouse_web/src/view/question/widget/question_dialog.dart';
import 'package:warehouse_web/src/view/question/widget/question_tag.dart';

class QuestionTile extends HookWidget {
  const QuestionTile({
    super.key,
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    final List<String> tags = question.tag!.split(',');
    final updateFlag = useState(false);

    tags.removeWhere((element) => element.isEmpty || element == " ");

    return Container(
      margin: const EdgeInsets.all(8),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) {
          updateFlag.value = !updateFlag.value;
        },
        onExit: (event) {
          updateFlag.value = !updateFlag.value;
        },
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return QuestionDialog(
                          questionId: question.id,
                        );
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${question.source}"),
                            const SizedBox(
                              height: 8,
                            ),
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
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Wrap(
                              runSpacing: 4,
                              children: tags
                                  .map((e) => QuestionTag(tagName: e))
                                  .toList(),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getRank(question),
                          Text("시간 제한 : ${question.timeLimit ?? '정보 없음'}"),
                          Text("공간 제한 : ${question.memoryLimit ?? '정보 없음'}"),
                          Text("총 시도 : ${question.totalTries ?? '정보 없음'}"),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return QuestionBottomSheet(
                      questionId: question.id,
                    );
                  },
                );
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(8),
                width: updateFlag.value ? 30 : 0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFF89D3FB),
                ),
                child: const Center(
                  child: Text(
                    "문제 수정",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
