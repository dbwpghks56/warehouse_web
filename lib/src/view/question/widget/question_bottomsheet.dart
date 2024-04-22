import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:warehouse_web/src/const/solved_rank.dart';
import 'package:warehouse_web/src/model/question.dart';
import 'package:warehouse_web/src/service/query.dart';
import 'package:warehouse_web/src/view/question/widget/question_rank_modal.dart';
import 'package:warehouse_web/src/view/question/widget/question_tag.dart';

class QuestionBottomSheet extends HookWidget {
  QuestionBottomSheet({
    super.key,
    required this.questionId,
  });

  final int questionId;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final detailQuestionQuery = useQuery(
      QueryOptions(
        document: gql(Queries.updateBeforeQuestion),
        variables: {
          'id': questionId,
        },
      ),
    );

    final result = detailQuestionQuery.result;

    return Dialog(
      backgroundColor: Colors.white,
      child: buildBottomSheet(
        result,
        context,
      ),
    );
  }

  Widget buildBottomSheet(QueryResult<Object?> result, BuildContext context) {
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
      final tagString = useState(question.tag!);

      final List<String> tags = tagString.value.split(',');
      tags.removeWhere((element) => element.isEmpty || element == " ");

      final rankWidget = useState<Widget>(getRank(question));
      final rankIndex = useState(question.level);

      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(16.0),
        width: 700,
        height: 600,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        initialValue: question.title,
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
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          rankWidget.value,
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return RankModal(
                                    selectRank: (index) {
                                      rankWidget.value = rankLevel[index];
                                      rankIndex.value = index;
                                      Navigator.of(context).pop();
                                    },
                                  );
                                },
                              );
                            },
                            icon: const Icon(
                              Icons.edit,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          const Text("시간 제한 : "),
                          Expanded(
                            child: TextFormField(
                              initialValue: question.timeLimit,
                              onSaved: (newValue) {
                                if (!newValue!.contains("초")) {
                                  newValue = "$newValue 초";
                                }
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          const Text("공간 제한 : "),
                          Expanded(
                            child: TextFormField(
                              initialValue: question.memoryLimit,
                              onSaved: (newValue) {
                                if (!newValue!.contains("MB")) {
                                  newValue = "$newValue MB";
                                }
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children:
                            tags.map((e) => QuestionTag(tagName: e)).toList(),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        initialValue: tagString.value,
                        onChanged: (value) {
                          tagString.value = value;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF89D3FB),
                  ),
                  child: const Text(
                    '수정하기',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('취소'),
                ),
              ],
            )
          ],
        ),
      );
    }
  }
}
