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
      ),
    );

    final variableData = useState<Map<String, dynamic>>({});
    final pageList = useState<List<int>>([]);
    final result = getQuestionList.result;
    final currentPage = useState(0);
    // final QuestionList questionList =
    //     QuestionList.fromJson(result.data!['questionList']);

    useEffect(() {
      int totalCount = result.data?['questionList']['total'] ?? 10;
      int perPage = result.data?['questionList']['perPage'] ?? 1;
      currentPage.value = result.data?['questionList']['currentPage'] ?? 1;
      int totalPage = (totalCount / perPage).ceil();
      pageList.value = List.generate(totalPage, (index) => index + 1);

      return null;
    }, [result]);

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
                    onChanged: (value) {
                      variableData.value["tag"] = value;
                    },
                    onSubmitted: (value) {
                      getQuestionList.fetchMore(morefetchOption(
                        varialbeData: variableData.value,
                      ));
                    },
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
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      getQuestionList.fetchMore(morefetchOption(
                        varialbeData: variableData.value,
                      ));
                    },
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
                          height: MediaQuery.of(context).size.height - 170,
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
                        SizedBox(
                          height: 100,
                          child: SingleChildScrollView(
                            // scrollDirection: Axis.horizontal,
                            child: Wrap(
                              children: pageList.value
                                  .map(
                                    (e) => GestureDetector(
                                      onTap: () {
                                        variableData.value["page"] = e;
                                        getQuestionList
                                            .fetchMore(morefetchOption(
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
                                            borderRadius:
                                                BorderRadius.circular(8),
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
                    ),
        ],
      ),
    );
  }
}

FetchMoreOptions morefetchOption({
  Map<String, dynamic>? varialbeData,
}) {
  return FetchMoreOptions(
    variables: varialbeData ?? {},
    updateQuery: (previousResultData, fetchMoreResultData) {
      return fetchMoreResultData;
    },
  );
}
