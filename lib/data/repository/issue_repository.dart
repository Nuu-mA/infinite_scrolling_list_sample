import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scrolling_list_sample/data/model/issue.dart';
import 'package:http/http.dart' as http;

final issueRepositoryProvider = Provider((ref) => IssueRepository(token: 'YOUR_GITHUB_TOKEN'));

class IssueRepository {
  final String _token;

  IssueRepository({required String token}) : _token = token;

  Future<List<Issue>> fetchIssues(int page) async {
    final response = await http.get(
      Uri.parse('https://api.github.com/repos/flutter/flutter/issues?page=$page&per_page=20'),
      headers: {
        'Authorization': 'Bearer $_token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Issue.fromJson(json)).toList();
    } else {
      throw Exception('Issueの取得に失敗しました');
    }
  }
}
