import 'package:flutter/material.dart';

import '../week_days.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  Widget bl = buildList();
  List<Widget> _widgetOptions = <Widget>[
    buildList(),
    Text('Index 0: Недельное меню',
      style: optionStyle,
    ),
    Text('Index 1: Рецепты',
      style: optionStyle,
    ),
    Text('Index 2: Настройки',
      style: optionStyle,
    ),
  ];

  static Widget buildList() {
    return ListView.builder(
      itemCount: Day.week.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Text('Detail page');
            },),
            );
          },
          child: buildDayCard(Day.week[index]),
        );
      },
    );
  }
  static Widget buildDayCard(Day day) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0)),
      child: Padding( padding: const EdgeInsets.all(16.0),
        child: Column( children: <Widget>[ /*Text(day.id.toString()),
          const SizedBox( height: 14.0, ),*/
          Text( day.label, style: const TextStyle( fontSize: 20.0, fontWeight: FontWeight.w700, fontFamily: 'Palatino', ), )
        ], ), ),
    );
  }

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('WeekMenu'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
        bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: color
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
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.school),
          //   label: 'Чт',
          // ),
        ],
        currentIndex: _selectedIndex,

        onTap: _onItemTapped,
      ),
    );
  }
}
