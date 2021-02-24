import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task1/Models/post.dart';
import 'package:http/http.dart' as http;

class PostProvider with ChangeNotifier {
  List<Post> _postList = [];

  get postList {
    return [..._postList];
  }

  Future<void> fetchPostList() async {
    List<Post> posts = [];
    try {
      final response =
          await http.get('https://jsonplaceholder.typicode.com/comments');
      final fetchData = json.decode(response.body) as List;
      print(fetchData);
      if (response.statusCode == 200) {
        fetchData.forEach((element) {
          posts.add(
            Post(
              id: element["id"],
              name: element["name"],
              email: element["email"],
              body: element["body"],
            ),
          );
        });
      }
      _postList = posts;
      notifyListeners();
    } catch (ex) {
      print(ex);
      throw ex;
    }
  }
}
