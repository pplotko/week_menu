import 'package:flutter/material.dart';
import 'package:json_placeholder_app/Theme/app_colors.dart';
import 'package:json_placeholder_app/resources/resources.dart';
import 'package:json_placeholder_app/widgets/recipe_list/recipe_list_widget.dart';


class RecipeDetailPage extends StatelessWidget {
  // в качестве параметра мы будет получать id пони
  late final int recipeId;

  // конструктор принимает recipeId,
  // который будет присвоен нашему ранее
  // объявленному рецепту
  RecipeDetailPage(this.recipeId);

  @override
  Widget build(BuildContext context) {
    // получаем рецепт по его id
    // обратите внимание: мы импортируем recipe
    // из файла pony_list_page.dart
    final recipe = recipes[recipeId];
    return Scaffold(
        appBar: AppBar(
          title: Text("Recipe Detail Page"),
        ),
        body: Padding(
          // указываем отступ для контента
          padding: EdgeInsets.all(15),
          // Column размещает дочерние виджеты в виде колонки
          // crossAxisAlignment - выравнивание по ширине (колонка) или
          // по высоте (строка)
          // mainAxisAlignment работает наоборот
          // в данном случае мы растягиваем дочерние элементы
          // на всю ширину колонки
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  padding: EdgeInsets.all(10),
                  // вы не можете указать color для Container,
                  // т.к. свойство decoration было определено
                  // color: Colors.pinkAccent,

                  // BoxDecoration имеет дополнительные свойства,
                  // посравнению с Container,
                  // такие как: gradient, borderRadius, border, shape
                  // и boxShadow
                  // здесь мы задаем радиус закругления левого и правого
                  // верхних углов
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)
                    ),
                    // цвет Container'а мы указываем в BoxDecoration
                    color: AppColors.mainLightBlue,
                  ),
                  child: Text(
                    // указываем имя рецепта
                    recipe.title,
                    //style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white)
                    style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),
                  )
              ),
              Image(image: AssetImage(recipe.imageName)),
              Container(
                  color: Colors.orangeAccent,
                  padding: EdgeInsets.all(10),
                  child: Text((recipe.id+1).toString()+' - ' +
                      // указываем описание recipe
                      recipe.description,
                      style: Theme.of(context).textTheme.bodyText1
                  )
              )
            ],
          ),
        )
    );
  }
}