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
      final titleString = useState(question.title);
      final timeString = useState(question.timeLimit);
      final memoryString = useState(question.memoryLimit);

      final List<String> tags = tagString.value.split(',');
      tags.removeWhere((element) => element.isEmpty || element == " ");

      final updateFlag = useState(false);
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
                        initialValue: titleString.value,
                        autofocus: true,
                        autovalidateMode: AutovalidateMode.always,
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                        onSaved: (newValue) {
                          titleString.value = newValue!;
                        },
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
                              initialValue: timeString.value,
                              autovalidateMode: AutovalidateMode.always,
                              onSaved: (newValue) {
                                if (!newValue!.contains("초")) {
                                  newValue = "$newValue 초";
                                }

                                timeString.value = newValue;
                              },
                              validator: (value) {
                                if (!value!.contains("초")) {
                                  return "뒤에 초 단위를 붙여주세요.";
                                }
                                return null;
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
                              initialValue: memoryString.value,
                              autovalidateMode: AutovalidateMode.always,
                              onSaved: (newValue) {
                                if (!newValue!.contains("MB")) {
                                  newValue = "$newValue MB";

                                  memoryString.value = newValue;
                                }
                              },
                              validator: (value) {
                                if (!value!.contains("MB")) {
                                  return "뒤에 MB 단위를 붙여주세요.";
                                }
                                return null;
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
                        onSaved: (newValue) {
                          tagString.value = newValue!;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      print(question.id);
                      print(titleString.value);
                      print(rankIndex.value);
                      print(timeString.value);
                      print(memoryString.value);
                      print(tagString.value);
                    }
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
