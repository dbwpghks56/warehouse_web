import 'package:flutter/material.dart';
import 'package:warehouse_web/src/view/base_view.dart';
import 'package:warehouse_web/src/view/question/widget/question_upload_dialog.dart';

class RootView extends StatelessWidget {
  const RootView({super.key});

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
                bottom: 110, // 원하는 위치로 조정
                right: 20, // 원하는 위치로 조정
                child: FloatingActionButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
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
