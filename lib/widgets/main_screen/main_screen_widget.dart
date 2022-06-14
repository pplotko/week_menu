import 'package:flutter/material.dart';

import '../days_list/days_list_widget.dart';
import '../recipe_list/recipe_list_widget.dart';
import '../settings_widget/settings_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Raleway',);

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    setState(() {
      _selectedIndex = index;
    });
  }

  dataTimeToday () {
    String dataDayNow = "0";
    String dataMonthNow = "0";
    dataDayNow = DateTime.now().day.toInt()<10? '0${DateTime.now().day}'
        : dataDayNow = DateTime.now().day.toString(); // Это если через тернарный оператор писать
    dataMonthNow = DateTime.now().month.toInt()<10? '0${DateTime.now().month}'
        : dataDayNow = DateTime.now().month.toString();
    final String dateNow = '$dataDayNow.$dataMonthNow.${DateTime.now().year}';
    return(dateNow);
  }

  @override
  Widget build(BuildContext context) {
    final String dataToday = dataTimeToday();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('WeekMenu     Today: $dataToday'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: IndexedStack(
          index: _selectedIndex,
          // sizing: StackFit.expand,
          children: const [
            DaysListWidget(),
            RecipeListWidget(),
            SettingsWidget(),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Недельное меню',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Рецепты',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Настройки',
          ),
        ],
        currentIndex: _selectedIndex,

        onTap: _onItemTapped,
      ),
    );
  }
}
