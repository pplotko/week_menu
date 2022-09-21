import 'package:flutter/material.dart';
import 'package:week_menu/Theme/app_colors.dart';
import 'package:week_menu/widgets/app_bar/app_bar_widget.dart';
import '../recipe.dart';
import '../recipes_list/recipes_list_widget.dart';

class RecipesListPageWidget extends StatelessWidget {
  final List<Recipe> recipes;

  const RecipesListPageWidget({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(
        titel: "Выберите рецепт",
        isBackPath: true,
        path: '/main',
      ),
      //   AppBar(
      //     title: const Text("Выберите рецепт"), //Choose a recipe
      //     automaticallyImplyLeading: true,
      //     leading: Builder(
      //       builder: (BuildContext context) {
      //         return IconButton(
      //           icon: const Icon(Icons.arrow_back),
      //           onPressed: () {
      //             // Navigator.of(context).maybePop();
      //             final navigator = Navigator.of(context);
      //             navigator.pushReplacementNamed('/main');
      //           },
      //           // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      //         );
      //       }),
      // ),
      body: Container(
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
          alignment: Alignment.topCenter,
          child: RecipesListWidget(
            recipes: recipes,
          )),
    );
  }
}
