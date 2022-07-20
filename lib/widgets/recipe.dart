class Recipe {
  final int id;
  final List <String> imageName;
  final String title;
  final String time;
  final String description;
  final String imgFirstName;

  Recipe({
    required this.id,
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
    required this.imgFirstName,
  });
  @override
  String toString() {
    // TODO: implement toString
    // String recipeDescription = "$title";
    return title;
  }
}

class DayRecipes {
  late Map <String, List<Recipe>> dayRecipes;
  DayRecipes({required this.dayRecipes});
// = {
//   'Завтрак': [],
//   'Обед': [],
//   'Ужин': [],
// };
}

class WeekRecipes {
  final List<DayRecipes> weekRecipes;
  WeekRecipes({required this.weekRecipes});
}