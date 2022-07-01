abstract class WeekRecipesEvent{}

class WeekRecipesAddRecipeEvent extends WeekRecipesEvent {}
class WeekRecipesDelRecipeEvent extends WeekRecipesEvent {}
class WeekRecipesAddEvent extends WeekRecipesEvent {}
class WeekRecipesLoadEvent extends WeekRecipesEvent {}
class WeekRecipesClearEvent extends WeekRecipesEvent {}