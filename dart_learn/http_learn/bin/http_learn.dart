import 'dart:convert';

import 'package:http_learn/http_learn.dart' as http_learn;
import 'package:http/http.dart' as http;
import 'package:http_learn/result.dart';

void main(List<String> arguments) {
  print('Hello world: ${http_learn.calculate()}!');
  sendGetRequest();
  // sendPostRequest();
}

// void sendGetRequest() async {
//   final url = Uri.parse("https://baidu.com");
//   final response = await http.get(url);
//   print('Response status:${response.statusCode}');
//   print('Response body:${response.body}');
// }

void sendGetRequest() async {
  final url = Uri.parse("https://jsonplaceholder.typicode.com/albums/1");
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final result = Result.fromJson(jsonDecode(response.body));
    print('result id:${result.toJson()}');
    // final album = Album.fromJson(jsonDecode(response.body));
    // print('album id:${album.id}, title:${album.title}, userId:${album.userId}');
  } else {
    throw Exception('Failed to load album');
  }
  // print('Response status:${response.statusCode}');
  // print('Response body:${response.body}');
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
