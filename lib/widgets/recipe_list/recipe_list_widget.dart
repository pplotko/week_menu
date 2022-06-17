import 'package:flutter/material.dart';

import '../../Theme/app_colors.dart';
import '../recipe_detail_screen/recipe_detail_widget.dart';

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
}
// создаем список рецептов
// final указывает на то, что мы больше
// никогда не сможем присвоить имени _recipe
// другой список рецептов
// final recipes = [
//   Recipe(
//     id: 0,
//     imageName: [AppImages.kotletiKlassicheskie2480300x233,AppImages.plovSoSvininoi480,],
//     title: 'КОТЛЕТЫ КЛАССИЧЕСКИЕ (СВИНИНА + КУРИЦА)',
//     time: 'December 17, 2021',
//     description: 'Готовим фарш, перекручиваем мясо (свинину и курицу) на тонкой сетке мясорубки 2 раза. Лук сразу мелко мелко шинкуем. Обжариваем (если планируем заморозку). Добавляем в фарш. Хлебный мякиш отправляем в кипяток размочиться. Выдавливаем чеснок, солим и перчим по вкусу. Добавляем в мясо хлеб, пропустив через мясорубку и тщательно все перемешиваем. Сейчас руками сформируем мясные шарики и немного приплюснем. Руки при этом мочим в холодной воде, чтобы фарш не прилипал к ним. Теперь обваляем котлеты в муке или можно использовать любую другую панировку. Сначала одну сторону обжариваем на среднем огне, потом убавляем огонь до маленького, переворачиваем котлетки и накрываем крышкой. Добавляем к котлетам воды и тушим. После доводим до готовности и готово. Котлетки готовы. Приятного аппетита!',
//     imgFirstName: AppImages.kotletiKlassicheskie2480300x233,
//   ),
//   Recipe(
//     id: 1,
//     imageName: [AppImages.plovSoSvininoi480,],
//     title: 'ПЛОВ СО СВИНИНОЙ',
//     time: 'December 17, 2021',
//     description: 'Помыть и порезать на куски свинину. В сковороду (или казан) налить масло подсолнечное. Раскалить. Нарезать лук и обжарить его в масле. Свинину посолить, поперчить, положить в масло. Обжарить на большом огне. Убавить огонь почти до минимума и тушить 10 минут. Пока готовится свинина поставьте овощной бульон. Налить воду в кастрюлю и поставить на огонь. Лук и морковь хорошо промыть (чистить от кожуры не нужно!!!, т.е. лук должен быть в кожуре). Разрезать лук, морковь и стебель сельдерея напополам и положите разрезанными сторонами на сковородку без масла. Обжарить 2-3 минуты и закинуть в бульон. Как закипит вода, убавить огонь и варить бульон на слабом огне. Бульон будет вариться на протяжении всего времени приготовления блюда, т.к. периодически нужно будет подливать бульон в рис до его полной готовности. Потереть морковь на крупной терке. Выложить сверху мяса ровным слоем и тушить еще 10 минут. Рис промыть. Добавить в него 1 чайную ложку специй для плова и 1 чайную ложку соли, перемешать. Открыть крышку и положить 2 головки чеснока не чищенные (предварительно помыв их). Сверху насыпать рис ровным слоем. Аккуратно залить рис овощным бульоном, так, чтобы вода поднялась над рисом на 5-7 мм. Накрыть сверху крышкой. Тушить 30 минут. Если видите, что бульон выкипел, а рис еще не готов, добавите еще немного бульона. Откройте крышку и аккуратно переверните рис. Выключите огонь. Дайте настояться плову еще некоторое время. Плов готов. Приятного аппетита!',
//     imgFirstName: AppImages.plovSoSvininoi480,
//   ),
//   Recipe(
//     id: 2,
//     imageName: [AppImages.otbivnaya,],
//     title: 'ОТБИВНАЯ ИЗ СВИНИНЫ',
//     time: 'December 17, 2021',
//     description: 'Порезать на куски вырезку из свинины или филе, отбить. Обмакнуть во всбитом яйце с солью и специями, а затем в муке. Жарить на сковороде с двух сторон до хрустящей корочки.',
//     imgFirstName: AppImages.otbivnaya,
//   ),
//   Recipe(
//     id: 3,
//     imageName: [AppImages.kotletiKlassicheskie2480300x233,],
//     title: 'КОТЛЕТЫ КЛАССИЧЕСКИЕ (СВИНИНА + КУРИЦА)',
//     time: 'December 17, 2021',
//     description: 'Готовим фарш, перекручиваем мясо (свинину и курицу) на тонкой сетке мясорубки 2 раза. Лук сразу мелко мелко шинкуем. Обжариваем (если планируем заморозку). Добавляем в фарш. Хлебный мякиш отправляем в кипяток размочиться. Выдавливаем чеснок, солим и перчим по вкусу. Добавляем в мясо хлеб, пропустив через мясорубку и тщательно все перемешиваем. Сейчас руками сформируем мясные шарики и немного приплюснем. Руки при этом мочим в холодной воде, чтобы фарш не прилипал к ним. Теперь обваляем котлеты в муке или можно использовать любую другую панировку. Сначала одну сторону обжариваем на среднем огне, потом убавляем огонь до маленького, переворачиваем котлетки и накрываем крышкой. Добавляем к котлетам воды и тушим. После доводим до готовности и готово. Котлетки готовы. Приятного аппетита!',
//     imgFirstName: AppImages.kotletiKlassicheskie2480300x233,
//   ),
//   Recipe(
//     id: 4,
//     imageName: [AppImages.kotletiKlassicheskie2480300x233,],
//     title: 'КОТЛЕТЫ КЛАССИЧЕСКИЕ (СВИНИНА + КУРИЦА)',
//     time: 'December 17, 2021',
//     description: 'Готовим фарш, перекручиваем мясо (свинину и курицу) на тонкой сетке мясорубки 2 раза. Лук сразу мелко мелко шинкуем. Обжариваем (если планируем заморозку). Добавляем в фарш. Хлебный мякиш отправляем в кипяток размочиться. Выдавливаем чеснок, солим и перчим по вкусу. Добавляем в мясо хлеб, пропустив через мясорубку и тщательно все перемешиваем. Сейчас руками сформируем мясные шарики и немного приплюснем. Руки при этом мочим в холодной воде, чтобы фарш не прилипал к ним. Теперь обваляем котлеты в муке или можно использовать любую другую панировку. Сначала одну сторону обжариваем на среднем огне, потом убавляем огонь до маленького, переворачиваем котлетки и накрываем крышкой. Добавляем к котлетам воды и тушим. После доводим до готовности и готово. Котлетки готовы. Приятного аппетита!',
//     imgFirstName: AppImages.kotletiKlassicheskie2480300x233,
//   ),
//   Recipe(
//     id: 5,
//     imageName: [AppImages.kotletiKlassicheskie2480300x233,],
//     title: 'КОТЛЕТЫ КЛАССИЧЕСКИЕ (СВИНИНА + КУРИЦА)',
//     time: 'December 17, 2021',
//     description: 'Готовим фарш, перекручиваем мясо (свинину и курицу) на тонкой сетке мясорубки 2 раза. Лук сразу мелко мелко шинкуем. Обжариваем (если планируем заморозку). Добавляем в фарш. Хлебный мякиш отправляем в кипяток размочиться. Выдавливаем чеснок, солим и перчим по вкусу. Добавляем в мясо хлеб, пропустив через мясорубку и тщательно все перемешиваем. Сейчас руками сформируем мясные шарики и немного приплюснем. Руки при этом мочим в холодной воде, чтобы фарш не прилипал к ним. Теперь обваляем котлеты в муке или можно использовать любую другую панировку. Сначала одну сторону обжариваем на среднем огне, потом убавляем огонь до маленького, переворачиваем котлетки и накрываем крышкой. Добавляем к котлетам воды и тушим. После доводим до готовности и готово. Котлетки готовы. Приятного аппетита!',
//     imgFirstName: AppImages.kotletiKlassicheskie2480300x233,
//   ),
// ];


class RecipeListWidget extends StatefulWidget {
  List<Recipe> recipes;
  RecipeListWidget({Key? key, required this.recipes}) : super(key: key);

  @override
  State<RecipeListWidget> createState() => _RecipeListWidgetState(this.recipes);
}

class _RecipeListWidgetState extends State<RecipeListWidget> {

  var _filteredRecipes = <Recipe> [];
  final _searchController = TextEditingController();
  List<Recipe> recipes;

  _RecipeListWidgetState(this.recipes);

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
                          Image(image: AssetImage(recipe.imageName[0]/*recipe.imgFirstName*/)),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // const SizedBox(height: 5),
                                // IconButton(
                                //     icon: Icon(Icons.add),
                                //     onPressed: () {
                                //       print("Pressed IconButton");
                                //     }),
                                const SizedBox(height: 20),
                                Text(recipe.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold,),
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
                    child: IconButton(
                        icon: const Icon(Icons.add),
                        color:AppColors.mainGreenMoreDark,
                        // padding: const EdgeInsets.all(2.0),
                        onPressed: () {
                          print("Pressed IconButton");
                        }
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




// class DayRecipes{
//   Map <String, List<Recipe>> dayRecipes = {
//     'Завтрак': [],
//     'Обед': [],
//     'Ужин': []
//   };
// }
// class WeekRecipes {
//   List<DayRecipes> weekRecipes = [];
// }
/* примерное описание стейтов
abstract class WeekRecipesState {}

class WeekRecipesEmptyState extends WeekRecipesState{}

class WeekRecipesLoadingState extends WeekRecipesState{}

class WeekRecipesLoadedState extends WeekRecipesState{
  WeekRecipes weekRecipes;
  WeekRecipesLoadedState({required this.weekRecipes});
}

class WeekRecipesErrorState extends WeekRecipesState{}
*/