import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testebloc/entitie/post.dart';

class PostApiRepository {
  static Future<List<Post>> getPost() async {
    List<Post> lista = [];

    var url = Uri.https("jsonplaceholder.typicode.com", "/posts");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      for (var json in jsonData) {
        Post resultList = Post.fromJson(json);
        lista.add(resultList);
      }
    } else {
      return lista;
    }
    return lista;
  }
}
