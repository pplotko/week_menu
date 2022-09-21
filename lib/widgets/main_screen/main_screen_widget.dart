import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../provider/main_tabs_provider.dart';
import '../app_bar/app_bar_widget.dart';
import '../days_list/days_list_widget.dart';
import '../recipe.dart';
import '../recipes_list/recipes_list_widget.dart';
import '../settings_widget/settings_widget.dart';

class MainScreenWidget extends StatefulWidget {
  // GlobalKey<MainScreenWidgetState> myNavigationKey = GlobalKey();
  final List<Recipe> recipes;

  const MainScreenWidget({Key? key, required this.recipes}) : super(key: key);

  @override
  MainScreenWidgetState createState() => MainScreenWidgetState();
}

class MainScreenWidgetState extends State<MainScreenWidget> {
  // int _selectedIndex = 0;
  // final List<Recipe> recipes;
  // MainScreenWidgetState(this.recipes);

  String dataTimeToday() {
    String dataDayNow = "0";
    String dataMonthNow = "0";
    dataDayNow = DateTime.now().day.toInt() < 10
        ? '0${DateTime.now().day}'
        : dataDayNow = DateTime.now()
            .day
            .toString(); // Это если через тернарный оператор писать
    dataMonthNow = DateTime.now().month.toInt() < 10
        ? '0${DateTime.now().month}'
        : dataDayNow = DateTime.now().month.toString();
    final String dateNow = '$dataDayNow.$dataMonthNow.${DateTime.now().year}';
    return (dateNow);
  }

  @override
  Widget build(BuildContext context) {
    final List<Recipe> recipes = widget.recipes;
    final String dataToday = dataTimeToday();
    return
        // ChangeNotifierProvider(
        //   // create: (context) => MainTabsProvider(),
        //   // child:
      Builder(builder: (context) {
        final selectedIndex = context.watch<MainTabsProvider>().currentTableIndex;
        final mainTabsProvider = context.watch<MainTabsProvider>();
        print("mainTabsProvider = $mainTabsProvider");
        return Scaffold(
          appBar: MyCustomAppBar(
          // titel: DateFormat.yMMMd().format(DateTime.now()),
            titel: dataToday,
            isBackPath: false,
            path: '/main',
          ),
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: IndexedStack(
              index: selectedIndex,
              // sizing: StackFit.expand,
              children: [
                DaysListWidget(recipes: recipes),
                RecipesListWidget(recipes: recipes),
                const SettingsWidget(),
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
            currentIndex: selectedIndex,
            onTap: (int index) {
              print('Index = $index');
              mainTabsProvider.onItemTapped(index);
            },
          ),
        );
      });
  }
}
