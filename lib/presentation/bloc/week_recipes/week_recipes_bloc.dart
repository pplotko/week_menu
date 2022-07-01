import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week_menu/provider/main_tabs_provider.dart';
import '../../../main.dart';
import '../../../resources/resources.dart';
import '../../../widgets/recipes_list/recipes_list_widget.dart';
import 'week_recipes_event.dart';
import 'week_recipes_state.dart';

class WeekRecipesBloc extends Bloc <WeekRecipesEvent, WeekRecipesState> {
  final WeekRecipes _weekRecipes;
  MainTabsProvider mainTabsProvider;
  // Recipe _currentRecipe;
  // final mainTabsProvider = context.watch<MainTabsProvider>();

  WeekRecipesBloc(this._weekRecipes, this.mainTabsProvider, ) : super(WeekRecipesLoadedState(weekRecipes: _weekRecipes,
      mainTabsProvider: mainTabsProvider,
      )) {

    on <WeekRecipesLoadEvent>((event, emit) {
      print('emit(LogLoadedState');
      emit(WeekRecipesLoadedState(weekRecipes: _weekRecipes, mainTabsProvider: mainTabsProvider,));
    });

    on <WeekRecipesAddRecipeEvent>((event, emit) {
      print('emit(WeekRecipesAddRecipeState');
      Recipe value = mainTabsProvider.currentRecipe;
      // String meel = 'Завтрак';
      // if (mainTabsProvider.currentMeelIndex ==1)  { meel = 'Обед';
      // } else {
      //   if (mainTabsProvider.currentMeelIndex == 2) {
      //     meel = 'Ужин';
      //   }
      //   // else {
      //   //   meel = 3;
      //   // }
      // }
      _weekRecipes.weekRecipes[mainTabsProvider.currentDayIndex].dayRecipes[mainTabsProvider.currentMeelString]!.add(value);
      // for(var item in _weekRecipes.weekRecipes[dayController].dayRecipes.entries){
        //   // item представляет MapEntry<K, V>
        //   print("${item.key} - ${item.value}");

      // _weekRecipes.weekRecipes[0].dayRecipes["Завтрак"].add(recipe);
      emit(WeekRecipesLoadedState(weekRecipes: _weekRecipes, mainTabsProvider: mainTabsProvider,));
    });

    on <WeekRecipesDelRecipeEvent>((event, emit) {
      print('emit(WeekRecipesDelRecipeState');
      print('mainTabsProvider.currentListIndex = ${mainTabsProvider.currentListIndex}');
      _weekRecipes.weekRecipes[mainTabsProvider.currentDayIndex].
        dayRecipes[mainTabsProvider.currentMeelString]!.
          removeAt(mainTabsProvider.currentListIndex);
      emit(WeekRecipesLoadedState(weekRecipes: _weekRecipes, mainTabsProvider: mainTabsProvider,));
    });

    on <WeekRecipesClearEvent>((event, emit) {
      emit(WeekRecipesEmptyState());
    });
  }
}