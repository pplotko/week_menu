import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../main.dart';
import 'week_recipes_event.dart';
import 'week_recipes_state.dart';

class WeekRecipesBloc extends Bloc <WeekRecipesEvent, WeekRecipesState> {
  WeekRecipes _weekRecipes;

  WeekRecipesBloc(this._weekRecipes, ) : super(WeekRecipesLoadedState(weekRecipes: _weekRecipes)) {

    on <WeekRecipesLoadEvent>((event, emit) {
      print('emit(LogLoadedState');
      emit(WeekRecipesLoadedState(weekRecipes: _weekRecipes));
    });

    on <WeekRecipesAddRecipeEvent>((event, emit) {
      print('emit(WeekRecipesAddRecipeState');
      // for(var item in _weekRecipes.weekRecipes[dayController].dayRecipes.entries){
        //   // item представляет MapEntry<K, V>
        //   print("${item.key} - ${item.value}");

      // _weekRecipes.weekRecipes[0].dayRecipes["Завтрак"].add(recipe);
      emit(WeekRecipesLoadedState(weekRecipes: _weekRecipes));
    });
    on <WeekRecipesClearEvent>((event, emit) {
      emit(WeekRecipesEmptyState());
    });
  }
}