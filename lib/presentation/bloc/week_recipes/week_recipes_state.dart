import 'package:week_menu/provider/main_tabs_provider.dart';

import '../../../widgets/recipe.dart';

abstract class WeekRecipesState {}

class WeekRecipesEmptyState extends WeekRecipesState{}

class WeekRecipesLoadingState extends WeekRecipesState{}

class WeekRecipesLoadedState extends WeekRecipesState{
  WeekRecipes weekRecipes;
  WeekRecipesLoadedState({required this.weekRecipes, required MainTabsProvider mainTabsProvider,});
}