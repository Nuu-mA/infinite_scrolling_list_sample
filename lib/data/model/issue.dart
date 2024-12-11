// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'issue.freezed.dart';
part 'issue.g.dart';

@freezed
class Issue with _$Issue {
  const factory Issue({
    required String title,
    required DateTime created_at,
    required String state,
  }) = _Issue;

  const Issue._();

  factory Issue.fromJson(Map<String, dynamic> json) => _$IssueFromJson(json);
}
