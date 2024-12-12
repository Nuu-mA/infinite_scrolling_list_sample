import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scrolling_list_sample/data/model/issue.dart';
import 'package:http/http.dart' as http;

// 環境変数から取得したGitHubのトークンを読み込む
const gitHubToken = String.fromEnvironment('GITHUB_TOKEN');

final issueRepositoryProvider = Provider((ref) => IssueRepository(token: gitHubToken));

class IssueRepository {
  final String _token;

  IssueRepository({required String token}) : _token = token;

  Future<List<Issue>> fetchIssues(int page) async {
    // 10券ずつIssueを取得する
    final response = await http.get(
      Uri.parse('https://api.github.com/repos/flutter/flutter/issues?page=$page&per_page=10'),
      headers: {
        'Authorization': 'Bearer $_token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Issue.fromJson(json)).toList();
    } else {
      throw Exception('Issueの取得に失敗しました statusCode: ${response.statusCode} body: ${response.body}');
    }
  }
}
