import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warehouse_web/src/const/http_link.dart';

void main() async {
  final HttpLink httpLink = HttpLink(
    HTTP_LINK,
  );

  final AuthLink authLink = AuthLink(
    getToken: () => "",
  );

  final Link link = authLink.concat(httpLink);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    ),
  );

  runApp(
    ProviderScope(
      child: GraphQLProvider(
        client: client,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: Text(
            "Hello World",
          ),
        ),
      ),
    );
  }
}
