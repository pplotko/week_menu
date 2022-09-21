import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week_menu/resources/resources.dart';

import '../../Theme/app_colors.dart';
import '../../presentation/bloc/week_recipes/week_recipes_bloc.dart';
import '../../presentation/bloc/week_recipes/week_recipes_state.dart';
import '../../provider/main_tabs_provider.dart';
import '../recipe.dart';
import 'image_chose_widget.dart';
import 'meel_time_menu_widget.dart';

class DaysListWidget extends StatefulWidget {
  final List<Recipe> recipes;

  const DaysListWidget({Key? key, required this.recipes}) : super(key: key);

  @override
  State<DaysListWidget> createState() => _DaysListWidgetState(this.recipes);
}

class _DaysListWidgetState extends State<DaysListWidget> {
  var dayListState = List.filled(7, 0);
  List<String> daysNames = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];
  List<String> mealTime = ['Завтрак', 'Обед', 'Ужин', 'Добавить приём пищи'];
  List<Recipe> recipes;

  _DaysListWidgetState(this.recipes);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MainTabsProvider ctxMainTabProvider = context.watch<MainTabsProvider>();
    final currentDayIndex = ctxMainTabProvider.currentDayIndex;
    final currentMeelIndex = ctxMainTabProvider.currentMeelIndex;
    return BlocBuilder<WeekRecipesBloc, WeekRecipesState>(
        builder: (BuildContext context, state) {
      if (state is WeekRecipesLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is WeekRecipesLoadedState) {
        double radiusController =
            ctxMainTabProvider.currentDayIndex == 0 ? 0 : 5;
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                AppColors.mainLightGreen,
                AppColors.foregroundLightGreen
              ],
            ),
          ),
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.topLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 0, 8),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 192,
                  width: 56,
                  child: ListView.builder(
                      itemCount: 7,
                      // itemExtent: 7,
                      itemBuilder: (BuildContext context, int index) {
                        if (currentDayIndex == index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Container(
                              height: 64,
                              width: 64,
                              padding: const EdgeInsets.only(
                                left: 4,
                                right: 4,
                                top: 8,
                                bottom: 8,
                              ),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(0),
                                ),
                                // color: AppColors.foregroundLightGreen,
                                color: Colors.white,
                              ),
                              child: SizedBox(
                                height: 48,
                                width: 48,
                                child: Container(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 12),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(24),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Text(
                                    daysNames[index],
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                        color: AppColors
                                            .mainGreenMoreDark), /*textAlign: TextAlign.center,*/
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Padding(
                            padding:
                                const EdgeInsets.only(bottom: 16, right: 8),
                            child: SizedBox(
                              height: 48,
                              width: 48,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      AppColors.foregroundLightGreen),
                                  foregroundColor: MaterialStateProperty.all(
                                      AppColors.mainGreenMoreDark),
                                  textStyle: MaterialStateProperty.all(
                                    const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight
                                          .w500, /*letterSpacing: -0.6,*/
                                    ),
                                  ),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.only(left: 2)),
                                  alignment: Alignment.center,
                                ),
                                onPressed: () => setState(() {
                                  ctxMainTabProvider.currentDayIndex = index;
                                  // context.read<MainTabsProvider>().currentDayIndex = index;
                                }),
                                child: Text(
                                  daysNames[
                                      index], /*textAlign: TextAlign.center,*/
                                ),
                              ),
                            ),
                          );
                        }
                      }),
                ),
              ), //DaysNames
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 13.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // border: Border.all(color: Colors.black.withOpacity(0.2)),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(radiusController),
                      topRight: const Radius.circular(5),
                      bottomLeft: const Radius.circular(5),
                      bottomRight: const Radius.circular(5),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 8,
                        width: MediaQuery.of(context).size.width - 88,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height - 205, //184
                        width: MediaQuery.of(context).size.width - 88,
                        child: ListView.builder(
                            itemCount: //Тут задаю цикл по количеству приёмов пищи в этот день
                                state.weekRecipes.weekRecipes[currentDayIndex]
                                        .dayRecipes.length +
                                    1,
                            itemBuilder: (BuildContext context, int index) {
                              // for(var item in state.weekRecipes.weekRecipes[dayController].dayRecipes.entries){
                              //   // item представляет MapEntry<K, V>
                              //   print("${item.key} - ${item.value}");
                              // }

                              if (index ==
                                  state
                                      .weekRecipes
                                      .weekRecipes[currentDayIndex]
                                      .dayRecipes
                                      .length) // Показать кнопку 'Добавить приём пищи'
                              {
                                return Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: SizedBox(
                                    height: 24,
                                    width:
                                        MediaQuery.of(context).size.width - 80,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                AppColors.unselectedGrey),
                                        textStyle: MaterialStateProperty.all(
                                          const TextStyle(
                                            fontSize: 12,
                                            // fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        mealTime[index],
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                );
                                // }
                              } else {
                                // Показать карточки: завтрак, обед...

                                DayRecipes dayRecipes = state
                                    .weekRecipes.weekRecipes[currentDayIndex];
                                print(
                                    'state.weekRecipes.weekRecipes[$currentDayIndex].= ${state.weekRecipes.weekRecipes[currentDayIndex]}');
                                print(
                                    'dayControllerFirst = currentDayIndex = $currentDayIndex');

                                List<Recipe>? listRecipies =
                                    dayRecipes.dayRecipes[mealTime[index]];
                                print(
                                    'listRecipies = ${listRecipies.toString()}');
                                String imageNameInList;
                                if (listRecipies == null ||
                                    listRecipies.isEmpty) {
                                  imageNameInList =
                                      AppImages.kotletiKlassicheskie2480300x233;
                                } else {
                                  imageNameInList =
                                      listRecipies[0].imageName[0];
                                }

                                return Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 8, 8),
                                  child: Container(
                                    // height: 48,
                                    width:
                                        MediaQuery.of(context).size.width - 72,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.black.withOpacity(0.2)),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 8,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          16, 24, 8, 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                mealTime[index],
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors
                                                        .mainGreenMoreDark
                                                    /*letterSpacing: -0.6,*/
                                                    ),
                                                // textAlign: TextAlign.center,
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    248,
                                                child: MealTimeMenuWidget( // menu of dishes for each meal in the card of the day
                                                    key: UniqueKey(),
                                                    mealTimeRecipiesList:
                                                        listRecipies!,
                                                    dayController:
                                                        currentDayIndex,
                                                    meelTime: mealTime[index]),
                                              ),
                                              // const SizedBox(height: 8,),
                                            ],
                                          ),
                                          ImageChoseWidget(
                                              key: UniqueKey(),
                                              mealTimeRecipiesList:
                                                  listRecipies,
                                              recipies: recipes,
                                              meelTime: mealTime[index]),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                            }),
                      ),
                      // SizedBox(// Показать кнопку 'Добавить приём пищи' под скролом
                      //   height: 40,
                      //   width: MediaQuery.of(context).size.width-88,
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8),
                      //     child: SizedBox(
                      //       height: 24,
                      //       width: MediaQuery.of(context).size.width-80,
                      //       child: ElevatedButton(
                      //         style: ButtonStyle(
                      //           backgroundColor: MaterialStateProperty.all(
                      //           Colors.white),
                      //           foregroundColor: MaterialStateProperty.all(
                      //           AppColors.unselectedGrey),
                      //           textStyle: MaterialStateProperty.all(
                      //         const TextStyle(fontSize: 12, // fontWeight: FontWeight.w600,
                      //         ),
                      //       ),
                      //       ),
                      //       onPressed: () {},
                      //         child: const Text('Добавить приём пищи', //mealTime[3],
                      //         textAlign: TextAlign.center,),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
      if (state is WeekRecipesEmptyState) {
        return const Center(
          child: Text('LogEmptyState', style: TextStyle(fontSize: 30)),
        );
      }
      return const Center(
        child: Text('Что-то не работает', style: TextStyle(fontSize: 30)),
      );
    });
  }
}

