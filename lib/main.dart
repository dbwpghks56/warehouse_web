import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warehouse_web/src/const/http_link.dart';
import 'package:warehouse_web/src/view/base_view.dart';
import 'package:warehouse_web/src/view/question/widget/question_upload_dialog.dart';

void main() {
  runApp(
    ProviderScope(
      child: GraphQLProvider(
        client: client,
        child: MaterialApp(
          title: 'WareHouse Web Test',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xFF89D3FB)),
            useMaterial3: true,
          ),
          home: const MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends HookWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 900,
          child: Stack(
            alignment: Alignment.center,
            children: [
              const BaseView(),
              Positioned(
                bottom: 60, // 원하는 위치로 조정
                right: 20, // 원하는 위치로 조정
                child: FloatingActionButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const QuestionUploadDialog();
                      },
                    );
                  },
                  hoverColor: const Color.fromARGB(255, 87, 133, 159),
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
