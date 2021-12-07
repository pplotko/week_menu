import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:json_placeholder_app/resources/resources.dart';

class RecipeListWidget extends StatelessWidget {
  const RecipeListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(color: Colors.green);
  final img = AssetImage(AppImages.kotletiKlassicheskie2480300x233);
    return ListView.builder(
      itemCount: 10,
      itemExtent: 163,
      itemBuilder: (BuildContext context, int index) {
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
                    children: [Image(image: img),
                    SizedBox(width: 15),
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Text('КОТЛЕТЫ КЛАССИЧЕСКИЕ (СВИНИНА + КУРИЦА)',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,),
                            ),
                            SizedBox(height: 5),
                            Text('17.12.2021',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.grey,),
                            ),
                            SizedBox(height: 20),
                            Text('Готовим фарш, перекручиваем мясо (свинину и курицу) на тонкой сетке мясорубки 2 раза. Лук сразу мелко мелко шинкуем. Обжариваем (если планируем заморозку). Добавляем в фарш. Хлебный мякиш отправляем в кипяток размочиться. Выдавливаем чеснок, солим и перчим по вкусу. Добавляем в мясо хлеб, пропустив через мясорубку и тщательно все перемешиваем. Сейчас руками сформируем мясные шарики и немного приплюснем. Руки при этом мочим в холодной воде, чтобы фарш не прилипал к ним. Теперь обваляем котлеты в муке или можно использовать любую другую панировку. Сначала одну сторону обжариваем на среднем огне, потом убавляем огонь до маленького, переворачиваем котлетки и накрываем крышкой. Добавляем к котлетам воды и тушим. После доводим до готовности и готово. Котлетки готовы. Приятного аппетита!',
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
    );
  }
}
