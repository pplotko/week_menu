import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week_menu/provider/main_tabs_provider.dart';

import '../../Theme/app_colors.dart';
import '../../presentation/bloc/week_recipes/week_recipes_bloc.dart';
import '../../presentation/bloc/week_recipes/week_recipes_event.dart';
import '../recipe.dart';
import '../recipe_detail_screen/recipe_detail_widget.dart';

class RecipesListWidget extends StatefulWidget {
  List<Recipe> recipes;
  RecipesListWidget({Key? key, required this.recipes}) : super(key: key);

  @override
  State<RecipesListWidget> createState() => _RecipesListWidgetState(this.recipes);
}

class _RecipesListWidgetState extends State<RecipesListWidget> {

  var _filteredRecipes = <Recipe> [];
  final _searchController = TextEditingController();
  List<Recipe> recipes;

  _RecipesListWidgetState(this.recipes);

  void _searchRecipes() {
    final query = _searchController.text.toLowerCase();
    if (query.isNotEmpty) {

      _filteredRecipes = recipes.where((Recipe recipe) {
        return recipe.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }else {
      _filteredRecipes = recipes;
    }
    setState(() {});
    }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _filteredRecipes = recipes;
    _searchController.addListener(_searchRecipes);
  }

  @override
  Widget build(BuildContext context) {
    final mainTabsProvider = context.watch<MainTabsProvider>();
    print("MainTabsProvider.currentDayIndex = ${mainTabsProvider.currentDayIndex}");
    print("MainTabsProvider.currentMeelIndex = ${mainTabsProvider.currentMeelIndex}");
    final weekRecipesBloc = BlocProvider.of<WeekRecipesBloc>(context);
    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.only(top: 70),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: _filteredRecipes.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index) {
            final recipe = _filteredRecipes[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Stack(
                children: [DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black.withOpacity(0.2)),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow:[
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0,4),
                      ),],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Row(
                        children: [
                          Image(image: AssetImage(recipe.imageName[0]/*recipe.imgFirstName height: , width: ,*/), ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(recipe.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold,),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(recipe.time,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(color: Colors.grey,),
                                ),
                                const SizedBox(height: 20),
                                Text(recipe.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                        ]
                    ),
                  ),
                ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        print('Click');
                        print(recipe.id.toString());
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => RecipeDetailPage(recipeId: recipe.id, recipes: recipes,)
                        ));
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top:5, right: 5),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: Container(
                          // decoration: BoxDecoration(
                          //   color: Colors.white,
                          //   border: Border.all(color: AppColors.mainGreenDark),
                          //   borderRadius: const BorderRadius.all(Radius.circular(10)),
                          //   boxShadow:[
                          //     BoxShadow(
                          //       color: Colors.black.withOpacity(0.1),
                          //       blurRadius: 8,
                          //       offset: const Offset(0,4),
                          //     ),
                          //   ],
                          // ),
                          child: IconButton(                  // AddRecipe
                            iconSize: 18,
                            icon: const Icon(Icons.add),
                            color:AppColors.mainGreenMoreDark,
                            padding: const EdgeInsets.only(right: 1, bottom: 1),
                            onPressed: () {
                              print("Pressed IconButton");
                              mainTabsProvider.currentRecipe = recipe;
                              weekRecipesBloc.add(WeekRecipesAddRecipeEvent());               //!!!!!!!!!!!!!!!!!!!!!!!!!!
                              Navigator.of(context).pushReplacementNamed('/main');
                            }
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        // Search field
        Padding(
          padding:
            const EdgeInsets.only(
                left : 14.0,
                top : 16.0,
                right : 14.0,
                bottom : 8),
          // const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
              labelText: 'Поиск',
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(  //You can also use EdgeInsets.only
                horizontal: 12.0, //Change this
                vertical: 12.0,
              ),//Change this
            ),
          ),
        ),
        // SizedBox(height: 10,)
      ],
    );
  }
}