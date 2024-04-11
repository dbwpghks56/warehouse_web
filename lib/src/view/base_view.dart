import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:warehouse_web/src/model/question.dart';
import 'package:warehouse_web/src/service/query.dart';
import 'package:warehouse_web/src/view/question/widget/question_tile.dart';

class BaseView extends HookWidget {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    final txtController = useTextEditingController();

    final getQuestionList = useQuery(
      QueryOptions(
        document: gql(Queries.questionList),
        variables: const {},
        pollInterval: const Duration(seconds: 100),
      ),
    );

    final result = getQuestionList.result;
    // final QuestionList questionList =
    //     QuestionList.fromJson(result.data!['questionList']);

    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: TextField(
                    controller: txtController,
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.search),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
              ],
            ),
          ),
          result.isLoading
              ? const CircularProgressIndicator()
              : result.hasException
                  ? Text(result.exception.toString())
                  : Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height - 120,
                          child: ListView.builder(
                            itemCount: result
                                .data!['questionList']['questions'].length,
                            padding: const EdgeInsets.all(10),
                            itemBuilder: (context, index) {
                              final question = result.data!['questionList']
                                  ['questions'][index];

                              Question questionData =
                                  Question.fromJson(question);

                              return QuestionTile(
                                question: questionData,
                              );
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_back),
                            ),
                            IconButton(
                              onPressed: () {
                                int pageNext = result.data!['questionList']
                                        ['currentPage'] +
                                    1;
                                getQuestionList.fetchMore(
                                  FetchMoreOptions(
                                    variables: {
                                      'page': pageNext,
                                    },
                                    updateQuery: (Map<String, dynamic>?
                                            previousResultData,
                                        Map<String, dynamic>?
                                            fetchMoreResultData) {
                                      final List<dynamic> questions = [
                                        ...previousResultData!['questionList']
                                            ['questions'],
                                        ...fetchMoreResultData!['questionList']
                                            ['questions'],
                                      ];

                                      result.data!['questionList']
                                          ['questions'] = questions;
                                      return result.data!['questionList']
                                          ['questions'];
                                    },
                                  ),
                                );
                              },
                              icon: const Icon(Icons.arrow_forward),
                            ),
                          ],
                        ),
                      ],
                    ),
        ],
      ),
    );
  }
}
