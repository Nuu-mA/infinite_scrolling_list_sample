import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scrolling_list_sample/data/model/issue.dart';
import 'package:infinite_scrolling_list_sample/ui/viewmodel/issue_list_state.dart';
import 'package:infinite_scrolling_list_sample/ui/viewmodel/issue_list_viewmodel.dart';

class IssueListScreenPage extends ConsumerWidget {
  const IssueListScreenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<IssueListState>>(issueListViewModelProvider, (previous, next) {
      if (next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Issueの取得に失敗しました'),
          ),
        );
      }
    });
    final issueListState = ref.watch(issueListViewModelProvider);
    final issues = issueListState.maybeWhen(
      data: (issuesState) => issuesState.issues,
      orElse: () => issueListState.valueOrNull?.issues ?? [],
    );
    // リストで描画に使うWidgetの配列
    List<Widget> listItems = [
      ...issues.map(
        (issue) => IssueItem(issue: issue),
      ),
      // ローディング中はインジケータを表示
      if (issueListState.maybeWhen(loading: () => true, orElse: () => false))
        const Center(
          child: CircularProgressIndicator(),
        ),
    ];
    final scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Issues'),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollNotification) {
          if (scrollNotification is ScrollEndNotification) {
            final metrics = scrollNotification.metrics;
            if (metrics.extentAfter == 0) {
              ref.read(issueListViewModelProvider.notifier).fetchMoreIssues();
            }
            return true;
          }
          return false;
        },
        child: Scrollbar(
          controller: scrollController,
          thumbVisibility: true,
          child: ListView(
            controller: scrollController,
            children: listItems,
          ),
        ),
      ),
    );
  }
}

class IssueItem extends StatelessWidget {
  const IssueItem({required this.issue, super.key});
  final Issue issue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        ListTile(
          title: Text(issue.title),
          subtitle: Text(
            'created_at : ${issue.created_at.toLocal()}',
            softWrap: true,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
