import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warehouse_web/src/const/http_link.dart';
import 'package:warehouse_web/src/service/query.dart';

void main() {
  runApp(
    ProviderScope(
      child: GraphQLProvider(
        client: client,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends HookWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final getQuestionList = useQuery(
      QueryOptions(
        document: gql(Queries.questionList),
        variables: const {},
        pollInterval: const Duration(seconds: 100),
      ),
    );

    final result = getQuestionList.result;

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Center(
          child: result.isLoading
              ? const CircularProgressIndicator()
              : result.hasException
                  ? Text(result.exception.toString())
                  : ListView.builder(
                      itemCount:
                          result.data!['questionList']['questions'].length,
                      itemBuilder: (context, index) {
                        final question =
                            result.data!['questionList']['questions'][index];
                        return ListTile(
                          title: Text(question['title']),
                          subtitle: Text(question['content']),
                        );
                      },
                    ),
        ),
      ),
    );
  }
}
