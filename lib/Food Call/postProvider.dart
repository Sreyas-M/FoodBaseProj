import 'dart:convert';

import 'package:apicall/Food%20Call/postModal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Post extends ChangeNotifier {
  Future<List<PostModal>> postFun() async {
    Response response =
        await get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<PostModal> pplist = body.map((e) => PostModal.fromJson(e)).toList();
      return pplist;
    } else {
      throw "error";
    }

  }
}
