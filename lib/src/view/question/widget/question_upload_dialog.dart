import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart';
import 'package:warehouse_web/src/service/mutation.dart';

class QuestionUploadDialog extends HookWidget {
  const QuestionUploadDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final uploadMutation = useMutation(
      MutationOptions(
        document: gql(Mutations.uploadExcelAndSaveQuestions),
        update: (cache, result) {
          return cache;
        },
      ),
    );

    final myFile = useState<MultipartFile>(MultipartFile.fromBytes(
      'file',
      [],
      filename: "null",
    ));

    final flag = useState(true);

    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(12),
        width: 200,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "※ 문제 업로드 페이지 \n ( Excel 파일만 업로드 가능합니다. 양식에 맞춘 Excel 파일을 업로드 해주세요. )",
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();

                  if (result != null) {
                    PlatformFile file = result.files.first;

                    if (file.extension == "xlsx" || file.extension == "xls") {
                      // 업로드 로직
                      myFile.value = MultipartFile.fromBytes(
                        'file',
                        file.bytes!,
                        filename: file.name,
                      );

                      final QueryResult<Object?>? mutationResult =
                          await uploadMutation.runMutation(
                        {
                          'excelInput': myFile.value,
                        },
                      ).networkResult;

                      print(
                          mutationResult?.data?["uploadExcelAndSaveQuestions"]);
                    } else {
                      // 엑셀 파일이 아닌 경우
                    }
                  } else {
                    // User canceled
                  }

                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white70,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFF89D3FB),
                  ),
                  child: const Text(
                    "파일 업로드",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
