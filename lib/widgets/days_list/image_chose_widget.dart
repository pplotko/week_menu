import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Theme/app_colors.dart';
import '../../provider/main_tabs_provider.dart';
import '../recipe.dart';

class ImageChoseWidget extends StatefulWidget {
  final List<Recipe> mealTimeRecipesList;
  final List<Recipe> recipes;
  final String meelTime;

  const ImageChoseWidget(
      {Key? key,
      required this.mealTimeRecipesList,
      required this.recipes,
      required this.meelTime})
      : super(key: key);

  @override
  State<ImageChoseWidget> createState() => _ImageChoseWidgetState(
      mealTimeRecipesList, recipes, meelTime);
}

class _ImageChoseWidgetState extends State<ImageChoseWidget> {
  final List<Recipe> mealTimeRecipesList;
  final List<Recipe> recipes;
  final String meelTime;

  _ImageChoseWidgetState(
    this.mealTimeRecipesList,
    this.recipes,
    this.meelTime,
  );

  @override
  Widget build(BuildContext context) {
    // final mainTabsProvider = context.read<MainTabsProvider>();
    if (mealTimeRecipesList.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: SizedBox(
            height: 96,
            width: 96,
            child: ElevatedButton(
              key: UniqueKey(), //Button to add recipes
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColors.foregroundLightGreen),
                foregroundColor:
                    MaterialStateProperty.all(AppColors.mainGreenMoreDark),
                // side: MaterialStateProperty.all(BorderSide(
                //   color: Colors.red,
                //   style: BorderStyle.solid,//color
                // ),),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500, /*letterSpacing: -0.6,*/
                  ),
                ),
                // padding: MaterialStateProperty.all(EdgeInsets.only(left: 2)),
                alignment: Alignment.center,
              ),
              onPressed: () {
                context.read<MainTabsProvider>().currentMeelString = meelTime;
                final navigator = Navigator.of(context);
                navigator.pushReplacementNamed('/recipes_list_page_widget');
                print('meelTime= $meelTime');
              },
              child: const Icon(Icons.add, size: 20),
              /*textAlign: TextAlign.center,*/
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: SizedBox(
                height: 96,
                width: 96,
                child: Image(
                  height: 96,
                  width: 96,
                  fit: BoxFit.fitHeight,
                  image: AssetImage(mealTimeRecipesList[0].imageName[0]),
                ),
              ),
            ),
            SizedBox(
              // height: 96,
              width: 96,
              child: ElevatedButton(
                //Button to add recipes
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.foregroundLightGreen),
                  foregroundColor:
                      MaterialStateProperty.all(AppColors.mainGreenMoreDark),
                  // side: MaterialStateProperty.all(BorderSide(
                  //   color: Colors.red,
                  //   style: BorderStyle.solid,//color
                  // ),),
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500, /*letterSpacing: -0.6,*/
                    ),
                  ),
                  // padding: MaterialStateProperty.all(EdgeInsets.only(left: 2)),
                  alignment: Alignment.center,
                ),
                onPressed: () {
                  context.read<MainTabsProvider>().currentMeelString = meelTime;
                  final navigator = Navigator.of(context);
                  navigator.pushReplacementNamed('/recipes_list_page_widget');
                  print('meelTime= $meelTime');
                },
                child: const Icon(Icons.add, size: 20),
                /*textAlign: TextAlign.center,*/
              ),
            ),
          ],
        ),
      );
    }
  }
}
