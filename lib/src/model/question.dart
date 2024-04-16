import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Question with _$Question {
  factory Question({
    required int id,
    required String title,
    required String content,
    required int problemId,
    required String? tag,
    required double? timeLimit,
    required double? memoryLimit,
    required int? level,
    required double? averageTries,
    required int? totalTries,
    required int? totalPerson,
    required double? successRate,
    required int? totalSuccess,
    required String? source,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}
