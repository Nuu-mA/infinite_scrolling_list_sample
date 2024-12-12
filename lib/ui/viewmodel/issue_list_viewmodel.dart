import 'package:flutter/material.dart';
import 'package:infinite_scrolling_list_sample/data/model/issue.dart';
import 'package:infinite_scrolling_list_sample/data/repository/issue_repository.dart';
import 'package:infinite_scrolling_list_sample/ui/viewmodel/issue_list_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'issue_list_viewmodel.g.dart';

@riverpod
class IssueListViewModel extends _$IssueListViewModel {
  IssueRepository get _repository => ref.read(issueRepositoryProvider);

  @override
  FutureOr<IssueListState> build() async {
    return IssueListState(issues: await _fetchIssues(1));
  }

  Future<List<Issue>> _fetchIssues(int page) async {
    debugPrint('fetchIssues page: $page');
    final newIssues = await _repository.fetchIssues(page);
    return newIssues;
  }

  Future<void> fetchMoreIssues() async {
    if (state.isLoading) return;
    if (state.hasValue) {
      // hasMoreがfalseの場合は何もしない
      if (!state.value!.hasMore) {
        return;
      }
      // AsyncValueをロードを中にする
      state = const AsyncLoading();
      // 3秒待機
      await Future.delayed(const Duration(seconds: 3));
      // 読み込んだIssueを末尾に追加する
      state = await AsyncValue.guard(() async {
        final newIssues = await _fetchIssues(state.value!.page + 1);
        return state.value!.copyWith(
          issues: [...state.value!.issues, ...newIssues],
          page: state.value!.page + 1,
          hasMore: newIssues.isNotEmpty,
        );
      });
    }
  }
}
