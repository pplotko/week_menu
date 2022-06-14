import 'package:flutter/material.dart';
import 'Theme/app_colors.dart';
import 'widgets/auth/auth_widget.dart';
import 'widgets/main_screen/main_screen_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeekMenu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.mainGreenDark,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainGreenDark,
          selectedItemColor: AppColors.selectedColor,
          unselectedItemColor: AppColors.unselectedGrey,
        ),
        primarySwatch: Colors.green,
        fontFamily: 'Raleway',
      ),

      routes: {
        '/': (context) => const AuthWidget(),
        '/main': (context) => const MainScreenWidget(),
      },
      // home: AuthWidget(),
      initialRoute: '/',
      // Add error page if we received wrong page address
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(builder: (context) {
          return const SizedBox(
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
    );
  }
}


