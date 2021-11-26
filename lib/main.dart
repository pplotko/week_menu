import 'package:flutter/material.dart';
import 'package:json_placeholder_app/widgets/main_screen/main_screen_widget.dart';
import 'pages/home_page.dart';
import 'pages/pony_list_page.dart';
import 'package:json_placeholder_app/widgets/auth/auth_widget.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Json Placeholder App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor: const Color.fromRGBO(3, 37, 65, 1)
        ),
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => AuthWidget(),
        '/main': (context) => MainScreenWidget(),
      },
      // home: AuthWidget(),
      initialRoute: '/',
      // PonyListPage(),
    );
  }
}

