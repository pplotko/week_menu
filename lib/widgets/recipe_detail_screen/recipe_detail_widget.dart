import 'package:flutter/material.dart';
import 'package:week_menu/Theme/app_colors.dart';
import '../recipe_list/recipe_list_widget.dart';


class RecipeDetailPage extends StatelessWidget {
  // в качестве параметра мы будет получать id рецепта
  final int recipeId;
  // конструктор принимает recipeId,
  // который будет присвоен нашему ранее
  // объявленному рецепту
  const RecipeDetailPage(this.recipeId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // получаем рецепт по его id
    // обратить внимание: мы импортируем recipe
    // из файла recipe_list_widget.dart
    final recipe = recipes[recipeId];
    return Scaffold(
        appBar: AppBar(
          title: Text(recipe.title /*"Recipe Detail Page"*/),
        ),
        body: Padding(
          // указываем отступ для контента
          padding: const EdgeInsets.all(15),
          // Column размещает дочерние виджеты в виде колонки
          // crossAxisAlignment - выравнивание по ширине (колонка) или
          // по высоте (строка)
          // mainAxisAlignment работает наоборот
          // в данном случае мы растягиваем дочерние элементы
          // на всю ширину колонки

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
                margin: const EdgeInsets.all(0.0),
                color: Colors.white,
                height: 300.0,
                alignment: Alignment.center,
                child:
                  ListView.builder(
                    itemCount: recipe.imageName.length,
                    itemExtent: 300,
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Image(image: AssetImage(recipe.imageName[index]),),
                      );// print("Вывод картинок");
                    }
                  ),
              ),

            Container(
              color: AppColors.mainLightGreen,
              padding: const EdgeInsets.all(10),
              child: Text('${recipe.id+1} - ${recipe.description}',
                  style: Theme.of(context).textTheme.bodyText1
              ),
            )
          ],
        )
      ),
    );
  }
}