import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task1/Models/Image.dart';

class ImageProvider with ChangeNotifier {
  List<ImageUrl> _imageList = [];

  get imageList {
    return [..._imageList];
  }

  Future<void> fetchImageList() async {
    List<ImageUrl> images = [];
    try {
      final response =
          await http.get('https://jsonplaceholder.typicode.com/photos');
      final fetchData = json.decode(response.body) as List;
      print(fetchData);
      if (response.statusCode == 200) {
        fetchData.forEach((element) {
          images.add(
            ImageUrl(
              id: element["id"],
              title: element["title"],
              url: element["url"],
            ),
          );
        });
      }
      _imageList = images;
      notifyListeners();
    } catch (ex) {
      print(ex);
      throw ex;
    }
  }
}
