import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scrolling_list_sample/ui/viewmodel/issue_list_viewmodel.dart';

class IssueListScreenPage extends ConsumerWidget {
  const IssueListScreenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final issueListState = ref.watch(issueListViewModelProvider);
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
          child: issueListState.when(
            data: (issuesState) {
              return Scrollbar(
                controller: scrollController,
                thumbVisibility: true,
                child: ListView.builder(
                  shrinkWrap: true,
                  controller: scrollController,
                  itemCount: issuesState.issues.length,
                  itemBuilder: (context, index) {
                    final issue = issuesState.issues[index];
                    return Column(
                      children: [
                        const Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        Row(
                          children: [
                            const Gap(4),
                            Text(index.toString()),
                            const Gap(4),
                            Expanded(
                              child: ListTile(
                                title: Text(issue.title),
                                subtitle: Text(
                                  'created_at : ${issue.created_at.toLocal()}',
                                  softWrap: true,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
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
          )),
    );
  }
}
