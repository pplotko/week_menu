import 'package:flutter/material.dart';
import 'package:week_menu/resources/resources.dart';

import '../widgets/recipe.dart';

class MainTabsProvider extends ChangeNotifier {
  int _currentTableIndex = 0;
  int currentDayIndex = 0;
  int currentMeelIndex = 0;
  String currentMeelString = 'Завтрак';
  int currentListIndex = 0;
  Recipe currentRecipe = Recipe(
    id: 1,
    imageName: [AppImages.plovSoSvininoi480,],
    title: 'ПЛОВ СО СВИНИНОЙ',
    time: 'December 17, 2021',
    description: 'Помыть и порезать на куски свинину. В сковороду (или казан) налить масло подсолнечное. Раскалить. Нарезать лук и обжарить его в масле. Свинину посолить, поперчить, положить в масло. Обжарить на большом огне. Убавить огонь почти до минимума и тушить 10 минут. Пока готовится свинина поставьте овощной бульон. Налить воду в кастрюлю и поставить на огонь. Лук и морковь хорошо промыть (чистить от кожуры не нужно!!!, т.е. лук должен быть в кожуре). Разрезать лук, морковь и стебель сельдерея напополам и положите разрезанными сторонами на сковородку без масла. Обжарить 2-3 минуты и закинуть в бульон. Как закипит вода, убавить огонь и варить бульон на слабом огне. Бульон будет вариться на протяжении всего времени приготовления блюда, т.к. периодически нужно будет подливать бульон в рис до его полной готовности. Потереть морковь на крупной терке. Выложить сверху мяса ровным слоем и тушить еще 10 минут. Рис промыть. Добавить в него 1 чайную ложку специй для плова и 1 чайную ложку соли, перемешать. Открыть крышку и положить 2 головки чеснока не чищенные (предварительно помыв их). Сверху насыпать рис ровным слоем. Аккуратно залить рис овощным бульоном, так, чтобы вода поднялась над рисом на 5-7 мм. Накрыть сверху крышкой. Тушить 30 минут. Если видите, что бульон выкипел, а рис еще не готов, добавите еще немного бульона. Откройте крышку и аккуратно переверните рис. Выключите огонь. Дайте настояться плову еще некоторое время. Плов готов. Приятного аппетита!',
    imgFirstName: AppImages.plovSoSvininoi480,
  );

  int get currentTableIndex => _currentTableIndex;
  // int get currentDayIndex => _currentDayIndex;
  // int get currentMeelIndex => _currentMeelIndex;
  // int get currentRecipeId => _currentRecipeId;
  // Recipe get currentRecipe => _currentRecipe;
  // Recipe set currentRecipe => _currentRecip;

  void onItemTapped(int value) {
    _currentTableIndex = value;
    print('_currentTableIndex = $_currentTableIndex');
    notifyListeners();
  }
}