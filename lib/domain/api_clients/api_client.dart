import 'dart:convert';
import 'dart:io';

class ApiClient{
  final client = HttpClient();

  void getPosts() async{
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    // Uri(scheme: 'https', host: 'jsonplaceholder.typicode.com', path: 'posts');
    final request = await client.getUrl(url);
    final response = await request.close();
    print(response.headers);
    final jsonString = await response.transform(utf8.decoder).toList();
    print(jsonString);
  }
}