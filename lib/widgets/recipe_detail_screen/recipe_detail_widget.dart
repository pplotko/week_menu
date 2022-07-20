import 'package:flutter/material.dart';
import 'package:week_menu/Theme/app_colors.dart';
import '../app_bar/app_bar_widget.dart';
import '../recipe.dart';


class RecipeDetailPage extends StatelessWidget {
  List<Recipe> recipes;
  final int recipeId;

  RecipeDetailPage({Key? key, required this.recipes, required this.recipeId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // получаем рецепт по его id
    // обратить внимание: мы импортируем recipe
    // из файла recipe_list_widget.dart
    final recipe = recipes[recipeId];
    return Scaffold(
        appBar: MyCustomAppBar(titel: 'RecipeDetailPage', isBackPath: true, path: '/recipes_list_page_widget',),

        // AppBar(
        //   title: Text(recipe.title /*"Recipe Detail Page"*/),
        // ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[AppColors.mainLightGreen, AppColors.foregroundLightGreen],
            ),
          ),
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(recipe.title,
                  // style: Theme.of(context).textTheme.bodyText1,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.selectedColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16,),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height-165,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  // Container(
                  //     padding: EdgeInsets.all(10),
                  //     // вы не можете указать color для Container,
                  //     // т.к. свойство decoration было определено
                  //     // color: Colors.pinkAccent,
                  //     // BoxDecoration имеет дополнительные свойства,
                  //     // посравнению с Container,
                  //     // такие как: gradient, borderRadius, border, shape
                  //     // и boxShadow
                  //     // здесь мы задаем радиус закругления левого и правого
                  //     // верхних углов
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.only(
                  //           topLeft: Radius.circular(15),
                  //           topRight: Radius.circular(15)
                  //       ),
                  //       // цвет Container'а мы указываем в BoxDecoration
                  //       color: AppColors.mainLightBlue,
                  //     ),
                  //     child: Text(
                  //       // указываем имя рецепта
                  //       recipe.title,
                  //       //style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white)
                  //       style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),
                  //     )
                  // ),
                      Container(
                        // margin: const EdgeInsets.all(0.0),
                        color: Colors.transparent,
                        height: 300.0,
                        alignment: Alignment.center,
                        child:
                          ListView.builder(
                            itemCount: recipe.imageName.length,
                            itemExtent: 300,
                            padding: const EdgeInsets.all(8),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                child: Center(child: SizedBox(
                                  height: 300,
                                  width: 390,
                                  child: Image(image: AssetImage(recipe.imageName[index]),),
                                )));// print("Вывод картинок");
                            }
                          ),
                      ),

                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        color: AppColors.foregroundLightGreen,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            // Text('Номер рецепта: ${recipe.id}',
                            //     // style: Theme.of(context).textTheme.bodyText1,
                            //   style: const TextStyle(
                            //       fontSize: 10,
                            //       fontWeight: FontWeight.w400,
                            //       color: AppColors.foregroundDarkText,
                            //     ),
                            //   ),
                            Text(recipe.description,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.foregroundDarkText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}