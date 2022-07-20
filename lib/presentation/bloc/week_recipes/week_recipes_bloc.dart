import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week_menu/provider/main_tabs_provider.dart';
import '../../../main.dart';
import '../../../widgets/recipe.dart';
import 'week_recipes_event.dart';
import 'week_recipes_state.dart';

class WeekRecipesBloc extends Bloc <WeekRecipesEvent, WeekRecipesState> {
  final WeekRecipes _weekRecipes;
  MainTabsProvider mainTabsProvider;

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
      print('mainTabsProvider.currentMeelString = ${mainTabsProvider.currentMeelString}');
      _weekRecipes.weekRecipes[mainTabsProvider.currentDayIndex].
          dayRecipes[mainTabsProvider.currentMeelString]!.
            removeAt(mainTabsProvider.currentListIndex);
      // if (mainTabsProvider.currentListIndex != 0) {
      //   _weekRecipes.weekRecipes[mainTabsProvider.currentDayIndex].
      //     dayRecipes[mainTabsProvider.currentMeelString]!.
      //   removeAt(mainTabsProvider.currentListIndex);
      // } else {
      //   _weekRecipes.weekRecipes[mainTabsProvider.currentDayIndex].
      //     dayRecipes[mainTabsProvider.currentMeelString]!.clear();
      // }
      emit(WeekRecipesLoadedState(weekRecipes: _weekRecipes, mainTabsProvider: mainTabsProvider,));
    });

    on <WeekRecipesClearEvent>((event, emit) {
      emit(WeekRecipesEmptyState());
    });
  }
}