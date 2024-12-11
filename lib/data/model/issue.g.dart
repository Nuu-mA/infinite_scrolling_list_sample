// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IssueImpl _$$IssueImplFromJson(Map<String, dynamic> json) => _$IssueImpl(
      title: json['title'] as String,
      created_at: DateTime.parse(json['created_at'] as String),
      state: json['state'] as String,
    );

Map<String, dynamic> _$$IssueImplToJson(_$IssueImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'created_at': instance.created_at.toIso8601String(),
      'state': instance.state,
    };
