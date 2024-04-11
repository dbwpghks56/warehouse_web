import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse_web/src/model/question.dart';

part 'question_list.freezed.dart';
part 'question_list.g.dart';

@freezed
class QuestionList with _$QuestionList {
  factory QuestionList({
    required int total,
    required int perPage,
    required int currentPage,
    required List<Question> questions,
  }) = _QuestionList;

  factory QuestionList.fromJson(Map<String, dynamic> json) =>
      _$QuestionListFromJson(json);
}
