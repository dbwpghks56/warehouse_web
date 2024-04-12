import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warehouse_web/src/const/http_link.dart';
import 'package:warehouse_web/src/view/base_view.dart';

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
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF89D3FB)),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: SizedBox(
            width: 900,
            child: BaseView(),
          ),
        ),
      ),
    );
  }
}
