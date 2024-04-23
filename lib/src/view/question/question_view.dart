import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:warehouse_web/src/model/question.dart';
import 'package:warehouse_web/src/model/question_list.dart';
import 'package:warehouse_web/src/view/question/widget/question_tile.dart';
import 'package:warehouse_web/util/qusetion_search.dart';

class QuestionView extends HookWidget {
  const QuestionView({
    super.key,
    required this.questionList,
    required this.getQuestionList,
  });

  final QuestionList questionList;
  final QueryHookResult<Object?> getQuestionList;

  @override
  Widget build(BuildContext context) {
    final variableData = useState<Map<String, dynamic>>({});
    final pageList = useState<List<int>>([]);
    final currentPage = useState(0);
    final questionResult = useState<List<Question>>([]);

    useEffect(() {
      int totalCount = questionList.total;
      int perPage = questionList.perPage;
      currentPage.value = questionList.currentPage;
      int totalPage = (totalCount / perPage).ceil();
      pageList.value = List.generate(totalPage, (index) => index + 1);
      questionResult.value = questionList.questions;

      return null;
    }, [questionList]);

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height - 150,
          child: ListView.builder(
            itemCount: questionResult.value.length,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              final Question question = questionResult.value[index];

              return QuestionTile(
                question: question,
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(4),
          height: 84,
          child: SingleChildScrollView(
            physics: const PageScrollPhysics(),
            // scrollDirection: Axis.horizontal,
            child: Wrap(
              children: pageList.value
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        variableData.value["page"] = e;
                        getQuestionList.fetchMore(morefetchOption(
                          varialbeData: variableData.value,
                        ));
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          width: 40,
                          margin: const EdgeInsets.all(4),
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: currentPage.value == e
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            color: currentPage.value == e
                                ? const Color(0xFF89D3FB)
                                : Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              e.toString(),
                              style: TextStyle(
                                color: currentPage.value == e
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
