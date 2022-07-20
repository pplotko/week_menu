import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:week_menu/presentation/bloc/week_recipes/week_recipes_bloc.dart';
import 'package:week_menu/provider/main_tabs_provider.dart';
import 'package:week_menu/widgets/load_recipes/load_recipes_widget.dart';
import 'package:week_menu/widgets/recipes_list_page/recipes_list_page_widget.dart';
import 'Theme/app_colors.dart';
import 'app_bloc_observer.dart';
import 'widgets/auth/auth_widget.dart';
import 'widgets/main_screen/main_screen_widget.dart';
import 'widgets/recipe.dart';

// GlobalKey<MainScreenWidgetState> _myNavigationKey = GlobalKey();
UniqueKey _myNavigationKey = UniqueKey();

void main() {
  BlocOverrides.runZoned(
        () => runApp(MyApp()),
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  // GlobalKey<MainScreenWidgetState> _myNavigationKey;
  MyApp({Key? key}) : super(key: key);
  final recipes = LoadRecipes();

  @override
  Widget build(BuildContext context) {
    List<Recipe> recepts1, recepts2, recepts3 = <Recipe> [];
    Recipe recept1, recept2, recept3;

    recepts1 = recipes.where((element) =>  [0].contains(element.id)).toList();
    recept1 = recepts1[0];
    recepts2 = recipes.where((element) =>  [1].contains(element.id)).toList();
    recept2 = recepts2[0];
    recepts3 = recipes.where((element) =>  [2].contains(element.id)).toList();
    recept3 = recepts3[0];
    List<Recipe> listRecipies1 = [recept1, recept2, recept2];
    List<Recipe> listRecipies2 = [recept2];
    List<Recipe> listRecipies3 = [recept3];
    // Recipe recept1 = recipes.where((Recipe recipe) {
    //   return recipe.id.contains('0');
    // }) as Recipe;
    // 'Завтрак' : [recipes.where((element) => [1].contains(element.id)),],
    DayRecipes firstDay, secondDay, thirdDay, fourthDay, fifthDay, sixthDay, nullDay;
    nullDay = DayRecipes(dayRecipes:{
      'Завтрак' : [],
      'Обед' : [],
      'Ужин' : [],
    }) ;
    firstDay = DayRecipes(dayRecipes:{
      'Завтрак' : [],
      'Обед' : [],
      'Ужин' : [],
    }) ;
    secondDay = DayRecipes(dayRecipes:{
      'Завтрак' : [],
      'Обед' : [],
      'Ужин' : [],
    }) ;
    thirdDay = DayRecipes(dayRecipes:{
      'Завтрак' : [],
      'Обед' : [],
      'Ужин' : [],
    }) ;
    fourthDay = DayRecipes(dayRecipes:{
      'Завтрак' : [],
      'Обед' : [],
      'Ужин' : [],
    }) ;
    fifthDay = DayRecipes(dayRecipes:{
      'Завтрак' : [],
      'Обед' : [],
      'Ужин' : [],
    }) ;
    sixthDay = DayRecipes(dayRecipes:{
      'Завтрак' : [],
      'Обед' : [],
      'Ужин' : [],
    }) ;

    List<DayRecipes> weekRecipesList = [nullDay, firstDay, secondDay, thirdDay, fourthDay, fifthDay, sixthDay];
    WeekRecipes weekRecipes = WeekRecipes(weekRecipes: weekRecipesList);

    return ChangeNotifierProvider(
        create: (context) => MainTabsProvider(),
        child:
        // Builder (builder: (context) {
          BlocProvider(
            create: (BuildContext context) {
              MainTabsProvider mainTabProvider =  context.read<MainTabsProvider>();
              return WeekRecipesBloc(weekRecipes, mainTabProvider);
            },
            child: MaterialApp(
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
                '/main': (context) => MainScreenWidget(key: _myNavigationKey, recipes: recipes),
                '/recipes_list_page_widget': (context) => RecipesListPageWidget(key: _myNavigationKey, recipes: recipes),
              },
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
            ),
        )
        // }),
    );
  }
}


