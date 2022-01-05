import 'package:flutter/cupertino.dart';
import 'package:json_placeholder_app/domain/api_clients/api_client.dart';
import 'package:json_placeholder_app/domain/entity/post.dart';

class ExampleWidgetModel extends ChangeNotifier{
  final apiClient = ApiClient();
  var _posts = <Post> [];
  List<Post> get posts => List.unmodifiable(_posts);

  Future<void> reloadPosts() async{
    final posts = await apiClient.getPosts();
    _posts += posts;
    notifyListeners();
  }

  Future<void> createPosts() async{
    final posts = await apiClient.createPost(
        title: 'Pasha',
        body: 'good boy',
    );
  }
}

class ExampleModelProvider extends InheritedNotifier {
  final ExampleWidgetModel model;
  const ExampleModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
      key: key,
      notifier: model,
      child: child
    );

  static ExampleModelProvider? watch(BuildContext context) {
    // final ExampleModelProvider? result = context.dependOnInheritedWidgetOfExactType<ExampleModelProvider>();
    // assert(result != null, 'No ExampleModelProvider found in context');
    return context.dependOnInheritedWidgetOfExactType<ExampleModelProvider>();
  }

  static ExampleModelProvider? read(BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType<ExampleModelProvider>()?.widget;
    return widget is ExampleModelProvider ? widget : null;
  }

  // @override
  // bool updateShouldNotify(ExampleModelProvider old) {
  //   return true;
  // }
}
