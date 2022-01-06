import 'package:flutter/material.dart';
import 'package:json_placeholder_app/widgets/days_list/days_list_widget.dart';
import 'package:json_placeholder_app/widgets/recipe_list/recipe_list_widget.dart';
import 'package:json_placeholder_app/widgets/settings_widget/settings_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // Widget bl = buildList();
  // List<Widget> _widgetOptions = <Widget>[
  //   DaysListWidget(),
  //   RecipeListWidget(),
  //   Text('Index 2: Настройки',
  //     style: optionStyle,
  //   ),
  // ];

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    setState(() {
      _selectedIndex = index;
    });
  }

  dataTimeToday () {
    String dataDayNow = "0";
    String dataMonthNow = "0";

    dataDayNow = DateTime.now().day.toInt()<10? '0' + DateTime.now().day.toString()
        : dataDayNow = DateTime.now().day.toString(); // Это если через тернарный оператор писать
    dataMonthNow = DateTime.now().month.toInt()<10? '0' + DateTime.now().month.toString()
        : dataDayNow = DateTime.now().month.toString();
    // if (DateTime.now().day.toInt()<10) {
    //   dataDayNow = '0' + DateTime.now().day.toString();
    // }
    // else {
    //   dataDayNow = DateTime.now().day.toString();
    // }
    // if (DateTime.now().month.toInt()<10) {
    //   dataMonthNow = '0' + DateTime.now().month.toString();
    // }
    // else {
    //   dataMonthNow = DateTime.now().month.toString();
    // }
    final String dateNow = dataDayNow +'.' + dataMonthNow + '.' + DateTime.now().year.toString();

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
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          DaysListWidget(),
          RecipeListWidget(),
          SettingsWidget(),
          // Text('Index 2: Настройки',
          //   style: optionStyle,
          // ),
        ],
      ),
      // body: Center(
      //   child: _widgetOptions.elementAt(_selectedIndex),
      // ),
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
