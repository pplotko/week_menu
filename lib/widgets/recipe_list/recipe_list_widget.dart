import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:json_placeholder_app/resources/resources.dart';

class Recipe {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;

  Recipe({
    required this.id,
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}
// создаем список рецептов
// final указывает на то, что мы больше
// никогда не сможем присвоить имени _recipe
// другой список рецептов
final _recipes = [
  Recipe(
    id: 0,
    imageName: AppImages.kotletiKlassicheskie2480300x233,
    title: 'КОТЛЕТЫ КЛАССИЧЕСКИЕ (СВИНИНА + КУРИЦА)',
    time: 'December 17, 2021',
    description: 'Готовим фарш, перекручиваем мясо (свинину и курицу) на тонкой сетке мясорубки 2 раза. Лук сразу мелко мелко шинкуем. Обжариваем (если планируем заморозку). Добавляем в фарш. Хлебный мякиш отправляем в кипяток размочиться. Выдавливаем чеснок, солим и перчим по вкусу. Добавляем в мясо хлеб, пропустив через мясорубку и тщательно все перемешиваем. Сейчас руками сформируем мясные шарики и немного приплюснем. Руки при этом мочим в холодной воде, чтобы фарш не прилипал к ним. Теперь обваляем котлеты в муке или можно использовать любую другую панировку. Сначала одну сторону обжариваем на среднем огне, потом убавляем огонь до маленького, переворачиваем котлетки и накрываем крышкой. Добавляем к котлетам воды и тушим. После доводим до готовности и готово. Котлетки готовы. Приятного аппетита!',
  ),
  Recipe(
    id: 1,
    imageName: AppImages.plovSoSvininoi480,
    title: 'ПЛОВ СО СВИНИНОЙ',
    time: 'December 17, 2021',
    description: 'Помыть и порезать на куски свинину. В сковороду (или казан) налить масло подсолнечное. Раскалить. Нарезать лук и обжарить его в масле. Свинину посолить, поперчить, положить в масло. Обжарить на большом огне. Убавить огонь почти до минимума и тушить 10 минут. Пока готовится свинина поставьте овощной бульон. Налить воду в кастрюлю и поставить на огонь. Лук и морковь хорошо промыть (чистить от кожуры не нужно!!!, т.е. лук должен быть в кожуре). Разрезать лук, морковь и стебель сельдерея напополам и положите разрезанными сторонами на сковородку без масла. Обжарить 2-3 минуты и закинуть в бульон. Как закипит вода, убавить огонь и варить бульон на слабом огне. Бульон будет вариться на протяжении всего времени приготовления блюда, т.к. периодически нужно будет подливать бульон в рис до его полной готовности. Потереть морковь на крупной терке. Выложить сверху мяса ровным слоем и тушить еще 10 минут. Рис промыть. Добавить в него 1 чайную ложку специй для плова и 1 чайную ложку соли, перемешать. Открыть крышку и положить 2 головки чеснока не чищенные (предварительно помыв их). Сверху насыпать рис ровным слоем. Аккуратно залить рис овощным бульоном, так, чтобы вода поднялась над рисом на 5-7 мм. Накрыть сверху крышкой. Тушить 30 минут. Если видите, что бульон выкипел, а рис еще не готов, добавите еще немного бульона. Откройте крышку и аккуратно переверните рис. Выключите огонь. Дайте настояться плову еще некоторое время. Плов готов. Приятного аппетита!',
  ),
  Recipe(
    id: 2,
    imageName: AppImages.kotletiKlassicheskie2480300x233,
    title: 'КОТЛЕТЫ КЛАССИЧЕСКИЕ (СВИНИНА + КУРИЦА)',
    time: 'December 17, 2021',
    description: 'Готовим фарш, перекручиваем мясо (свинину и курицу) на тонкой сетке мясорубки 2 раза. Лук сразу мелко мелко шинкуем. Обжариваем (если планируем заморозку). Добавляем в фарш. Хлебный мякиш отправляем в кипяток размочиться. Выдавливаем чеснок, солим и перчим по вкусу. Добавляем в мясо хлеб, пропустив через мясорубку и тщательно все перемешиваем. Сейчас руками сформируем мясные шарики и немного приплюснем. Руки при этом мочим в холодной воде, чтобы фарш не прилипал к ним. Теперь обваляем котлеты в муке или можно использовать любую другую панировку. Сначала одну сторону обжариваем на среднем огне, потом убавляем огонь до маленького, переворачиваем котлетки и накрываем крышкой. Добавляем к котлетам воды и тушим. После доводим до готовности и готово. Котлетки готовы. Приятного аппетита!',
  ),
  Recipe(
    id: 3,
    imageName: AppImages.kotletiKlassicheskie2480300x233,
    title: 'КОТЛЕТЫ КЛАССИЧЕСКИЕ (СВИНИНА + КУРИЦА)',
    time: 'December 17, 2021',
    description: 'Готовим фарш, перекручиваем мясо (свинину и курицу) на тонкой сетке мясорубки 2 раза. Лук сразу мелко мелко шинкуем. Обжариваем (если планируем заморозку). Добавляем в фарш. Хлебный мякиш отправляем в кипяток размочиться. Выдавливаем чеснок, солим и перчим по вкусу. Добавляем в мясо хлеб, пропустив через мясорубку и тщательно все перемешиваем. Сейчас руками сформируем мясные шарики и немного приплюснем. Руки при этом мочим в холодной воде, чтобы фарш не прилипал к ним. Теперь обваляем котлеты в муке или можно использовать любую другую панировку. Сначала одну сторону обжариваем на среднем огне, потом убавляем огонь до маленького, переворачиваем котлетки и накрываем крышкой. Добавляем к котлетам воды и тушим. После доводим до готовности и готово. Котлетки готовы. Приятного аппетита!',
  ),
  Recipe(
    id: 4,
    imageName: AppImages.kotletiKlassicheskie2480300x233,
    title: 'КОТЛЕТЫ КЛАССИЧЕСКИЕ (СВИНИНА + КУРИЦА)',
    time: 'December 17, 2021',
    description: 'Готовим фарш, перекручиваем мясо (свинину и курицу) на тонкой сетке мясорубки 2 раза. Лук сразу мелко мелко шинкуем. Обжариваем (если планируем заморозку). Добавляем в фарш. Хлебный мякиш отправляем в кипяток размочиться. Выдавливаем чеснок, солим и перчим по вкусу. Добавляем в мясо хлеб, пропустив через мясорубку и тщательно все перемешиваем. Сейчас руками сформируем мясные шарики и немного приплюснем. Руки при этом мочим в холодной воде, чтобы фарш не прилипал к ним. Теперь обваляем котлеты в муке или можно использовать любую другую панировку. Сначала одну сторону обжариваем на среднем огне, потом убавляем огонь до маленького, переворачиваем котлетки и накрываем крышкой. Добавляем к котлетам воды и тушим. После доводим до готовности и готово. Котлетки готовы. Приятного аппетита!',
  ),
  Recipe(
    id: 5,
    imageName: AppImages.kotletiKlassicheskie2480300x233,
    title: 'КОТЛЕТЫ КЛАССИЧЕСКИЕ (СВИНИНА + КУРИЦА)',
    time: 'December 17, 2021',
    description: 'Готовим фарш, перекручиваем мясо (свинину и курицу) на тонкой сетке мясорубки 2 раза. Лук сразу мелко мелко шинкуем. Обжариваем (если планируем заморозку). Добавляем в фарш. Хлебный мякиш отправляем в кипяток размочиться. Выдавливаем чеснок, солим и перчим по вкусу. Добавляем в мясо хлеб, пропустив через мясорубку и тщательно все перемешиваем. Сейчас руками сформируем мясные шарики и немного приплюснем. Руки при этом мочим в холодной воде, чтобы фарш не прилипал к ним. Теперь обваляем котлеты в муке или можно использовать любую другую панировку. Сначала одну сторону обжариваем на среднем огне, потом убавляем огонь до маленького, переворачиваем котлетки и накрываем крышкой. Добавляем к котлетам воды и тушим. После доводим до готовности и готово. Котлетки готовы. Приятного аппетита!',
  ),
];


class RecipeListWidget extends StatefulWidget {



  const RecipeListWidget({Key? key}) : super(key: key);

  @override
  State<RecipeListWidget> createState() => _RecipeListWidgetState();
}

class _RecipeListWidgetState extends State<RecipeListWidget> {

  var _filteredRecipes = <Recipe> [];
  final _searchController = TextEditingController();

  void _searchRecipes() {
    final query = _searchController.text.toLowerCase();
    if (query.isNotEmpty) {
      _filteredRecipes = _recipes.where((Recipe recipe) {
        return recipe.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }else {
      _filteredRecipes = _recipes;
    }
    setState(() {});
    }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _filteredRecipes = _recipes;
    _searchController.addListener(_searchRecipes);
  }

  @override
  Widget build(BuildContext context) {
    // return Container(color: Colors.green);
  // final img = AssetImage(AppImages.kotletiKlassicheskie2480300x233);
    return Stack(
      children: [
        ListView.builder(
          padding: EdgeInsets.only(top: 70),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: _filteredRecipes.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index) {
            final recipe = _filteredRecipes[index];
            return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
                  child: Stack(
                    children: [DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black.withOpacity(0.2)),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow:[
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: Offset(0,4),
                          ),],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Row(
                            // color: Colors.green,
                            children: [Image(image: AssetImage(recipe.imageName)),
                            SizedBox(width: 15),
                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20),
                                    Text(recipe.title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,),
                                    ),
                                    SizedBox(height: 5),
                                    Text(recipe.time,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.grey,),
                                    ),
                                    SizedBox(height: 20),
                                    Text(recipe.description,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                            ),
                            SizedBox(width: 10),
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
                            },
                          ),
                        ),
                  ],
                  ),
                );
          },
        ),

        // Search field
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: OutlineInputBorder(),
              labelText: 'Поиск',
            ),
          ),
        ),
        // SizedBox(height: 10,)
      ],
    );
  }
}
