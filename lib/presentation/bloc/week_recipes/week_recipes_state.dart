import '../../../main.dart';
import '../../../widgets/recipe_list/recipe_list_widget.dart';

// class DayRecipes{
//   Map <String, List<Recipe>> dayRecipes = {
//     'Завтрак': [],
//     'Обед': [],
//     'Ужин': [],
//   };
// }
//
// DayRecipes firstDay = {
//   'Завтрак' : recipes Recipe.id],
//   // 'Обед' : [" "],
//   // 'Ужин' : [" "]
// } as DayRecipes;

// class WeekRecipes {
//   List<DayRecipes> weekRecipes = [firstDay, firstDay,];
// }

abstract class WeekRecipesState {}

class WeekRecipesEmptyState extends WeekRecipesState{}

class WeekRecipesLoadingState extends WeekRecipesState{}

class WeekRecipesLoadedState extends WeekRecipesState{
  WeekRecipes weekRecipes;
  WeekRecipesLoadedState({required this.weekRecipes});
}