// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionImpl(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      problemId: json['problemId'] as int,
      tag: json['tag'] as String?,
      timeLimit: (json['timeLimit'] as num?)?.toDouble(),
      memoryLimit: (json['memoryLimit'] as num?)?.toDouble(),
      level: json['level'] as int?,
      averageTries: (json['averageTries'] as num?)?.toDouble(),
      totalTries: json['totalTries'] as int?,
      totalPerson: json['totalPerson'] as int?,
      successRate: (json['successRate'] as num?)?.toDouble(),
      totalSuccess: json['totalSuccess'] as int?,
      source: json['source'] as String?,
    );

Map<String, dynamic> _$$QuestionImplToJson(_$QuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'problemId': instance.problemId,
      'tag': instance.tag,
      'timeLimit': instance.timeLimit,
      'memoryLimit': instance.memoryLimit,
      'level': instance.level,
      'averageTries': instance.averageTries,
      'totalTries': instance.totalTries,
      'totalPerson': instance.totalPerson,
      'successRate': instance.successRate,
      'totalSuccess': instance.totalSuccess,
      'source': instance.source,
    };
