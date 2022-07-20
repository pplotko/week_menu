import 'package:week_menu/resources/resources.dart';
import 'package:week_menu/widgets/recipe.dart';

List<Recipe> LoadRecipes() {
  final recipes = [
    Recipe(
      id: 0,
      imageName: [
        AppImages.kotletiKlassicheskie2480300x233,
        // AppImages.plovSoSvininoi480,
      ],
      title: 'Котлеты классические (свинина + курица)',
      time: 'December 17, 2021',
      description:
        "1. Готовим фарш, перекручиваем мясо (свинину и курицу) на тонкой сетке мясорубки 2 раза.\n"
        "2. Лук сразу мелко мелко шинкуем. Обжариваем (если планируем заморозку). Добавляем в фарш.\n"
        "3. Хлебный мякиш (батон) отправляем в кипяток размочиться (или в молоко).\n"
        "4. Выдавливаем чеснок, солим и перчим по вкусу.\n"
        "5. Добавляем в мясо хлеб, пропустив через мясорубку и тщательно все перемешиваем.\n"
        "6. Сейчас руками сформируем мясные шарики и немного приплюснем. Руки при этом мочим в холодной воде, чтобы фарш не прилипал к ним.\n"
        "7. Теперь обваляем котлеты в муке или можно использовать любую другую панировку.\n"
        "8. Сначала одну сторону обжариваем на среднем огне, потом убавляем огонь до маленького, переворачиваем котлетки и накрываем крышкой.\n"
        "9. Добавляем к котлетам воды и тушим до готовности.\n"
        "10. Котлетки готовы. Приятного аппетита!\n",
      imgFirstName: AppImages.kotletiKlassicheskie2480300x233,
    ),
    Recipe(
      id: 1,
      imageName: [AppImages.plovSoSvininoi480,],
      title: 'Плов со свининой',
      time: 'December 17, 2021',
      description:
        "1. Помыть и порезать на куски свинину.\n"
        "2. В сковороду (или казан) налить масло подсолнечное. Раскалить.\n"
        "3. Нарезать лук и обжарить его в масле.\n"
        "4. Свинину посолить, поперчить, положить в масло. Обжарить на большом огне.\n"
        "5. Убавить огонь почти до минимума и тушить 10 минут.\n"
        "6. Пока готовится свинина поставьте овощной бульон: \n"
            "налить воду в кастрюлю и поставить на огонь. \n"
            "Лук и морковь хорошо промыть (чистить от кожуры не нужно!!!, т.е. лук должен быть в кожуре). "
            "Разрезать лук, морковь и стебель сельдерея напополам и положите разрезанными сторонами на сковородку без масла. "
            "Обжарить 2-3 минуты и закинуть в бульон. Как закипит вода, убавить огонь и варить бульон на слабом огне. "
            "Бульон будет вариться на протяжении всего времени приготовления блюда, т.к. периодически нужно будет подливать"
            " бульон в рис до его полной готовности.\n"
        "7. Потереть морковь на крупной терке. Выложить сверху мяса ровным слоем и тушить еще 10 минут.\n"
        "8. Рис промыть. Добавить в него 1 чайную ложку специй для плова и 1 чайную ложку соли, перемешать.\n"
        "9. Открыть крышку и положить 2 головки чеснока не чищенные (предварительно помыв их)."
        " Сверху насыпать рис ровным слоем.\n"
        "10. Аккуратно залить рис овощным бульоном, так, чтобы вода поднялась над рисом на 5-7 мм. Накрыть сверху крышкой."
            " Тушить 30 минут. Если видите, что бульон выкипел, а рис еще не готов, добавите еще немного бульона.\n"
        "11. Откройте крышку и аккуратно переверните рис. Выключите огонь.\n"
        "12. Дайте настояться плову еще некоторое время.\n"
        "13. Плов готов. Приятного аппетита!\n",
      imgFirstName: AppImages.plovSoSvininoi480,
    ),
    Recipe(
      id: 2,
      imageName: [AppImages.otbivnaya,],
      title: 'Отбивная из свинины',
      time: 'December 17, 2021',
      description: 'Порезать на куски вырезку из свинины или филе, отбить. Обмакнуть во всбитом яйце с солью и специями, а затем в муке. Жарить на сковороде с двух сторон до хрустящей корочки.',
      imgFirstName: AppImages.otbivnaya,
    ),
    Recipe(
      id: 3,
      imageName: [AppImages.dranikiSMyasom,],
      title: 'Драники с мясом',
      time: 'December 17, 2021',
      description:
      "1. Итак, очистите картофель и натрите его на мелкую терку. Слейте лишнюю жидкость.\n"
      "2. Добавьте в картофельное пюре яйцо, сметану, муку, а также одну головку лука, также натертую на терку.\n"
      "3. Посолите и поперчите по вкусу.\n"
      "4. Отдельно смешайте фарш со второй натертой луковицей. Добавьте чуть воды. Посолите и поперчите.\n"
      "5. Разогрейте масло на сковороде. При помощи ложки сформируйте небольшие оладьи. Обжарьте их с одной стороны и положите сверху начинку из мяса.\n"
      "6. Затем накройте начинку второй порцией сырого картофельного фарша и переверните.\n"
      "7. Обжаривайте до готовности.\n"
      "8. Подавайте со сметаной! Приятного аппетита!\n",
      imgFirstName: AppImages.dranikiSMyasom,
    ),
    Recipe(
      id: 4,
      imageName: [AppImages.kotletiKlassicheskie2480300x233,],
      title: 'КОТЛЕТЫ КЛАССИЧЕСКИЕ (СВИНИНА + КУРИЦА)',
      time: 'December 17, 2021',
      description: 'Готовим фарш, перекручиваем мясо (свинину и курицу) на тонкой сетке мясорубки 2 раза. Лук сразу мелко мелко шинкуем. Обжариваем (если планируем заморозку). Добавляем в фарш. Хлебный мякиш отправляем в кипяток размочиться. Выдавливаем чеснок, солим и перчим по вкусу. Добавляем в мясо хлеб, пропустив через мясорубку и тщательно все перемешиваем. Сейчас руками сформируем мясные шарики и немного приплюснем. Руки при этом мочим в холодной воде, чтобы фарш не прилипал к ним. Теперь обваляем котлеты в муке или можно использовать любую другую панировку. Сначала одну сторону обжариваем на среднем огне, потом убавляем огонь до маленького, переворачиваем котлетки и накрываем крышкой. Добавляем к котлетам воды и тушим. После доводим до готовности и готово. Котлетки готовы. Приятного аппетита!',
      imgFirstName: AppImages.kotletiKlassicheskie2480300x233,
    ),
    Recipe(
      id: 5,
      imageName: [AppImages.kotletiKlassicheskie2480300x233,],
      title: 'Котлеты классические (свинина + курица)',
      time: 'December 17, 2021',
      description: 'Готовим фарш, перекручиваем мясо (свинину и курицу) на тонкой сетке мясорубки 2 раза. Лук сразу мелко мелко шинкуем. Обжариваем (если планируем заморозку). Добавляем в фарш. Хлебный мякиш отправляем в кипяток размочиться. Выдавливаем чеснок, солим и перчим по вкусу. Добавляем в мясо хлеб, пропустив через мясорубку и тщательно все перемешиваем. Сейчас руками сформируем мясные шарики и немного приплюснем. Руки при этом мочим в холодной воде, чтобы фарш не прилипал к ним. Теперь обваляем котлеты в муке или можно использовать любую другую панировку. Сначала одну сторону обжариваем на среднем огне, потом убавляем огонь до маленького, переворачиваем котлетки и накрываем крышкой. Добавляем к котлетам воды и тушим. После доводим до готовности и готово. Котлетки готовы. Приятного аппетита!',
      imgFirstName: AppImages.kotletiKlassicheskie2480300x233,
    ),
    Recipe(
      id: 6,
      imageName: [AppImages.gerkulesovayaKashaNaVodeVkusno15217941115Max,],
      title: 'Овсяная каша на молоке',
      time: 'December 17, 2021',
      description:
        'Ингредиенты: (4-6 порций)\n'
        ' 2,5 стакана молока\n'
        ' 1 стакан овсяной крупы Геркулес\n'
        ' 1-2 ст.л. сахара\n'
        ' 1 щепотка соли\n'
        ' 30 гр. сливочного масла',
      imgFirstName: AppImages.gerkulesovayaKashaNaVodeVkusno15217941115Max,
    ),
  ];
  return recipes;
}