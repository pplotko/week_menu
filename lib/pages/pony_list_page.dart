import 'package:flutter/material.dart';
import 'pony_detail_page.dart';
// класс пони, который будет хранить имя и описание, а также id
class Pony {
  final int id;
  final String name;
  final String desc;

  Pony(this.id, this.name, this.desc);
}

// создаем список пони
// final указывает на то, что мы больше
// никогда не сможем присвоить имени ponies
// другой список поняшек
final List<Pony> ponies = [
  Pony(
      0,
      "Twillight Sparkle",
      "Twilight Sparkle is the central main character of My Little Pony Friendship is Magic. She is a female unicorn pony who transforms into an Alicorn and becomes a princess in Magical Mystery Cure"
  ),
  Pony(
      1,
      "Starlight Glimmer",
      "Starlight Glimmer is a female unicorn pony and recurring character, initially an antagonist but later a protagonist, in the series. She first possibly appears in My Little Pony: Friends Forever Issue and first explicitly appears in the season five premiere."
  ),
  Pony(
      2,
      "Applejack",
      "Applejack is a female Earth pony and one of the main characters of My Little Pony Friendship is Magic. She lives and works at Sweet Apple Acres with her grandmother Granny Smith, her older brother Big McIntosh, her younger sister Apple Bloom, and her dog Winona. She represents the element of honesty."
  ),
  Pony(
      3,
      "Pinkie Pie",
      "Pinkie Pie, full name Pinkamena Diane Pie,[note 2] is a female Earth pony and one of the main characters of My Little Pony Friendship is Magic. She is an energetic and sociable baker at Sugarcube Corner, where she lives on the second floor with her toothless pet alligator Gummy, and she represents the element of laughter."
  ),
  Pony(
      4,
      "Fluttershy",
      "Fluttershy is a female Pegasus pony and one of the main characters of My Little Pony Friendship is Magic. She lives in a small cottage near the Everfree Forest and takes care of animals, the most prominent of her charges being Angel the bunny. She represents the element of kindness."
  ),
  Pony(
      5,
      "Борщ",
      "Вкусный супчик."
  ),
];

// PonyListPage не будет иметь состояния,
// т.к. этот пример создан только для демонстрации
// навигации в действии
class PonyListPage extends StatelessWidget {
  const PonyListPage({Key? key}) : super(key: key);

  // build как мы уже отметили, строит
  // иерархию наших любимых виджетов
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pony List Page")),
      // зададим небольшие отступы для списка
      body: Padding(
        // объект EdgeInsets хранит четыре важные double переменные:
        // left, top, right, bottom - отступ слева, сверху, справа и снизу
        // EdgeInsets.all(10) - задает одинаковый отступ со всех сторон
        // EdgeInsets.only(left: 10, right: 15) - задает отступ для
        // определенной стороны или сторон
        // EdgeInsets.symmetric - позволяет указать одинаковые
        // отступы по горизонтали (left и right) и по вертикали (top и bottom)
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          // создаем наш список
          child: ListView(
            children: ponies.map<Widget>((pony) {
              // Material используется для того,
              // чтобы указать цвет элементу списка
              // и применить ripple эффект при нажатии на него
              return Material(
                color: Colors.pinkAccent,
                // InkWell позволяет отслеживать
                // различные события, например: нажатие
                child: InkWell(
                  // splashColor - цвет ripple эффекта
                  splashColor: Colors.pink,
                  // нажатие на элемент списка
                  onTap: () {
                    // Здесь мы используем сокращенную форму:
                    // Navigator.of(context).push(route)
                    // PonyDetailPage принимает pony id,
                    // который мы и передали
                    Navigator.push(context, MaterialPageRoute(
                    builder: (context) => PonyDetailPage(pony.id)
                    ));
                  },
                  // далее указываем в качестве
                  // элемента Container с вложенным Text
                  // Container позволяет указать внутренние (padding)
                  // и внешние отступы (margin),
                  // а также тень, закругление углов,
                  // цвет и размеры вложенного виджета
                  child: Container(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                          pony.name,
                          style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white)
                      )
                  ),
                ),
              );
              // map возвращает Iterable объект, который необходимо
              // преобразовать в список с помощью toList() функции
            }).toList(),
          )
      ),
    );
  }
}