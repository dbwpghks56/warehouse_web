import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Question with _$Question {
  factory Question({
    required int id,
    required String title,
    required String content,
    required String tag,
    required double time_limit,
    required double memory_limit,
    required int level,
    required double average_tries,
    required int total_tries,
    required int total_person,
    required double success_rate,
    required int total_success,
    required String source,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}
