import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:warehouse_web/src/model/question_list.dart';
import 'package:warehouse_web/src/service/query.dart';
import 'package:warehouse_web/src/view/question/question_view.dart';
import 'package:warehouse_web/util/qusetion_search.dart';

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
    final result = getQuestionList.result;

    useEffect(() {
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
                      hintText: 'Search using tags',
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
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      getQuestionList.fetchMore(morefetchOption(
                        varialbeData: variableData.value,
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: const Icon(Icons.search),
                    ),
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
                  : QuestionView(
                      questionList:
                          QuestionList.fromJson(result.data!["questionList"]),
                      getQuestionList: getQuestionList,
                    )
        ],
      ),
    );
  }
}
