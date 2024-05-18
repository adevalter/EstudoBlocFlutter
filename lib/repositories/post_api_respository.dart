import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testebloc/entitie/result.dart';

class PostApiRepository {
  static Future<List<Users>> getPost() async {
    List<Users> lista = [];

    var url = Uri.https("jsonplaceholder.typicode.com", "post");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      for (var json in jsonData) {
        Users resultList = Users.fromJson(json);
        lista.add(resultList);
      }
    } else {
      return lista;
    }
    return lista;
  }
}
