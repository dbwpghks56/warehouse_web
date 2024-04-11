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
      tag: json['tag'] as String,
      time_limit: (json['time_limit'] as num).toDouble(),
      memory_limit: (json['memory_limit'] as num).toDouble(),
      level: json['level'] as int,
      average_tries: (json['average_tries'] as num).toDouble(),
      total_tries: json['total_tries'] as int,
      total_person: json['total_person'] as int,
      success_rate: (json['success_rate'] as num).toDouble(),
      total_success: json['total_success'] as int,
      source: json['source'] as String,
    );

Map<String, dynamic> _$$QuestionImplToJson(_$QuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'tag': instance.tag,
      'time_limit': instance.time_limit,
      'memory_limit': instance.memory_limit,
      'level': instance.level,
      'average_tries': instance.average_tries,
      'total_tries': instance.total_tries,
      'total_person': instance.total_person,
      'success_rate': instance.success_rate,
      'total_success': instance.total_success,
      'source': instance.source,
    };
