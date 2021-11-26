import 'package:flutter/material.dart';

// setState(VoidCallback fn);
// обратите внимание setState принимает другую функцию
class HomePage extends StatefulWidget {
  // StatefulWidget должен возвращать класс,
  // которые наследуется от State
  @override
  _HomePageState createState() => _HomePageState();
}

// В треугольных скобках мы указываем наш StatefulWidget
// для которого будет создано состояние
// нижнее подчеркивание _ используется для того,
// чтобы скрыть доступ к _HomePageState  из других файлов
// нижнее подчеркивание аналогия private в Java / Kotlin
class _HomePageState extends State<HomePage> {

  var _counter = 0;

   @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home page")),
      body: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 900),
            reverseDuration: const Duration(milliseconds: 0),
            child: Text(
              // вывод значения счетчика
              // при каждой перерисовки виджетов _counter
              // увеличивается на единицу
              "$_counter",
              key: ValueKey<int>(_counter),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3,
            ),
          )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.animation),
        onPressed: () {
          setState(() {
          _counter++;
          });
        },
      ),
    );
  }
}
