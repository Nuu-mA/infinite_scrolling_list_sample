import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scrolling_list_sample/data/model/issue.dart';

part 'issue_list_state.freezed.dart';

@freezed
class IssueListState with _$IssueListState {
  const factory IssueListState({
    @Default(1) int page,
    @Default(true) bool hasMore,
    @Default([]) List<Issue> issues,
  }) = _IssueListState;
}
