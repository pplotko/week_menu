import 'dart:convert';
import 'dart:io';

import 'package:json_placeholder_app/domain/entity/post.dart';

class ApiClient{
  final client = HttpClient();

  Future<List<Post>> getPosts() async{
    // final url = Uri.parse(''https://jsonplaceholder.typicode.com/posts'');
    // // Uri(scheme: 'https', host: 'jsonplaceholder.typicode.com', path: 'posts');
    // final request = await client.getUrl(url);
    // final response = await request.close();
    // final jsonStrings = await response.transform(utf8.decoder).toList();
    // final jsonString =jsonStrings.join();

    final json = await get('https://jsonplaceholder.typicode.com/posts')
      as List <dynamic>;//jsonDecode(jsonString) as List <dynamic>;
    final posts = json
        .map((dynamic e) => Post.fromJson(e as Map<String, dynamic>))
        .toList();
    return posts;
  }

  Future<Post?> createPost({required String title, required String body}) async{
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final parametrs = <String, dynamic>{
      'title' : title,
      'body' : body,
      'userId' : 109,
      'id' : 17,
    };
    final request = await client.postUrl(url);
    request.headers.set('Content-type', 'application/json; charset=UTF-8');
    request.write(jsonEncode(parametrs));
    final response = await request.close();
    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString =jsonStrings.join();
    final json = jsonDecode(jsonString) as Map<String, dynamic> ;
    final post = Post.fromJson(json);
    print(jsonString);
    return post;
  }

  Future <dynamic> get(String ulr) async{
    final url = Uri.parse(ulr);
    final request = await client.getUrl(url);
    final response = await request.close();

    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString =jsonStrings.join();
    final dynamic json = jsonDecode(jsonString) ;

    return json;
  }
}