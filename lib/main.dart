import 'package:flutter/material.dart';
import 'package:json_placeholder_app/widgets/main_screen/main_screen_widget.dart';
import 'Theme/app_colors.dart';
// import 'pages/home_page.dart';
// import 'pages/pony_list_page.dart';
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
            backgroundColor: AppColors.mainDarkBlue,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainDarkBlue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,

        ),
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => AuthWidget(),
        '/main': (context) => MainScreenWidget(),
      },
      // home: AuthWidget(),
      initialRoute: '/',
      // Add error page if we received wrong page address
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(builder: (context) {
          return Container(
            height: 20,
            child:
              Center(
                child: Text('Page no found!',
                  style: TextStyle(color: Colors.red, fontSize: 20 ),
                ),
              ),
          );
        });
      },
      // PonyListPage(),
    );
  }
}


