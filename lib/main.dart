import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:week_menu/presentation/bloc/week_recipes/week_recipes_bloc.dart';
import 'package:week_menu/provider/main_tabs_provider.dart';
import 'package:week_menu/resources/resources.dart';
import 'package:week_menu/widgets/recipes_list/recipes_list_widget.dart';
import 'package:week_menu/widgets/recipes_list_page/recipes_list_page_widget.dart';
import 'Theme/app_colors.dart';
import 'app_bloc_observer.dart';
import 'presentation/bloc/week_recipes/week_recipes_state.dart';
import 'widgets/auth/auth_widget.dart';
import 'widgets/main_screen/main_screen_widget.dart';

// GlobalKey<MainScreenWidgetState> _myNavigationKey = GlobalKey();
UniqueKey _myNavigationKey = UniqueKey();

void main() {
  BlocOverrides.runZoned(
        () => runApp(MyApp()),
    blocObserver: AppBlocObserver(),
  );
}

class DayRecipes {
  late Map <String, List<Recipe>> dayRecipes;
  // = {
  //   'Завтрак': [],
  //   'Обед': [],
  //   'Ужин': [],
  // };
  DayRecipes({required this.dayRecipes});
}

class WeekRecipes {
  final List<DayRecipes> weekRecipes;
  WeekRecipes({required this.weekRecipes});
}

class MyApp extends StatelessWidget {
  // GlobalKey<MainScreenWidgetState> _myNavigationKey;


  MyApp({Key? key}) : super(key: key);
  final recipes = [
    Recipe(
      id: 0,
      imageName: [AppImages.kotletiKlassicheskie2480300x233,AppImages.plovSoSvininoi480,],
      title: 'КОТЛЕТЫ КЛАССИЧЕСКИЕ (СВИНИНА + КУРИЦА)',
      time: 'December 17, 2021',
      description: 'Готовим фарш, перекручиваем мясо (свинину и курицу) на тонкой сетке мясорубки 2 раза. Лук сразу мелко мелко шинкуем. Обжариваем (если планируем заморозку). Добавляем в фарш. Хлебный мякиш отправляем в кипяток размочиться. Выдавливаем чеснок, солим и перчим по вкусу. Добавляем в мясо хлеб, пропустив через мясорубку и тщательно все перемешиваем. Сейчас руками сформируем мясные шарики и немного приплюснем. Руки при этом мочим в холодной воде, чтобы фарш не прилипал к ним. Теперь обваляем котлеты в муке или можно использовать любую другую панировку. Сначала одну сторону обжариваем на среднем огне, потом убавляем огонь до маленького, переворачиваем котлетки и накрываем крышкой. Добавляем к котлетам воды и тушим. После доводим до готовности и готово. Котлетки готовы. Приятного аппетита!',
      imgFirstName: AppImages.kotletiKlassicheskie2480300x233,
    ),
    Recipe(
      id: 1,
      imageName: [AppImages.plovSoSvininoi480,],
      title: 'ПЛОВ СО СВИНИНОЙ',
      time: 'December 17, 2021',
      description: 'Помыть и порезать на куски свинину. В сковороду (или казан) налить масло подсолнечное. Раскалить. Нарезать лук и обжарить его в масле. Свинину посолить, поперчить, положить в масло. Обжарить на большом огне. Убавить огонь почти до минимума и тушить 10 минут. Пока готовится свинина поставьте овощной бульон. Налить воду в кастрюлю и поставить на огонь. Лук и морковь хорошо промыть (чистить от кожуры не нужно!!!, т.е. лук должен быть в кожуре). Разрезать лук, морковь и стебель сельдерея напополам и положите разрезанными сторонами на сковородку без масла. Обжарить 2-3 минуты и закинуть в бульон. Как закипит вода, убавить огонь и варить бульон на слабом огне. Бульон будет вариться на протяжении всего времени приготовления блюда, т.к. периодически нужно будет подливать бульон в рис до его полной готовности. Потереть морковь на крупной терке. Выложить сверху мяса ровным слоем и тушить еще 10 минут. Рис промыть. Добавить в него 1 чайную ложку специй для плова и 1 чайную ложку соли, перемешать. Открыть крышку и положить 2 головки чеснока не чищенные (предварительно помыв их). Сверху насыпать рис ровным слоем. Аккуратно залить рис овощным бульоном, так, чтобы вода поднялась над рисом на 5-7 мм. Накрыть сверху крышкой. Тушить 30 минут. Если видите, что бульон выкипел, а рис еще не готов, добавите еще немного бульона. Откройте крышку и аккуратно переверните рис. Выключите огонь. Дайте настояться плову еще некоторое время. Плов готов. Приятного аппетита!',
      imgFirstName: AppImages.plovSoSvininoi480,
    ),
    Recipe(
      id: 2,
      imageName: [AppImages.otbivnaya,],
      title: 'ОТБИВНАЯ ИЗ СВИНИНЫ',
      time: 'December 17, 2021',
      description: 'Порезать на куски вырезку из свинины или филе, отбить. Обмакнуть во всбитом яйце с солью и специями, а затем в муке. Жарить на сковороде с двух сторон до хрустящей корочки.',
      imgFirstName: AppImages.otbivnaya,
    ),
    Recipe(
      id: 3,
      imageName: [AppImages.kotletiKlassicheskie2480300x233,],
      title: 'КОТЛЕТЫ КЛАССИЧЕСКИЕ (СВИНИНА + КУРИЦА)',
      time: 'December 17, 2021',
      description: 'Готовим фарш, перекручиваем мясо (свинину и курицу) на тонкой сетке мясорубки 2 раза. Лук сразу мелко мелко шинкуем. Обжариваем (если планируем заморозку). Добавляем в фарш. Хлебный мякиш отправляем в кипяток размочиться. Выдавливаем чеснок, солим и перчим по вкусу. Добавляем в мясо хлеб, пропустив через мясорубку и тщательно все перемешиваем. Сейчас руками сформируем мясные шарики и немного приплюснем. Руки при этом мочим в холодной воде, чтобы фарш не прилипал к ним. Теперь обваляем котлеты в муке или можно использовать любую другую панировку. Сначала одну сторону обжариваем на среднем огне, потом убавляем огонь до маленького, переворачиваем котлетки и накрываем крышкой. Добавляем к котлетам воды и тушим. После доводим до готовности и готово. Котлетки готовы. Приятного аппетита!',
      imgFirstName: AppImages.kotletiKlassicheskie2480300x233,
    ),
    Recipe(
      id: 4,
      imageName: [AppImages.kotletiKlassicheskie2480300x233,],
      title: 'КОТЛЕТЫ КЛАССИЧЕСКИЕ (СВИНИНА + КУРИЦА)',
      time: 'December 17, 2021',
      description: 'Готовим фарш, перекручиваем мясо (свинину и курицу) на тонкой сетке мясорубки 2 раза. Лук сразу мелко мелко шинкуем. Обжариваем (если планируем заморозку). Добавляем в фарш. Хлебный мякиш отправляем в кипяток размочиться. Выдавливаем чеснок, солим и перчим по вкусу. Добавляем в мясо хлеб, пропустив через мясорубку и тщательно все перемешиваем. Сейчас руками сформируем мясные шарики и немного приплюснем. Руки при этом мочим в холодной воде, чтобы фарш не прилипал к ним. Теперь обваляем котлеты в муке или можно использовать любую другую панировку. Сначала одну сторону обжариваем на среднем огне, потом убавляем огонь до маленького, переворачиваем котлетки и накрываем крышкой. Добавляем к котлетам воды и тушим. После доводим до готовности и готово. Котлетки готовы. Приятного аппетита!',
      imgFirstName: AppImages.kotletiKlassicheskie2480300x233,
    ),
    Recipe(
      id: 5,
      imageName: [AppImages.kotletiKlassicheskie2480300x233,],
      title: 'КОТЛЕТЫ КЛАССИЧЕСКИЕ (СВИНИНА + КУРИЦА)',
      time: 'December 17, 2021',
      description: 'Готовим фарш, перекручиваем мясо (свинину и курицу) на тонкой сетке мясорубки 2 раза. Лук сразу мелко мелко шинкуем. Обжариваем (если планируем заморозку). Добавляем в фарш. Хлебный мякиш отправляем в кипяток размочиться. Выдавливаем чеснок, солим и перчим по вкусу. Добавляем в мясо хлеб, пропустив через мясорубку и тщательно все перемешиваем. Сейчас руками сформируем мясные шарики и немного приплюснем. Руки при этом мочим в холодной воде, чтобы фарш не прилипал к ним. Теперь обваляем котлеты в муке или можно использовать любую другую панировку. Сначала одну сторону обжариваем на среднем огне, потом убавляем огонь до маленького, переворачиваем котлетки и накрываем крышкой. Добавляем к котлетам воды и тушим. После доводим до готовности и готово. Котлетки готовы. Приятного аппетита!',
      imgFirstName: AppImages.kotletiKlassicheskie2480300x233,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var recepts1, recepts2, recepts3 = <Recipe> [];
    Recipe recept1;
    Recipe recept2;
    Recipe recept3;
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
    print('$recepts1');
    DayRecipes firstDay, secondDay, thirdDay, fourthDay, fifthDay, sixthDay, nullDay ;
    // DayRecipes secondDay;
    nullDay = DayRecipes(dayRecipes:{
      'Завтрак' : [],
      'Обед' : [],
      'Ужин' : [],
    }) ;
    firstDay = DayRecipes(dayRecipes:{
      'Завтрак' : listRecipies1,
      'Обед' : listRecipies2,
      'Ужин' : listRecipies3,
    }) ;
    secondDay = DayRecipes(dayRecipes:{
      'Завтрак' : listRecipies2,
      'Обед' : listRecipies2,
      'Ужин' : listRecipies3,
    }) ;
    thirdDay = DayRecipes(dayRecipes:{
      'Завтрак' : listRecipies2,
      'Обед' : listRecipies2,
      'Ужин' : listRecipies3,
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


