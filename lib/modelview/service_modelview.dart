import 'dart:convert';
import 'package:fluttertuto/models/post.dart';
import 'package:http/http.dart' as http;



class ServiceMV {


  Future<List<Post>?> fetchPosts() async {
    List<Post>? posts;
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    // if (response.statusCode == 200) {s
      final List<dynamic> data = json.decode(response.body);

        posts = data.map((json) => Post.fromJson(json)).toList();


        return posts;

    // } else {
    //   throw Exception('Failed to load posts');
    // }
  }

}