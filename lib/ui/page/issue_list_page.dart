import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scrolling_list_sample/ui/viewmodel/issue_list_viewmodel.dart';

class IssueListScreenPage extends ConsumerWidget {
  IssueListScreenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final issueList = ref.watch(issueListViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Issues'),
      ),
      body: issueList.when(
        data: (issuesState) {
          return ListView.builder(
            controller: _scrollController,
            itemCount: issuesState.issues.length + (issueList.isLoading ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == issuesState.issues.length) {
                return const Center(child: CircularProgressIndicator());
              }
              final issue = issuesState.issues[index];
              return Column(
                children: [
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  ListTile(
                    title: Text(issue.title),
                    subtitle: Text('created_at : ${issue.created_at.toLocal()}'),
                  ),
                ],
              );
            },
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'エラーが発生しました',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(error.toString()),
                ElevatedButton(
                  onPressed: () => ref.read(issueListViewModelProvider.notifier).fetchMoreIssues(),
                  child: const Text('再試行'),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  final _scrollController = ScrollController();
}
