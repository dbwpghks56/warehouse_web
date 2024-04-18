import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart';
import 'package:warehouse_web/src/service/mutation.dart';
import 'package:warehouse_web/src/view/toast/toast.dart';

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

    final loadingFlag = useState(false);

    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(12),
        width: 200,
        height: 200,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: -10,
              right: 0,
              child: IconButton(
                onPressed: () {
                  if (!loadingFlag.value) {
                    Navigator.pop(context);
                  } else {
                    Toast.show(
                      "파일 업로드 중입니다. 잠시만 기다려주세요.",
                      duration: const Duration(seconds: 1),
                    );
                  }
                },
                icon: const Icon(Icons.close),
                color: Colors.black,
              ),
            ),
            Column(
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

                        if (file.extension == "xlsx" ||
                            file.extension == "xls") {
                          // 업로드 로직
                          myFile.value = MultipartFile.fromBytes(
                            'file',
                            file.bytes!,
                            filename: file.name,
                          );
                          loadingFlag.value = true;
                          final QueryResult<Object?>? mutationResult =
                              await uploadMutation.runMutation(
                            {
                              'excelInput': myFile.value,
                            },
                          ).networkResult;

                          Toast.show(
                            mutationResult
                                ?.data?["uploadExcelAndSaveQuestions"],
                            duration: const Duration(seconds: 2),
                          );
                        } else {
                          // 엑셀 파일이 아닌 경우
                        }
                      } else {
                        // User canceled
                      }
                      loadingFlag.value = false;
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
          ],
        ),
      ),
    );
  }
}
