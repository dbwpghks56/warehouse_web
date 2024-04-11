// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionListImpl _$$QuestionListImplFromJson(Map<String, dynamic> json) =>
    _$QuestionListImpl(
      total: json['total'] as int,
      perPage: json['perPage'] as int,
      currentPage: json['currentPage'] as int,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QuestionListImplToJson(_$QuestionListImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'perPage': instance.perPage,
      'currentPage': instance.currentPage,
      'questions': instance.questions,
    };
