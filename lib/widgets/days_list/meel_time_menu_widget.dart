import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Theme/app_colors.dart';
import '../../presentation/bloc/week_recipes/week_recipes_bloc.dart';
import '../../presentation/bloc/week_recipes/week_recipes_event.dart';
import '../../provider/main_tabs_provider.dart';
import '../recipe.dart';

// menu of dishes for each meal in the card of the day
class MealTimeMenuWidget extends StatefulWidget {
  final List<Recipe> mealTimeRecipiesList;
  final int dayController;
  final String meelTime;

  const MealTimeMenuWidget(
      {Key? key,
      required this.mealTimeRecipiesList,
      required this.dayController,
      required String this.meelTime})
      : super(key: key);

  @override
  State<MealTimeMenuWidget> createState() => _MealTimeMenuWidgetState(
      this.mealTimeRecipiesList, this.dayController, this.meelTime);
}

class _MealTimeMenuWidgetState extends State<MealTimeMenuWidget> {
  List<Recipe> mealTimeRecipiesList;
  int dayController;
  String meelTime;

  _MealTimeMenuWidgetState(
      this.mealTimeRecipiesList, this.dayController, this.meelTime);

  @override
  Widget build(BuildContext context) {
    final mainTabsProvider = context.watch<MainTabsProvider>();
    final weekRecipesBloc = BlocProvider.of<WeekRecipesBloc>(context);
    print('dayController= $dayController');
    List<Widget> myListWidgets = [];
    if (mealTimeRecipiesList.length != null ||
        mealTimeRecipiesList.isNotEmpty) {
      for (int i = 0; i < mealTimeRecipiesList.length; i++) {
        print('Рецепт ${mealTimeRecipiesList[i].title}');
        myListWidgets.add(
          TextButton(
            key: UniqueKey(),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              foregroundColor:
                  MaterialStateProperty.all(AppColors.foregroundDarkText),
              textStyle: MaterialStateProperty.all(
                const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              padding:
                  MaterialStateProperty.all(const EdgeInsets.only(left: 0)),
              // alignment: Alignment.topLeft,
            ),
            onPressed: () {},
            onLongPress: () {
              ///DelRecipe
              print("Pressed TextButton");
              mainTabsProvider.currentListIndex = i;
              mainTabsProvider.currentMeelString = meelTime;
              weekRecipesBloc.add(WeekRecipesDelRecipeEvent());
              Navigator.of(context).pushReplacementNamed('/main');
            },
            child: Text(
              mealTimeRecipiesList[i].title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
            ),
          ),
        );
      }
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: myListWidgets,
      );
    }
    if (mealTimeRecipiesList.isEmpty) {
      return Container(
        color: Colors.green,
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: myListWidgets,
      );
    }
  }
}
